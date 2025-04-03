# Dataflow

- Dataflow provides unified streaming and batch data processing that's serverless, fast, and cost-effective.
- Serverless and autoscaling.
- Based on Apache Beam (supports Java, Python, Go, etc.).
- Has pre-built templates:
    - **Ex:**
        - Pub/Sub > Dataflow > BigQuery (streaming pipeline)
        - Pub/Sub > Dataflow > Cloud Storage (streaming – files)
        - Cloud Storage > Dataflow > Bigtable/Cloud Spanner/Datastore/BigQuery (Batch – Load data into databases)
        - Bulk compress files in Cloud Storage (batch)
![image](https://github.com/user-attachments/assets/0dae491c-795f-4c85-af59-2fb4b3af5ecf)

        - Convert file formats between Avro, Parquet & CSV (batch)
![image](https://github.com/user-attachments/assets/1b18f23c-6af1-4c3f-b98b-f5304572b12f)
