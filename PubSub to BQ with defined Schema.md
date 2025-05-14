# Pub/Sub Topic and Subscriber Setup Using Avro Schema

This document outlines the steps to create a structured message format using Avro schema for Google Cloud Pub/Sub, and how to test and deploy it.

---

## 1. Create a Schema

Design a schema that defines the structure of messages published to a Pub/Sub topic. This helps avoid processing unstructured, encoded messages that require parsing.

---

## 2. Create Avro Schema
![image](https://github.com/user-attachments/assets/a5019402-14a9-47f5-8add-41cbf61795fc)

```json
{
  "type": "record",
  "name": "ScheduledQueryMessage",
  "namespace": "com.example",
  "fields": [
    { "name": "name", "type": "string" },
    { "name": "userId", "type": "string" },
    { "name": "state", "type": "string" },
    { "name": "runTime", "type": "string" },
    { "name": "startTime", "type": "string" },
    { "name": "endTime", "type": "string" },
    { "name": "updateTime", "type": "string" },
    { "name": "scheduleTime", "type": "string" },
    { "name": "notificationPubsubTopic", "type": "string" },
    {
      "name": "params",
      "type": {
        "type": "record",
        "name": "Params",
        "fields": [
          { "name": "query", "type": "string" }
        ]
      }
    },
    {
      "name": "errorStatus",
      "type": {
        "type": "record",
        "name": "ErrorStatus",
        "fields": [
          { "name": "message", "type": "string" }
        ]
      }
    },
    {
      "name": "emailPreferences",
      "type": {
        "type": "record",
        "name": "EmailPreferences",
        "fields": [
          { "name": "enableFailureEmail", "type": "boolean" }
        ]
      }
    },
    { "name": "dataSourceId", "type": "string" },
    { "name": "destinationDatasetId", "type": "string" }
  ]
}
```
## 3. Test Message
Below is an example test message that conforms to the Avro schema:
![image](https://github.com/user-attachments/assets/7c505962-43d3-4421-be4f-f87bd55deaef)

```
{
  "name": "projects/831669424176/locations/us/transferConfigs/68255995-0000-2442-b2c7-c82add7be8f8/runs/686043e9-0000-29b2-b7ea-582429afcc94",
  "userId": "-7208832463856785850",
  "state": "SUCCEEDED",
  "runTime": "2025-05-09T21:18:30.347Z",
  "startTime": "2025-05-09T21:18:30.583862Z",
  "endTime": "2025-05-09T21:19:45.625857Z",
  "updateTime": "2025-05-09T21:19:45.625914Z",
  "scheduleTime": "2025-05-09T21:18:30.462477Z",
  "notificationPubsubTopic": "projects/theta-topic-457803-u2/topics/ScheduledQueries",
  "params": {
    "query": "CALL `theta-topic-457803-u2.OZPRACTICE.InsertTestRow`()"
  },
  "errorStatus": {
    "message": ""
  },
  "emailPreferences": {
    "enableFailureEmail": true
  },
  "dataSourceId": "scheduled_query",
  "destinationDatasetId": ""
}
```

## 4. Add the Schema to the Pub/Sub Topic
Use the Google Cloud Console or gcloud CLI to create and attach the schema to the topic:
![image](https://github.com/user-attachments/assets/c8b53809-cb38-43d2-84a8-a1fe2a90464a)

```
gcloud pubsub schemas create scheduledQuerySchema \
  --type=avro \
  --definition-file=scheduled_query_schema.avsc \
  --project=your-project-id
```
Then, attach the schema to a topic:

```
gcloud pubsub topics create scheduledQueriesTopic \
  --schema=schedulesQuerySchema \
  --message-encoding=json \
  --project=your-project-id
```

## 5. Create a Subscriber
Create a subscription to receive messages:
![image](https://github.com/user-attachments/assets/a4e06227-b051-4f18-8cb1-f0a02ea0e10d)

```
gcloud pubsub subscriptions create scheduledQuerySubscriber \
  --topic=scheduledQueriesTopic \
  --project=your-project-id
```
## 6. Create BigQuery table based on which the schema of the message is based: 
```
CREATE TABLE `theta-topic-457803-u2.Logs.ScheduledQueryLog` (
  name STRING,
  userId STRING,
  state STRING,
  runTime STRING,
  startTime STRING,
  endTime STRING,
  updateTime STRING,
  scheduleTime STRING,
  notificationPubsubTopic STRING,
  params STRUCT<
    query STRING
  >,
  errorStatus STRUCT<
    message STRING
  >,
  emailPreferences STRUCT<
    enableFailureEmail BOOL
  >,
  dataSourceId STRING,
  destinationDatasetId STRING
);
```
