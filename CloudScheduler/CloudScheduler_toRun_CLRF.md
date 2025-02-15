# Cloud Scheduler for Running Cloud Run Functions

In Cloud Scheduler, you can schedule jobs, such as the execution of Cloud Run functions, as frequently as every 1 minute.

![image](https://github.com/user-attachments/assets/f41ca2fc-ca63-4c85-bcda-bb8484e6d560)

## Schedule a Job to Run Every 1 Minute

To schedule a job that triggers the Cloud Run function every 1 minute, use the following `gcloud` command:

```bash
(dataprocapachehive)$ gcloud scheduler jobs create http run_bq_procedures_job \
    --schedule "* * * * *" \
    --uri "https://us-central1-dataprocapachehive.cloudfunctions.net/BQ_Integration_PY" \
    --http-method=GET \
    --location=us-central1

