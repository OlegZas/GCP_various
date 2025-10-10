# BigQuery External Tables

A **BigQuery External Table** is a table in BigQuery that **refers to data stored outside of BigQuery**, such as in **Google Cloud Storage (GCS)**, **Google Drive**, or other external data sources — **without loading the data into BigQuery**.
<img width="975" height="290" alt="image" src="https://github.com/user-attachments/assets/917dd8d8-4045-42a5-a567-6599fad5eaf8" />

---

##  Comparison: External vs Native (Internal) Tables

| **Feature** | **External Table** | **Native (Internal) Table** |
|--------------|--------------------|------------------------------|
| **Data Location** | Data stays outside BigQuery (e.g., in Cloud Storage, Google Drive, or BigLake). | Data is stored inside BigQuery. |
| **Storage Cost** | No BigQuery storage cost — you pay only for the data’s original storage location and query reads. | You pay BigQuery storage costs for the data. |
| **Performance** | Usually slower, because data is read from external storage each time. | Faster, since data is optimized and indexed inside BigQuery. |
| **Use Case** | Best for ad-hoc analysis, data exploration, or when you don’t want to duplicate data. | Best for frequent queries, transformations, and production workloads. |
| **Schema Updates** | Must be managed manually; schema inference can be limited. | More flexible with schema evolution and updates. |

---

##  Creating an External Table

1. To create an external table in BigQuery, use the following SQL statement:

```sql
CREATE EXTERNAL TABLE `oz-gcp.BIGQUERY.ExternalOZ`
OPTIONS (
  format = 'CSV',
  uris = ['gs://oz-cloudsql-bucket/ExternalTablesBQ.csv'],
  skip_leading_rows = 1  -- optional, if your CSV has headers
);
```

2. The external table will not have a PREVIEW (unlike native)
<img width="903" height="610" alt="image" src="https://github.com/user-attachments/assets/24dc0286-b78d-42f4-9ad5-00eab6e702d2" />
