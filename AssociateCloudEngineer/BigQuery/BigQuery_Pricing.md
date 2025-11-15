# BigQuery Pricing

## 1. Storage Pricing

- **10GB per month is free**
- **Active Storage**: Used during 90 days or less.
- **Long-term Storage**: Data not used for 90 days.
- **Two Billing Models**:
  - **Logical Storage Billing (DEFAULT)**:  
    Data is billed based on the logical size of the data stored, which includes all indexes, metadata, and any additional overhead. It reflects the uncompressed size of your data as it is logically represented in BigQuery.
  - **Physical Storage Billing**:  
    Data is billed based on the physical (compressed) size, which represents how the data is actually stored on disk after compression.
<img width="592" height="744" alt="image" src="https://github.com/user-attachments/assets/df8da0ee-7b58-4335-9783-390e5c4a5ce2" />

- **To check the model used**, click on the dataset **"Edit Details"** to verify the billing model.
<img width="975" height="592" alt="image" src="https://github.com/user-attachments/assets/d8124f83-1257-4bf6-ad37-5a7a527f2bfb" />

## 2. Compute Pricing / Query Processing
- **1TB per month is free** for query processing.
- **On-demand Pricing**:  
  Charged based on the amount of data processed by each query in TB. This is ideal for variable workloads (if you don't know the frequency or volume, or if it fluctuates).
  
- **Flat-rate Pricing**:  
  Purchase query capacity ahead of time if you know your query demands and need predictable costs.

## 3. Streaming Inserts
- Pricing for streaming data inserts into BigQuery.

## 4. BI Engine Memory
- Pricing for the BigQuery BI Engine memory (a caching layer that speeds up queries for BI tools like Data Studio).

## 5. Data Transfers and Exports
- Costs associated with transferring data to and from BigQuery (e.g., exporting data to Cloud Storage, or transferring data between regions).

<img width="975" height="569" alt="image" src="https://github.com/user-attachments/assets/46f5270d-cd2e-4541-9268-008558a263f5" />
