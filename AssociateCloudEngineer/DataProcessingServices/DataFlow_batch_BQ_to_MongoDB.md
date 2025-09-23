#  Dataflow Pipeline: BigQuery ➝ MongoDB Atlas

A **batch data pipeline** using **Google Cloud Dataflow** to transfer data from **BigQuery** to **MongoDB Atlas**.

---

## Pipeline Overview

**Flow:**  
`BigQuery → Dataflow → MongoDB`

**Purpose:**  
Create a Dataflow pipeline to **batch load** data from BigQuery into MongoDB Atlas.

> **Note:** To turn this into a *streaming pipeline*, you would need to use a service like **Pub/Sub** or **Kafka** as the data source.

---

##  Step-by-Step Guide

### 1. Create MongoDB Atlas Account

1. Sign up or log in at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas).
2. Create a new **cluster**.
<img width="975" height="761" alt="image" src="https://github.com/user-attachments/assets/b4eb7812-5ce0-4d31-bf32-3cda9ce7cb03" />

4. Save the **database username and password** you define (you won’t be able to view it again later).
<img width="835" height="465" alt="image" src="https://github.com/user-attachments/assets/e0080e51-2982-4458-90c1-2dd5cc56bb47" />

6. During setup:
   - Choose **Compass**.
   - Select **"Already installed"**.
   - Click **Done** to finish cluster creation.
<img width="657" height="619" alt="image" src="https://github.com/user-attachments/assets/6e2981e5-3f78-4cba-8e87-104ac62d8c5c" />

7. Click **“Get connection string”** and copy the URI.
8. Replace `<db_password>` in the URI with your actual password:
   ``` mongodb+srv://olegphotos3_db_user:PASWORDHERE@ozdataflow-poc.vubtjp6.mongodb.net ```

9. 	Create a database in the cluster that you’ve created:
<img width="975" height="521" alt="image" src="https://github.com/user-attachments/assets/842f5db9-3ed1-4ca8-a3d8-a75f632ba3e4" />

### 2.  Create a BigQuery Table and Populate It

1. In **Google Cloud Console**, go to **BigQuery**.
2. Create a dataset (e.g., `ozdataflow`) if one doesn’t already exist.
3. Create the table using the following SQL:

####  Create Table
```sql
CREATE TABLE oz-gcp.ozdataflow.oz_health (
  country STRING,
  year INT64,
  disease STRING,
  age_group STRING,
  gender STRING,
  mortality_rate FLOAT64,
  happiness_index FLOAT64
);

INSERT INTO oz-gcp.ozdataflow.oz_health (
  country, year, disease, age_group, gender, mortality_rate, happiness_index
) VALUES
  ('Australia', 2020, 'Heart Disease', '65+', 'Male', 5.3, 7.2),
  ('Australia', 2020, 'Diabetes', '45-64', 'Female', 1.2, 7.5),
  ('Australia', 2021, 'Cancer', '65+', 'Female', 4.8, 7.4),
  ('Australia', 2021, 'Stroke', '65+', 'Male', 3.1, 7.3),
  ('Australia', 2022, 'Alzheimer\'s', '65+', 'Female', 2.6, 7.6),
  ('Australia', 2022, 'Respiratory Disease', '45-64', 'Male', 1.9, 7.1),
  ('Australia', 2020, 'Infectious Disease', '25-44', 'Male', 0.5, 7.3),
  ('Australia', 2021, 'Liver Disease', '45-64', 'Female', 0.7, 7.4),
  ('Australia', 2022, 'Kidney Disease', '65+', 'Male', 1.4, 7.5),
  ('Australia', 2023, 'Heart Disease', '45-64', 'Female', 2.9, 7.7),
  ('Australia', 2023, 'Cancer', '25-44', 'Male', 1.6, 7.8),
  ('Australia', 2023, 'Diabetes', '65+', 'Female', 2.2, 7.9),
  ('Australia', 2024, 'Stroke', '25-44', 'Female', 0.8, 8.0),
  ('Australia', 2024, 'Alzheimer\'s', '65+', 'Male', 2.1, 7.6),
  ('Australia', 2024, 'Respiratory Disease', '25-44', 'Male', 0.6, 7.7),
  ('Australia', 2020, 'Cancer', '15-24', 'Female', 0.3, 7.2),
  ('Australia', 2021, 'Infectious Disease', '0-14', 'Male', 0.2, 7.5),
  ('Australia', 2022, 'Kidney Disease', '15-24', 'Female', 0.4, 7.6),
  ('Australia', 2023, 'Heart Disease', '0-14', 'Male', 0.1, 7.4),
  ('Australia', 2024, 'Liver Disease', '15-24', 'Female', 0.5, 7.9);
```
---

### 3. Create a Dataflow Job from Template

1. Go to **Google Cloud Console > Dataflow**.
2. Click on **"Create job from template"**.
3. In the form:
   - **Template**: Select `BigQuery to MongoDB`.
   - **MongoDB URI**: Use the connection string you saved earlier:
     ```bash
     mongodb+srv://olegphotos3_db_user:<db_password>@ozdataflow-poc.vubtjp6.mongodb.net/?retryWrites=true&w=majority&appName=ozdataflow-poc
     ```
   - **Database Name**: `your_database_name`
   - **Collection Name**: `your_collection_name`
   - **BigQuery Source Table**:  
     `oz-gcp.ozdataflow.oz_health`
<img width="975" height="765" alt="image" src="https://github.com/user-attachments/assets/5a4b4387-dcbf-4627-9668-3567739ea377" />

4. Click **"Run Job"**.

---

### 4.  Wait for the Job to Start
<img width="975" height="329" alt="image" src="https://github.com/user-attachments/assets/562d2931-ee65-4229-8e0b-a178d634a41c" />

- The job will begin in a **Queued** state.
- Google Cloud will provision a **worker node (VM)**.
<img width="975" height="317" alt="image" src="https://github.com/user-attachments/assets/f00a4c3a-3efb-4057-8581-5cf55e6b0c9f" />

- Once provisioned, the job execution will start automatically.

---

### 5. Check for errors. The job has failed, most likely because the firewall was not accepted on the Atlas Cloud. 
<img width="756" height="614" alt="image" src="https://github.com/user-attachments/assets/c8e569a6-4cc7-4473-afc2-39ec463c5f98" />

> a.	Timed out after 30000 ms while waiting for a server that matches com.mongodb.client.internal.MongoClientDelegate$1@400cf440. Client view of cluster state is 

> b.	MongoDB Atlas blocks incoming connections by default, and no IP access has been allowed through the firewall—so you must update MongoDB Atlas > Network Access to whitelist your client’s IP (or allow all via 0.0.0.0/0) to enable the connection.

> c.	Go to MongoDb > Security > NetworkAccess > and edit IP Access to allow access from anywhere 

<img width="975" height="396" alt="image" src="https://github.com/user-attachments/assets/d9e85ad7-1e1f-4bba-bc0b-e6c7b8c945c3" />

d. You can’t directly re-run the job in DataFlow, so you must CLONE it. 
<img width="975" height="792" alt="image" src="https://github.com/user-attachments/assets/5ff30bb3-d78e-4a83-8a7f-01fae2de21fb" />

### 6. Once the errors fixed, the job will execute and the data will be loaded: 
<img width="1868" height="902" alt="image" src="https://github.com/user-attachments/assets/6d911ebd-c414-4264-820b-676b5e3030c0" />


