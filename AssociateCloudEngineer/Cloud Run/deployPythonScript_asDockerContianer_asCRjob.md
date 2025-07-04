# Cloud Run deploying container as a JOB
-	Used for scheduling scripts in gcp 

 ##  <ins>Objectives: </ins>
### **1st Demo:**

> [!NOTE]
> 1.	Python script extracts data and loads to GCS 
> 2.	I’ll build a container image for the script 
> 3.	I’ll push the image to the artifact registry 
> 4.	Deploy to Cloud Run as a Job 
> 5.	Test the job


---

### 1.	Create main.py and Docker files in your repository on GCP. 
 ![image](https://github.com/user-attachments/assets/2d160ee7-67d2-4c59-8999-a3318dbef92d)

---

### 2.	Create a bucket and replace the bucket name in your .py file
- python-cloud-run-oz
### 3.	Execute the Python script locally in the shell: python main.py
 ![image](https://github.com/user-attachments/assets/4488cd1a-1e0a-475c-a3e7-06d0dfc2d894)

---

### 4.	Navigate to the Artifact Registry and create a repository: 

 ![image](https://github.com/user-attachments/assets/984295d9-9d05-428c-8757-6a765503bf8a)

---

### 5.	Building a Docker image: 
  - a.	Copy the repository path and in the CLI run to build a docker image: 
    - i. 	docker build -t us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-reporting-job:v01 .----- adding name, and adding a version, dot means current repo
    - ii.	When you run it, it will start building a container image, downloading cloud storage dependencies, that will be available locally: 
 ![image](https://github.com/user-attachments/assets/d83c8155-0a19-41db-9c1f-3ad6e9a3da76)

    - iii.	Type docker image ls to check the image that was built : 
 ![image](https://github.com/user-attachments/assets/0732b95f-c3a2-4d16-810a-ed927d308ced)

---

### 6.	Push the Docker image to the artifact registry: 
- a.	docker push us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-reporting-job:v01 .
### 7.	In Cloud Run, Deploy Contianer in the Jobs: 
 ![image](https://github.com/user-attachments/assets/bf7f85fa-7ac6-4278-8abb-82f677d95d85)

- a.	Select your container image from the Artifact Registry: 
![image](https://github.com/user-attachments/assets/c371c8cd-ce13-4961-84db-b4383472d882)

---

### 8.	In Cloud Run, add Scheduler Trigger for the job you’ve created: 
 ![image](https://github.com/user-attachments/assets/65051496-5c14-4524-ae5d-64773fb82af5)

- a.	Use the CRON expression to schedule the frequency:
   -   i.	* * * * *
     
![image](https://github.com/user-attachments/assets/c070f900-44aa-4bac-8400-729cdbd97043)

---

![image](https://github.com/user-attachments/assets/f8c4b183-908e-4ef2-8838-46cf7fd9033f)

---
