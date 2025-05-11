### Setting Up a BigQuery Scheduled Query with Pub/Sub Integration and Saving Query Metrics

#### 1. Create a Pub/Sub Topic

Create a Pub/Sub topic that will receive messages from scheduled query executions. This topic acts as the communication channel between your scheduled query and downstream processes.

```bash
# Create a new Pub/Sub topic using gcloud CLI
gcloud pubsub topics create YOUR-TOPIC-NAME
```
![image](https://github.com/user-attachments/assets/4007e589-0d3a-45da-abb0-f0e5971597e3)

#### 2. Configure Service Account Permissions

If the Google-managed service account needs additional permissions to insert data into BigQuery tables:

1. Navigate to your BigQuery table  
2. Click the three dots (⋮) in the table's row  
3. Select **"Share"**  
4. Click **"Add principal"**  
5. Enter the service account email address  
6. Assign the **"BigQuery Data Editor"** role  
7. Click **"Save"**

> **Note**: The service account typically follows this format:  
> `service-PROJECT_NUMBER@gcp-sa-pubsub.iam.gserviceaccount.com`

![image](https://github.com/user-attachments/assets/b66dfd4f-73db-4355-b501-dc44c8472da1)

![image](https://github.com/user-attachments/assets/b2b3ba7e-3f6f-487a-9894-6d7e95583491)

![image](https://github.com/user-attachments/assets/ff92d4f4-530a-4e63-b316-c060ab1b72e8)

#### 3. Create a Scheduled Query with Pub/Sub Output

Configure a BigQuery scheduled query that sends results to your Pub/Sub topic:

```sql
-- Example scheduled query
SELECT 
  field1,
  field2,
  COUNT(*) AS count
FROM `project.dataset.table`
GROUP BY field1, field2
```

When setting up the scheduled query:

1. Go to the **"Schedule"** section.
2. Set your desired frequency (hourly, daily, etc.).
3. Under **"Destination"**, select **"Write to Pub/Sub"**.
4. Choose the topic you created in **Step 1**.

![image](https://github.com/user-attachments/assets/f7a3590d-0347-4785-96f6-66074e8d25f6)

#### 4. Create a Pub/Sub Subscription to BigQuery

Set up a subscription that automatically writes messages from your Pub/Sub topic to a BigQuery table.

You can use **Dataflow**, **Cloud Functions**, or **Pub/Sub to BigQuery subscriptions** (if using schema-compatible messages). Here's an example using a BigQuery subscription:

```bash
# Example using gcloud to create a subscription that writes to BigQuery
gcloud pubsub subscriptions create YOUR-SUBSCRIPTION-NAME \
  --topic=YOUR-TOPIC-NAME \
  --bigquery-table=PROJECT_ID:DATASET.TABLE_NAME \
  --use-topic-schema
```
![image](https://github.com/user-attachments/assets/74341b46-3904-4ed7-9459-3168d55586ed)

#### 5. Decoded Data About Query Performance is Inserted

Once the scheduled query executes and publishes to the Pub/Sub topic, the decoded data about the query performance is inserted into the designated BigQuery table. This data can include information such as:

- Query execution time
- Slot usage
- Query status (success/failure)
- Error details (if applicable)
![image](https://github.com/user-attachments/assets/e9bdef16-4adf-46c0-9d7c-3e50cb94f4a4)

#### 6. Decode the Table to Get the Desired Metrics

You can query the BigQuery table receiving the Pub/Sub messages to extract performance metrics, such as execution time, slot usage, or error details.
![image](https://github.com/user-attachments/assets/8c7e8520-ea85-42c7-bcb6-d588efcbe879)

