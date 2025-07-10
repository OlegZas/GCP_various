
# DATA PROCESSING SERVICES

## DataFlow
- Data processing service on GCP  
- Requires coding in Python on Apache Beam  
- Used for both stream and batch data  
  - Batch data – all files are processed once a day  
  - Stream data – continuously sending data and it’s processed as soon as it’s received  
- Based on the Apache Beam Python framework  
- Real-time processing with low latency  
- Uses:  
  - Real-time stream processing for IoT devices and logs  
  - Batch processing for large-scale data transformations  
  - Building a real-time dashboard and analytics  



## Data Fusion
- Fully-managed, code-free data integration service  
- Drag-drop UI for creating a pipeline  
- Uses:  
  - Consolidate data from multiple sources (has plunging and connectors to connect to multiple sources)  
  - Used for preparing data for machine learning models  
  - Transforming structured and unstructured data for analytics  

## Dataproc
- Fully managed service for running Apache Hadoop, Apache Spark, and other big data frameworks  
- Mainly used when you have on premises data bases that need to be migrated to cloud  
- Clusters are created quickly and you can focus on your data rather than infrastructure management  
- Uses:  
  - Running Spark and Hadoop jobs  
  - Processing and analyzing large datasets stored in Cloud Storage and Big Query  
  - Migrating existing on-prem big data workloads to the cloud  

 
## Cloud Composer
- Managed workflow orchestration environment built on Apache Airflow  
  - Workflows: automated sequences of tasks (also called pipelines) (DAGs) that consist of multiple tasks (e.g., data ingestion, transformation, model training, etc.), which are executed according to a defined schedule and order, with dependencies between them.  
  - These workflows are defined as Directed Acyclic Graphs (DAGs) using Apache Airflow, which is the orchestration engine behind Cloud Composer.  
  - A DAG (Directed Acyclic Graph) is the core concept of Airflow, collecting Tasks together, organized with dependencies and relationships to say how they should run.  
- It’s like a GKE cluster on which Apache Airflow is deployed and managed by GCloud – you just create your decks and it will orchestrate your data pipelines  
- Allows users to automate, schedule, monitor workflows across various GCP services and external systems  
- Uses:  
  - Orchestrating multi step data pipelines  
  - Scheduling regular data processing jobs  
  - Managing dependencies between tasks, such as database updates and ML model training  
<img width="348" height="285" alt="image" src="https://github.com/user-attachments/assets/2ea9af6f-dbc2-4459-a928-7e4569199484" />

---

<img width="916" height="741" alt="image" src="https://github.com/user-attachments/assets/55b6bf7e-2138-480c-856e-62c978213935" />

---
<img width="975" height="516" alt="image" src="https://github.com/user-attachments/assets/c603401d-d4d7-42e0-a430-d3b87f2aa6e7" />
