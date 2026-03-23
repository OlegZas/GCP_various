import os
import pandas as pd
from sqlalchemy import create_engine, text
from google.cloud import bigquery

# CONFIGURATION (Set these in GitHub Secrets)
DB_USER = os.environ.get("DB_USER")
DB_PASS = os.environ.get("DB_PASSWORD")
DB_NAME = os.environ.get("DB_NAME", "postgres")
DB_HOST = os.environ.get("DB_HOST")
PROJECT_ID = "app-orf-cn-qa-5qu9"

def get_engine():
    # Note: If using Private IP in VPC, DB_HOST is the internal IP
    conn_url = f"postgresql+psycopg2://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}"
    return create_engine(conn_url)

def main():
    # Example: Syncing a specific range or ID for testing
    TARGET_ID = 1001 
    
    engine = get_engine()
    bq_client = bigquery.Client(project=PROJECT_ID)

    with engine.begin() as conn:
        print(f"Step 1: Flagging local record {TARGET_ID}...")
        conn.execute(text("""
            UPDATE network_ops.customer_inventory 
            SET status = 'TO_BE_VALIDATED' 
            WHERE customer_id = :cid AND status != 'RETIRED'
        """), {"cid": TARGET_ID})

        print("Step 2: Pulling from BigQuery...")
        # We flatten the STRUCT address into your specific SQL columns
        bq_sql = f"""
            SELECT 
                customer_id, first_name, last_name,
                service_address.street AS street_address,
                service_address.city, service_address.state,
                CAST(service_address.zip_code AS STRING) AS zip_code,
                ont_id, ont_serial_number, ont_model,
                router_id, router_mac_address, router_model,
                activation_date, service_plan,
                'VALIDATED' as status
            FROM `network_operations.customer_inventory`
            WHERE customer_id = {TARGET_ID}
        """
        df = bq_client.query(bq_sql).to_dataframe()

        if not df.empty:
            print("Step 3: Found record. Performing Upsert...")
            df.to_sql("temp_sync", conn, schema="network_ops", if_exists="replace", index=False)
            
            # Map every column to the EXCLUDED values from the temp table
            upsert_query = text("""
                INSERT INTO network_ops.customer_inventory (
                    customer_id, first_name, last_name, street_address, city, state, zip_code,
                    ont_id, ont_serial_number, ont_model, router_id, router_mac_address, 
                    router_model, activation_date, service_plan, status
                )
                SELECT * FROM network_ops.temp_sync
                ON CONFLICT (customer_id) DO UPDATE SET
                    first_name = EXCLUDED.first_name,
                    last_name = EXCLUDED.last_name,
                    street_address = EXCLUDED.street_address,
                    city = EXCLUDED.city,
                    state = EXCLUDED.state,
                    zip_code = EXCLUDED.zip_code,
                    ont_id = EXCLUDED.ont_id,
                    ont_serial_number = EXCLUDED.ont_serial_number,
                    ont_model = EXCLUDED.ont_model,
                    router_id = EXCLUDED.router_id,
                    router_mac_address = EXCLUDED.router_mac_address,
                    router_model = EXCLUDED.router_model,
                    activation_date = EXCLUDED.activation_date,
                    service_plan = EXCLUDED.service_plan,
                    status = EXCLUDED.status,
                    last_updated = CURRENT_TIMESTAMP;
            """)
            conn.execute(upsert_query)
        else:
            print("Step 3: Record missing in BQ. It will be retired in the next step.")

        print("Step 4: Retiring missing records...")
        conn.execute(text("""
            UPDATE network_ops.customer_inventory 
            SET status = 'RETIRED' 
            WHERE status = 'TO_BE_VALIDATED' AND customer_id = :cid
        """), {"cid": TARGET_ID})

    print("Job Finished Successfully.")

if __name__ == "__main__":
    main()
