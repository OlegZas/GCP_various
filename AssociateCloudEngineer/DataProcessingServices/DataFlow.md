# DataFlow

**DataFlow:**  
- Data processing service on GCP  
- Requires coding in Python on Apache Beam  
- Used for both stream and batch data  
  - Batch data – all files are processed one time in a day  
  - Stream data – continuously sending data and it’s processed as soon as it’s received  
- Based on Apache Beam Python framework  
- Real-time processing with low-latency  

**Uses:**  
- Real-time stream processing for IoT devices and logs  
- Batch processing for large-scale data transformations  
- Building real-time dashboard and analytics  

---

## Creating a Dataflow Job:

### 1. Using Dataflow Template  
a. Allows you to package a Dataflow pipeline for deployment. Anyone with the correct permissions can then use the template to deploy the packaged pipeline.  
b. Can create custom templates  
c. Google provides pre-built templates for various scenarios  

### 2. Using Dataflow Job Builder  
a. Can use UI, without code, to build Dataflow pipelines  
