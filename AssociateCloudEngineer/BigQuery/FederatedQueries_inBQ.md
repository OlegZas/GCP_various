# Big Query: Federated Queries

## BigQuery Federated Queries: What Are They?

Federated queries in BigQuery allow you to run SQL queries that reference data stored outside of BigQuery. Instead of loading external data into BigQuery tables, federated queries enable you to query the external data directly from its original source, such as a Google Cloud Storage bucket, a Cloud SQL database, or other external sources supported by BigQuery.

## Key Features of Federated Queries:

- **External Data Sources**: Federated queries enable you to query data from external databases or files (like MySQL, PostgreSQL, or CSV/JSON files in Google Cloud Storage).
- **No Data Import**: You don't need to import or copy the external data into BigQuery. The query is executed in-place over the external data, which means you only pay for the query processing, not for data storage.
- **Real-Time Access**: You can access external data in real-time without needing to maintain copies of that data in BigQuery.
- **External Tables**: BigQuery creates a reference to the external data (called an external table) and allows you to query it just like any other BigQuery table.

## Why Use Federated Queries?

Federated queries are useful for scenarios where:

1. **You Don’t Want to Move Data**:
   - If your data is already stored in a relational database like MySQL or PostgreSQL (in Cloud SQL), or in an object storage system like Google Cloud Storage, using federated queries allows you to access that data without moving it to BigQuery. This helps save time and cost associated with data transfer and duplication.

2. **Query External Data Sources**:
   - You can access and analyze external data directly, which might be too large or complex to move to BigQuery.
   - For example, you can run queries against a Cloud SQL instance or a Cloud Storage bucket while combining that with BigQuery's own data in your queries.

3. **Real-Time Analytics**:
   - Federated queries enable near real-time querying of external data, providing you with fresh data without needing to load it into BigQuery or sync it frequently.
   - This is useful for live reporting or on-demand analytics.

4. **Reduce Cost and Complexity**:
   - Without federated queries, you'd have to create a copy of the data (through a data import process) into BigQuery, which could be costly and time-consuming. Federated queries eliminate this need, saving both time and cost.
   - You can query external data directly without paying for storage in BigQuery (you only pay for the query processing).

5. **Integrate Multiple Data Sources**:
   - Federated queries make it easy to perform joins and combine data from multiple external sources (e.g., Cloud SQL, Cloud Storage, etc.) alongside data stored within BigQuery. This enables a more comprehensive analysis.

## How Do Federated Queries Work?

When you create a federated query in BigQuery, you reference the external data using an external table. This external table doesn’t store the data in BigQuery but serves as a reference to the external data source. Here’s how it works step-by-step:

1. **Create an External Table**:
   - Define an external table that points to the external data source. For example, when connecting to a MySQL Cloud SQL instance, BigQuery will access the database through the external connection and create an external table to that source.
   - For Google Cloud Storage, you can reference CSV, JSON, or Avro files stored in a bucket.

2. **Run SQL Queries**:
   - Once the external table is set up, you can run SQL queries as if the data were in a regular BigQuery table.
   - BigQuery executes the query by connecting to the external data source and fetching the necessary data in real-time.

3. **Result Set**:
   - The result of the query will contain a mix of data from BigQuery tables and the external sources. You can combine data from external tables with BigQuery native tables, just like you would with any other table in BigQuery.

## How to Set Up BigQuery Federation:

### 1. Ensure that your database instance (CloudSQL, Spanner, etc.) is running.
### 2. In BigQuery, click on **Add Data** and choose the SQL dialect version.

<img width="975" height="512" alt="image" src="https://github.com/user-attachments/assets/e671be24-5625-4053-ad4a-3de85e6d486a" />

### 3. Choose **BigQuery Federation**.

<img width="975" height="557" alt="image" src="https://github.com/user-attachments/assets/24e49670-f1c9-49a5-8f69-2929790d2247" />

### 4. Configure and create a connection.

<img width="636" height="880" alt="image" src="https://github.com/user-attachments/assets/5cc040ec-aa88-4929-bbce-590cb2249d76" />

### 5. In BigQuery, under the project, go to **Connections** and click on your connection. Copy the service account ID — you need to add SQL Client permission to this service account. Go to **IAM > Grant Access**, paste the service account ID from your connection, add **SQL Client** permission, and save.

<img width="975" height="412" alt="image" src="https://github.com/user-attachments/assets/66fe0590-55f5-4616-a6af-3b4622524471" />

### 6. Query the database as needed.
<img width="975" height="441" alt="image" src="https://github.com/user-attachments/assets/dbd72b7e-fe47-4b6d-b573-47f9d8b8b3e4" />
