# Creating a Sink into BigQuery

### 1. Go to Logging/Log Router and Click Create Sink

Navigate to **Logging** > **Log Router** in the Google Cloud Console, and then click on **Create Sink**.
![image](https://github.com/user-attachments/assets/1fafbc17-7544-4306-93ca-02538d31c087)

### 2. Choose BigQuery as a Destination and Set Up a Filter

When creating the sink, select **BigQuery** as the destination. Set up a filter to determine which logs should be sent to the BigQuery table.
![image](https://github.com/user-attachments/assets/0b3ffb4e-40ae-4756-a8ee-be23d3543ab9)

### 3. Logs that Match the Filter Condition Will Be Inserted into the BigQuery Table

Once the sink is created, logs that match the filter condition will automatically be inserted into the specified BigQuery table.
![image](https://github.com/user-attachments/assets/ab3745ff-26ca-4248-8cfb-0688197fe6b5)

### 4. Run Queries to Fetch the Data

You can now query the logs in BigQuery using SQL. For example, to fetch logs for the last 24 hours, you can use the following query:

```sql
SELECT
  JSON_VALUE(jsonPayload.message) AS message,
  labels.run_id AS run_id,
  resource.labels.project_id AS project_id,
  resource.labels.config_id AS config_id,
  timestamp,
  severity,
  operation.id AS operation_id,
  operation.producer AS producer,
  operation.first AS is_first,
  operation.last AS is_last
FROM
   `theta-topic-457803-u2.Logs.bigquerydatatransfer_googleapis_com_transfer_config`
WHERE
  timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
ORDER BY
  timestamp DESC
```
![image](https://github.com/user-attachments/assets/8bb8e603-bb80-4a2e-ace2-3165a514dbb1)
