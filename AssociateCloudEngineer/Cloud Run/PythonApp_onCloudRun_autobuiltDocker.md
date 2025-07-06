# Deploy a Python App as a JOB on Cloud RUN 
# <ins>without manually building Docker container.</ins>


> [!NOTE]
> ### 2nd Demo:
> 1.	Deploy the job from the source code (automatically will create a Docker image) 
> 2.	Schedule the job for desired frequency 

### 1.	To deploy a Python app as a job on the Cloud Run without manually building Docker image, you’d deploy the job directly from the source code. In the back end, it will create a repository in Artifact Registry, build image, push it, and deploy cloud run. 

### 2.	In shell run : gcloud run jobs deploy
 -  a.	Navigate to the folder where you have the script (app.py and dockerfile)
 
 ![image](https://github.com/user-attachments/assets/31eb216d-45b9-4692-b1c6-dfad53cdcf86)

---
### 3.	This will create a Cloud run job which you can schedule using the Scheduler. 

![image](https://github.com/user-attachments/assets/fafb26b0-9669-402d-a0ab-6b9ba7ed0aad)

---
