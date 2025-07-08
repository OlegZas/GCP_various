from flask import Request
from google.cloud import storage
import os
import logging
import json

# Setup logging
logging.basicConfig(level=logging.INFO)

# Constants
DESTINATION_BUCKET = os.environ.get("INVALID_FILES_BUCKET", "oz-2ndbucket-tomove").strip()
LARGE_FILE_PREFIX = "large_files/"
MAX_FILE_SIZE_MB = 2
MAX_FILE_SIZE_BYTES = MAX_FILE_SIZE_MB * 1024 * 1024

def ozmovingfiles(request: Request):
    """HTTP-triggered function for Cloud Run. Expects GCS event in JSON body."""
    try:
        event = request.get_json()
        if not event:
            logging.error("Invalid or missing JSON payload")
            return ("Bad Request: Missing JSON", 400)

        # Try to extract actual GCS notification from Pub/Sub wrapper if present
        if 'message' in event and 'data' in event['message']:
            import base64
            decoded_data = base64.b64decode(event['message']['data']).decode('utf-8')
            event = json.loads(decoded_data)

        source_bucket_name = event.get('bucket')
        file_name = event.get('name')

        if not source_bucket_name or not file_name:
            logging.warning("Missing bucket or file name in the event.")
            return ("Missing data", 400)

        logging.info(f"Received trigger for file: {file_name} in bucket: {source_bucket_name}")

        storage_client = storage.Client()
        source_bucket = storage_client.bucket(source_bucket_name)
        blob = source_bucket.blob(file_name)

        try:
            blob.reload()
        except Exception as e:
            logging.error(f"Failed to reload blob metadata for {file_name}: {e}")
            return ("Blob reload error", 500)

        file_size = blob.size
        if file_size is None:
            logging.warning(f"File size is None for {file_name}. Skipping.")
            return ("No size info", 200)

        if file_size > MAX_FILE_SIZE_BYTES:
            destination_bucket = storage_client.bucket(DESTINATION_BUCKET)
            destination_path = f"{LARGE_FILE_PREFIX}{file_name}"
            source_bucket.copy_blob(blob, destination_bucket, destination_path)
            blob.delete()

            logging.info(
                f"📦 File '{file_name}' ({file_size / (1024 * 1024):.2f} MB) "
                f"moved to '{DESTINATION_BUCKET}/{destination_path}' due to size > {MAX_FILE_SIZE_MB} MB."
            )
        else:
            logging.info(
                f"✅ File '{file_name}' is within the allowed size limit ({file_size} bytes). No action taken."
            )

        return ("OK", 200)

    except Exception as e:
        logging.error(f"Exception occurred: {e}")
        return (f"Internal Server Error: {e}", 500)
