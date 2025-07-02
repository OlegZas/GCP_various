# ☁️ Cloud Run Overview

- **Cloud Run**: You don’t need to create any infrastructure for your containers — you just deploy your container image on this platform.
	- Supports all programming languages because it runs in a container.
	- Building a Docker image is optional. Cloud Run can build the container for you — you just provide the source code.

- **Google Compute Engine (VM)**: Created a VM instance, then deployed the application.

- **App Engine**: Created a `yaml` file, then deployed the application on Google App Engine.

- **GKE (Google Kubernetes Engine)**: Created a Kubernetes cluster first, then managed various configurations, then deployed the container image (with or without explicitly building it with Docker).

---

## 🤔 Why Use Cloud Run Instead of Kubernetes?

- If the application doesn’t need to run all the time (e.g., accessed once a day), Cloud Run is more effective.
- For small-scale applications, Cloud Run is much easier to manage.
- Use Cloud Run for apps triggered by:
	- Pub/Sub events  
	- File uploads to Cloud Storage  
- Cloud Run is cost-effective for low-traffic applications.
- Ideal for lightweight APIs for mobile or web apps with intermittent traffic.
- Great for batch processing: generating reports, resizing images, etc.

---

## 🚀 Cloud Run Execution Modes

### 1. **Service**
Used to run code that responds to web requests, events, or functions.

	Use when:
		i. Website or application
		ii. APIs and microservices
		iii. Streaming data processing — via Pub/Sub push subscriptions or Eventarc
		iv. AI Inference — for hosting or training models (GPU support optional)

### 2. **Jobs**
Used to run a code that performs work and shuts down the instance when complete.

	Use for:
		i. Tasks that are not HTTP-triggered or need to be scheduled
		ii. Running scripts or performing database migrations
		iii. Parallel processing of files in a Cloud Storage bucket
		iv. Creating/sending invoices or saving DB query results as XML

---

## 🛠 Creating a Cloud Run Service (with an Existing Container Image)

1. **Options**:
	- Deploy existing container image from Docker Artifact Registry
	- Provide source code → Cloud Run builds Docker image and deploys it
	- Use Cloud Functions (Cloud Run Functions)

2. **Example**:  
	I will use the test Docker image provided by GCP.

3. **Access the App**:  
	Click on the HTTP endpoint shown after deployment.

---
