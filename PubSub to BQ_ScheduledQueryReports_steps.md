# Scheduled Query Execution Reports

## Goal

Set up a metrics table to evaluate the performance of all scheduled query runs under a specific project.

---

## 1. Create a Simple Topic

- No need to define an Avro schema.

---

## 2. Subscriber for the Topic

### a. Destination
- Write to BigQuery.
- Use table schema.

### b. Message Retention Duration

Gives your subscriber enough time to catch up in case of failures or downtimes.

- **Acknowledged Message:**
  1. You processed it successfully, and your subscriber sent an ack.
  2. ✅ Pub/Sub removes it from the queue.

- **Unacknowledged Message:**
  1. Your subscriber crashed, timed out, or failed to ack.
  2. Or you didn’t send an ack within the acknowledgment deadline (e.g., 10–60 seconds).
  3. It will keep retrying until:
     - The message is acknowledged, or
     - The retention period expires (e.g., 7 days), or
     - The max delivery attempts (if dead-lettering is enabled) are exceeded.

### c. Other Configurations

- **Expiration period:** Never expire  
- **Acknowledgement deadline:** 10 seconds  
- **Transforms:** Optionally transform data columns before inserting  
- **Retry policy:** Retry after exponential backoff, minimum 10 seconds, maximum 600 seconds

---

## 🔍 TIP

To check what columns could be obtained from the message, set the subscriber to `PULL` mode to obtain the actual message payload.

---

## 📦 Sample Message Body

<details>
<summary>Click to expand</summary>

```json
{
  "dataSourceId": "scheduled_query",
  "destinationDatasetId": "",
  "emailPreferences": {
    "enableFailureEmail": true
  },
  "endTime": "2025-06-13T17:26:15.747989Z",
  "errorStatus": {},
  "name": "projects/831669424176/locations/us/transferConfigs/68255995-0000-2442-b2c7-c82add7be8f8/runs/6855a2ac-0000-2919-8206-94eb2c0c955e",
  "notificationPubsubTopic": "projects/theta-topic-457803-u2/topics/Metrics2ndtest",
  "params": {
    "query": "CALL `theta-topic-457803-u2.OZPRACTICE.InsertTestRow`();\r\n"
  },
  "runTime": "2025-06-13T17:25:00Z",
  "schedule": "every 5 minutes",
  "scheduleTime": "2025-06-13T17:25:00Z",
  "startTime": "2025-06-13T17:25:00.665384Z",
  "state": "SUCCEEDED",
  "updateTime": "2025-06-13T17:26:15.748048Z",
  "userId": "-7208832463856785850"
}
```
</details>

---

<img width="577" alt="image" src="https://github.com/user-attachments/assets/a8b822ed-f0cf-4015-bc05-9398b37e58ec" />
