# Cloud Dataproc

- **Managed Spark and Hadoop Service**  
  - Variety of jobs are supported: Spark, PySpark, SparkR, Hive, SparkSQL, Pig, Hadoop
  - Perform complex batch processing
  - It involves a lot of management, such as creating and managing clusters

- **Spark and Hadoop**  
  Spark and Hadoop are both distributed computing frameworks designed for processing large volumes of data across many machines. They are often used for batch processing (large-scale data processing in batches) and real-time analytics in big data environments.

- **Cloud Dataproc Overview**  
  Cloud Dataproc is a fully managed service for running Apache Spark and Apache Hadoop. It simplifies the process of setting up, managing, and scaling clusters (groups of virtual machines) that run these frameworks.

- **Cluster Modes in Dataproc**  
  When using Spark and Hadoop, you typically have a cluster. With Dataproc, you can create multiple cluster modes:
  - Single node cluster
  - Standard cluster
  - High availability cluster (3 masters)
  - Dataproc uses VMs (can use regular VMs or preemptible VMs)

- **When to Use Cloud Dataproc**  
  - If you have any Spark and Hadoop clusters and you want to move them to Google Cloud Platform (GCP).

- **Alternatives**  
  - **BigQuery**: When you need to run SQL queries on petabytes of data, use BigQuery.  
  - **Dataproc**: Go for Dataproc when you need more than queries, such as complex batch processing, machine learning, and AI workloads.
  - **Dataflow**: Use Dataflow when you need to build simple pipelines without the need to manage clusters since it's serverless.
