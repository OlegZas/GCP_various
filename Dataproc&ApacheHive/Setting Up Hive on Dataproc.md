## Step 1: **Create a Google Cloud Project**
If you haven’t already, create a **Google Cloud project** through the **Google Cloud Console**. You'll need this for setting up your Dataproc cluster and storing your data.

## Step 2: **Enable Google Cloud Dataproc API**
Go to the **Dataproc API** page and enable the API for your project.

## Step 3: **Install Google Cloud SDK (if not already installed)**
Download and install the **Google Cloud SDK** if you haven’t. Authenticate your account by running:

```bash
gcloud auth login
```
and set your project:
```bash 
gcloud config set project OlegProject
```

## Step 4: **Create a Dataproc Cluster**
Open the **Google Cloud Console** and go to the **Dataproc** page.  
Click **Create Cluster**.  
For the cluster setup:
- Choose a region and zone.
- Select a cluster name (e.g., `hive-cluster`).
- Under **Image version**, select the latest version of Dataproc (ensure Hive is included in the default image).
- Adjust the cluster size based on your needs (you can start with a simple 2-node cluster for testing).

Once created, the cluster will be ready for use.  
Alternatively, you can create a cluster using the **gcloud CLI**:

```bash
gcloud dataproc clusters create hive-cluster \
  --region=YOUR_REGION \
  --image-version=2.0-debian10 \
  --optional-components=HIVE
```
## Step 5: **Connect to the Dataproc Cluster**
Once the cluster is created, SSH into the **master node** from the **Google Cloud Console** or using the **gcloud command**:

```bash
gcloud dataproc clusters ssh hive-cluster --region=YOUR_REGION
```

## Step 6: **Start Apache Hive**
Hive should be pre-installed as part of the **Dataproc image**. To launch Hive, simply run the following command:

```bash
hive
```

## Step 7: **Create a Hive Database**
Once inside the **Hive shell**, create a database to practice SQL by running the following commands:

```sql
CREATE DATABASE my_database;
USE my_database;
```

## Step 8: **Load Some Sample Data (Optional)**
You can load some sample data into Hive to practice SQL queries. Here's how you can load CSV data into Hive:

 1. Upload your data to **Google Cloud Storage (GCS)**:

```bash
gsutil cp local-file.csv gs://your-bucket-name/
```
 2. Create a Hive table and load data from GCS**:

```sql
CREATE TABLE my_table (
  id INT,
  name STRING,
  age INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH 'gs://your-bucket-name/local-file.csv' INTO TABLE my_table;
```
## Step 9: **Run SQL Queries**
Now you can run SQL queries in Hive. For example, to select all data from your table, run the following query:

```sql
SELECT * FROM my_table;

