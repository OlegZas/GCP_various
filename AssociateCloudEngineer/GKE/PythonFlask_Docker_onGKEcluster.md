# 🚀 Build and Deploy a Python Flask App to GKE Autopilot using Docker

## 🎯 Demo Objectives

- Create a GKE Autopilot Cluster  
- Develop a Python Flask web application  
- Create a Dockerfile to containerize the app  
- Build and test the Docker image  
- Create an Artifact Registry to store the image  
- Push the Docker image to Artifact Registry  
- Deploy the image on a GKE Autopilot cluster  
- Access the application via a Kubernetes service

# 🛠 Step 1: Prepare the Application

In this demo, I deployed a Python Flask application as a Docker container on a Google Kubernetes Engine (GKE) Autopilot cluster.

### a. Create a GCS bucket to store app files (optional backup step)

	Create a bucket:
	gsutil mb -l us-central1 gs://oz-docker-app/

### b. Upload project folder to the bucket

	Check uploaded files locally:
	ls -R DockerImg_to_GKE

	Upload your project folder:
	gcloud storage cp -r DockerImg_to_GKE gs://oz-docker-app

	Confirm upload:
	gcloud storage ls gs://oz-docker-app/DockerImg_to_GKE

# 📁 Step 2: Ensure Correct Folder Structure

Flask requires HTML templates to be in a folder named `templates/`.

### a. Create the templates/ folder if missing:

	mkdir templates

### b. Move your index.html into it:

	mv index.html templates/

Correct structure should look like this:

	DockerImg_to_GKE/
	├── app.py
	├── requirements.txt
	├── Dockerfile
	└── templates/
	    └── index.html

# 🧪 Step 3: Test Flask App Locally (in Cloud Shell)

Navigate to your project folder:

	cd DockerImg_to_GKE

Run the app:

	python3 app.py

Access the app by clicking the Web Preview → Port 8080 in Cloud Shell.

> Note: This runs the Flask development server only for testing — not for production.

# 🐳 Step 4: Create and Build Docker Image

### a. Create a Dockerfile

Create a Dockerfile in the same folder as `app.py`:

	FROM python:3.7-slim
	WORKDIR /app
	COPY requirements.txt requirements.txt
	RUN pip install --no-cache-dir -r requirements.txt
	COPY . /app
	EXPOSE 8080
	CMD ["python", "app.py"]

This file tells Docker how to build and run your app. It installs Flask, sets the working directory, copies your code, and runs the app on port 8080.

### b. Build the Docker image

	docker build -t flask-app .

### c. Test the Docker image locally

	docker run -p 8080:8080 flask-app

Click Web Preview on port 8080 to test the containerized app.

# 🗂 Step 5: Create Artifact Registry

Artifact Registry is GCP’s container image storage solution. You’ll need it to store your Docker image before deploying to GKE.

	Create a repository:
	gcloud artifacts repositories create gke-app-oz \
	  --repository-format=docker \
	  --location=us-central1 \
	  --description="Docker repo for Flask app"

# 🔐 Step 6: Configure Docker to Use Artifact Registry

Run this once to authorize Docker to push to Artifact Registry:

	gcloud auth configure-docker us-central1-docker.pkg.dev

# 🏷 Step 7: Tag, Push, and Verify Docker Image

### a. Tag the image:

	docker tag flask-app \
	us-central1-docker.pkg.dev/theta-topic-457803-u2/gke-app-oz/oz-docker-flask-app:latest

### b. Push the image to Artifact Registry:

	docker push \
	us-central1-docker.pkg.dev/theta-topic-457803-u2/gke-app-oz/oz-docker-flask-app:latest

### c. Check your Docker images:

	docker image ls

# ☸️ Step 8: Deploy Docker Image to GKE Autopilot

You can now deploy this image to your GKE Autopilot cluster:

- Go to the GCP Console → Kubernetes Engine  
- Create or use an existing Autopilot cluster  
- Click **Deploy**  
- Choose **"Deploy container image"**  
- Enter image name:  

	us-central1-docker.pkg.dev/theta-topic-457803-u2/gke-app-oz/oz-docker-flask-app:latest

- Expose port 8080  
- Complete deployment

# 🌐 Step 9: Access the Application

Once the app is deployed:

- Scroll to the bottom of the workload details page  
- Under **"Services & Ingress"**, click the external IP of the exposed service  
- Your app should load in a browser!

# ✅ Summary

You successfully:

- Built a Docker image for a Python Flask app  
- Stored it in Artifact Registry  
- Deployed it to a GKE Autopilot cluster  
- Accessed it via a public endpoint

---

Let me know if you’d like to:

- Add HTTPS with a Load Balancer  
- Auto-scale the deployment  
- Use environment variables or a database connection next
