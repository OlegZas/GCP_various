## Dataproc Cluster VM Instances Breakdown

When you create a **Dataproc cluster**, it provisions multiple **virtual machine (VM)** instances for different components of the cluster. Dataproc clusters are typically designed to run distributed processing tasks like those from **Apache Hadoop**, **Apache Spark**, **Apache Hive**, etc.

### VM Instances Breakdown

#### 1. **Master Node** (`apachehiveoz-m`)

- **Purpose**:  
  The master node is the primary node in the Dataproc cluster, responsible for managing the cluster’s resources, jobs, and execution. It coordinates the work done by the worker nodes and also hosts services like **Apache Hive**, which you're likely using, as the name `apachehiveoz` suggests.

- **IP Address**:  
  `10.128.0.5` (assigned to `nic0`)

#### 2. **Worker Nodes** (`apachehiveoz-w-0`, `apachehiveoz-w-1`, `apachehiveoz-w-2`)

- **Purpose**:  
  These nodes perform the actual computation and storage tasks. They work in parallel to execute your jobs and store data. You have three worker nodes in this case, which indicates a more robust setup. More workers allow the cluster to handle more complex and larger jobs efficiently.

- **IP Addresses**:  
  `10.128.0.4`, `10.128.0.3` for these workers, all attached to `nic0` (the primary network interface).

### Why Were These VMs Created?

Dataproc uses these nodes (master and workers) for distributed processing and job management:

- **Master node**: Needed for cluster management, task scheduling, and job monitoring.
- **Worker nodes**: Required for the parallel execution of data processing tasks, like those in **Hadoop**, **Spark**, or **Hive**.

### Summary

In summary, the Dataproc cluster created these VMs to set up a fully functioning cluster environment where:

- The **master node** runs the coordination and management services.
- The **worker nodes** handle the heavy lifting of processing the data across multiple machines.

If you didn’t specify otherwise, Dataproc will automatically configure a default number of worker nodes. This setup is common for clusters designed to run processing frameworks such as **Apache Hive** (as seen in your naming convention).
