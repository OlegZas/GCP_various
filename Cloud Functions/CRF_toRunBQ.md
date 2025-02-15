# Cloud Run Function for BigQuery Query

The Cloud Run function runs a query on a BigQuery table.

![image](https://github.com/user-attachments/assets/9a9fb7de-957d-47d4-a5de-c7758732c926)

## `main.py` - Python Code for Cloud Run Function

This Python code for the Cloud Run function queries BigQuery and returns the results in HTML format.

```python
from google.cloud import bigquery
import pandas as pd

# Initialize a BigQuery client
def run_bigquery_query(request):
    try:
        # Initialize the BigQuery client inside the function
        client = bigquery.Client()

        # Query to run on BigQuery
        query = """
        SELECT name
        FROM `dataprocapachehive.Snowflake.OZ_BQ1`
        LIMIT 10
        """

        # Run the query and get the results into a Pandas DataFrame
        query_job = client.query(query)  # Make an API request
        df = query_job.to_dataframe()    # Fetch the results into a DataFrame

        # Convert the DataFrame to HTML format for the response
        return df.to_html(), 200  # Return the DataFrame in HTML format

    except Exception as e:
        # If an error occurs, log and return the error
        return f"Error occurred: {str(e)}", 500

# Entry point for the Cloud Function
if __name__ == "__main__":
    print(run_bigquery_query(None))  # Call the function for local testing (not needed for Cloud Functions)
```

## `requirements.txt` - Dependencies

Make sure to include the following dependencies in your `requirements.txt` file:

```txt
functions-framework==3.*
google-cloud-bigquery
pandas
db-dtypes
```

## Use Shell to Run the `curl` Command

To test the deployed Cloud Function, you can run the following `curl` command in your shell:

```bash
curl https://us-central1-dataprocapachehive.cloudfunctions.net/BQ_Integration_PY -H "Authorization: Bearer $(gcloud auth print-identity-token)"
