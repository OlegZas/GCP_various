# AWS S3 to BigQuery View via BigQuery Omni

Here is a quick tutorial with sample data that I’ve prepared on how to connect **AWS S3 to BigQuery view** via **BigQuery Omni**.

---

## 1. Prepare Your S3 Bucket
- Navigate to your S3 bucket, or create a new one to load your CSV file.
<img width="975" height="733" alt="image" src="https://github.com/user-attachments/assets/e62d8164-5fef-4a0f-b7ee-58d5ba412e72" />

---

## 2. Create S3 → BigQuery Connection

### a. Create IAM Policy in AWS for BigQuery  
*(Done by Cloud Infra/Admin team)*

1. Navigate to **IAM Policies** in AWS.
   <img width="975" height="242" alt="image" src="https://github.com/user-attachments/assets/d1bbaf7b-3183-4b0a-889b-5f4830b55295" />

3. Click **Create a policy** → **JSON**.
   <img width="975" height="259" alt="image" src="https://github.com/user-attachments/assets/03562cfc-f9d6-402e-879d-8696a70aead6" />

5. Search for GCP documentation “Amazon S3 connection” and copy the JSON template.
   <img width="975" height="681" alt="image" src="https://github.com/user-attachments/assets/7511647a-50bf-47dc-b01e-180c9ed173c7" />

7. Update the JSON:
   - Change the bucket name to your S3 bucket.
   - Remove any unnecessary `Export_Perm`.
<img width="541" height="672" alt="image" src="https://github.com/user-attachments/assets/fdfe82f4-2a98-41c7-b88b-d8780cce5e47" />

<!--
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::s3-to-bq-omni"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::s3-to-bq-omni",
        "arn:aws:s3:::s3-to-bq-omni/*"
      ]
    }
  ]
}
-->

5. Create the policy.
<img width="660" height="270" alt="image" src="https://github.com/user-attachments/assets/e40b1ff7-80d0-4afe-9c65-ea1504c3f23c" />

---

### b. Create AWS IAM Role for BigQuery

1. When creating a role:
   - Choose **WebIdentity** → **Provider: Google**
   - Give a placeholder name (e.g., `11111`) for the audience — this will be replaced once the BigQuery S3 connection is created.
     <img width="975" height="514" alt="image" src="https://github.com/user-attachments/assets/33c9b8d3-6df6-4003-8ad4-8efa0daec33a" />

2. Attach the IAM policy created above.
   <img width="975" height="395" alt="image" src="https://github.com/user-attachments/assets/58017395-8f5c-44c6-b3eb-b05b07cac936" />

4. Create the role.

---

## 3. Create the BigQuery Omni Connection

1. In BigQuery Explorer, click **Add Data → S3 → BigQuery Omni Federation**.  
<img width="975" height="353" alt="image" src="https://github.com/user-attachments/assets/b9ac83ad-7b97-4735-8760-5e543f1f9776" />

### a. Create the S3 Connection
<img width="975" height="117" alt="image" src="https://github.com/user-attachments/assets/0e931aec-2944-447a-8632-eb5c7f457f1b" />

1. Ensure the **region** matches your S3 bucket region.  
2. If your bucket region is not available, create a dataset manually:

<!--
CREATE SCHEMA IF NOT EXISTS `oz-gcp.s3_toBq_Omni`
OPTIONS(
  location = 'aws-us-east-1',
  description = 'Creating a dataset to establish connection to S3 bucket data through Omni'
);
-->

3. Start creating a table in the dataset:
   - Select **Amazon S3**  
   - Provide the path to the CSV file in the bucket  
   - Start creating the S3 connection (do **not** create the table yet)
<img width="975" height="358" alt="image" src="https://github.com/user-attachments/assets/102abf2b-34f1-4aa6-851c-b414e5fd9016" />

4. Navigate to the connection and select the **BigQuery identity** of the connection you just created.  
<img width="698" height="660" alt="image" src="https://github.com/user-attachments/assets/cb4c0884-b495-4ac2-afcc-c821cb6328a0" />

5. In AWS, edit the **trust policy** of the role to include the BigQuery identity number:

<!--
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "accounts.google.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "accounts.google.com:aud": "106042642184479136076"
        }
      }
    }
  ]
}
-->
<img width="528" height="431" alt="image" src="https://github.com/user-attachments/assets/14971573-edb6-4b09-8ec4-c7c80e367c16" />

6. In AWS, change the **session duration** to 12 hours to match BigQuery.
   <img width="975" height="284" alt="image" src="https://github.com/user-attachments/assets/b97fcfae-b798-4773-af4b-dac0a0e6d39d" />

8. Finish creating the **BigQuery table** now.
<img width="470" height="753" alt="image" src="https://github.com/user-attachments/assets/3c8dc0dd-55d7-4860-bd66-b68e0925e39f" />

---

## 4. Explore the Data

- Your dataset and table are ready.  
- You can now run queries and create views on AWS S3 data directly from BigQuery via Omni.
