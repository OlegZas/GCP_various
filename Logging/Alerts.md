# Setting up Alerts about Job Failures

## Goal  
Generate email alerts for the failures of the scheduled queries in the BigQuery GCP environment. Provide a detailed message of the error.

---

## Steps

### 1. Create an Alert Policy  
Set up an alert policy using **Logging/Alerting** or **Log Explorer > Actions**.
![image](https://github.com/user-attachments/assets/ffdb3795-d1ca-4b9a-b10b-987ceca07fc3)

---

### 2. Customize the Notification Message  
- Include a **custom message** in your documentation that will be sent as part of the alert.
- You may use **Markdown markups** for formatting.
- Add helpful **links** if necessary.
![image](https://github.com/user-attachments/assets/5c8fc13d-7155-494c-824f-d399ae22eb65)

---

### 3. Filter Logs with a Query  

Use the following query to filter relevant logs:
```bash
logName="projects/theta-topic-457803-u2/logs/bigquerydatatransfer.googleapis.com%2Ftransfer_config"
severity>=ERROR
```
OR 
```
logName = "projects/theta-topic-457803-u2/logs/cloudaudit.googleapis.com%2Fdata_access"
resource.type = "bigquery_resource"
severity = "ERROR"
protoPayload.methodName = "jobservice.insert"
protoPayload.requestMetadata.callerSuppliedUserAgent = "BigQuery Data Transfer Service"
protoPayload.serviceData.jobInsertRequest.resource.jobConfiguration.labels.data_source_id = "scheduled_query"
```

![image](https://github.com/user-attachments/assets/26c34dc1-9198-4920-b97d-9c55bf584c78)

### 4. Add Labels  
Labels will be automatically added to your alert by the system and can contain important metadata about the procedure that failed.  
- Labels can include details such as:
  - **Error messages**
  - **Job IDs**
  - **Query names**
- Use **JSON** format to define and manage labels.
![image](https://github.com/user-attachments/assets/ece7e663-5c4b-4dbf-b55d-cbc91dfc9394)

---

### 5. Notification Frequency and Auto-Scale Duration  
Configure how frequently notifications are sent and set an appropriate **auto-scale duration** to:
- Reduce alert noise
- Better align with workload spikes or failures
- Improve operational response
![image](https://github.com/user-attachments/assets/b2255997-1b95-4cbd-99bd-9190a51ff730)

---

### 6. Create/Add Notification Channels  
Set up one or more notification channels to receive alerts. Options include:
- 📧 **Email**
- 📱 **SMS**
- 💬 **Slack**
- 🔗 **Webhook**
- ☁️ **Pub/Sub** (for custom integrations)

You can manage channels under:  
`Monitoring > Alerting > Notification Channels`
![image](https://github.com/user-attachments/assets/a6170b08-7c5d-416c-9a0b-9e328de7d7cb)

---

### 7. Email Notification Received  
Example of an email alert received when a scheduled query fails:

> **Subject**: BigQuery Transfer Job Failure  
> **Details**:  
> Transfer Name: `my_scheduled_transfer`  
> Project: `theta-topic-457803-u2`  
> Error: `Permission denied while accessing dataset`  
> Severity: `ERROR`
![image](https://github.com/user-attachments/assets/70784f21-83ad-4bcb-80c5-5a16c1f3ac6a)


