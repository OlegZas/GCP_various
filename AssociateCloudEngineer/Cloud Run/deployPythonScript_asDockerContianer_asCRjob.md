Cloud Run deploying container as a JOB
-	Used for scheduling scripts in gcp 
Objectives: 
1st Demo: 
1.	Python script extracts data and loads to GCS 
2.	I’ll build a container image for the script 
3.	I’ll push the image to the artifact registry 
4.	Deploy to Cloud Run as a Job 
5.	Test the job 
1.	Create main.py and Docker files in your repository on GCP. 
 
2.	Create a bucket and replace the bucket name in your .py file
python-cloud-run-oz
3.	Execute the python script locally in the shell python main.py
 
4.	Navigate to the Artifact Registry and create a repository: 
 
5.	Building a docker image: 
a.	Copy the repository path and in the CLI run to build a docker image: 
i.	docker build -t us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-reporting-job:v01 .----- adding name, and adding a version, dot means current repo
ii.	When you run it, it will start building a container image, downloading cloud storage dependencies, that will be available locally: 
 
iii.	Type docker image ls to check the image that was built : 
 
6.	Push the docker image to the artifact registry: 
a.	docker push us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-reporting-job:v01 .
7.	In Cloud Run, Deploy Contianer in the Jobs: 
 
a.	Select your container image from the Artifact Registry: 
 
8.	In Cloud Run, add Scheduler Trigger for the job you’ve created: 
 
a.	Use the CRON expression to schedule the frequency: 
i.	* * * * *
 
