# Streaming Data pipeline with Pub/Sub and Data Flow

Objective: 
**Create a Streaming Job using Google-provided template**
1.	Create a Pub/Sub Topic for Source streaming data 
2.	Create a BigQuery Table for Destination records 
3.	Create Dataflow Job
4.	Test Job by manually publishing records in Pub/Sub Topic
<img width="644" height="319" alt="image" src="https://github.com/user-attachments/assets/0fe2d60c-a728-4d3c-9ffa-990dee210b3e" />

----

## 1.	Navigate to the dataflow and create a job from a template 
### - a.	Choose a Process Data Continuously(stream) template - 
 
 <img width="769" height="495" alt="image" src="https://github.com/user-attachments/assets/32895e4b-96bb-45ef-b4db-a88a7e243b84" />

### - b.	Create a BigQuery output table 

 <img width="975" height="341" alt="image" src="https://github.com/user-attachments/assets/1a7bfcd3-ebe8-43fd-adc1-615ec06c4c63" />

### - c.	Create a Pub/Sub topic 

 <img width="698" height="435" alt="image" src="https://github.com/user-attachments/assets/9f1a8137-7cf5-4bee-8274-02aaee1302db" />

### - d.	Run the job to create it 

 <img width="811" height="407" alt="image" src="https://github.com/user-attachments/assets/fa2be250-818f-4b8b-9541-95c67c1fe4d8" />

### - i.	It will create a Virtual Machine and a worker node on the backend. Once created, the job execution will start.  

 <img width="975" height="666" alt="image" src="https://github.com/user-attachments/assets/0f807ed2-5627-413a-a909-93fd681b9d0f" />

### - e.	Test by manually publishing a record to pub/sub topic 

 <img width="975" height="518" alt="image" src="https://github.com/user-attachments/assets/73f349fb-cf0b-4692-a19b-27e9497d0455" />

--- 
## 2.	Using the python script, push the data to Pub/Sub every 5 seconds one by one. 

 <img width="975" height="546" alt="image" src="https://github.com/user-attachments/assets/15d7b024-e0e8-4509-9ed9-7e051e17d3ff" />

---
## 3.	Stop the job by canceling or it will keep on running. 

 <img width="547" height="518" alt="image" src="https://github.com/user-attachments/assets/462810ca-7065-4ca0-b587-54112eb4ce0f" />
---
## Summary: 
Python script pushes data continuously to Pub/Sub topic. A dataflow job, created as a stream, gets those messages from the topic and inserts into BigQuery. 
