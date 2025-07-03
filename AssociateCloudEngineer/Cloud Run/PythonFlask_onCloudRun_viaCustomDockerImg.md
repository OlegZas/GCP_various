#  Build and Deploy a Python App on Cloud Run

##  Steps Overview

1. **Create a Python Flask web app**  
2. **Build a Docker container image from the app (manually)**  
3. **Test the container image locally**  
4. **Push the container image to Artifact Registry**  
5. **Deploy the container on Cloud Run**

---

##  Step-by-Step Instructions

### 1. Use Your Existing Flask App

I am using the Python Flask app created previously (from GKE/App Engine tutorials).  

**Files required**:
- `app.py` (contains the Flask app)  
- `Dockerfile`  
- `requirements.txt`  
- `templates/index.html`  

---

### 2. Create Artifact Registry

Create an Artifact Registry repository specifically for Cloud Run.
![image](https://github.com/user-attachments/assets/b635de28-59ab-4fd4-a520-91e5169e76e1)

---

### 3. Copy the Path of Your Artifact Registry

**Example Path**:  
	us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app
![image](https://github.com/user-attachments/assets/917d077a-f290-4fe2-9905-b0bbde2cafc9)

---

### 4. Build the Docker Image

Build the Docker image with the correct tag (registry path and version):

	docker build -t us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v01 .

>  **Note**:  
> - `-t` assigns the tag (name)  
> - `.` means "build from the current directory"  
> - Make sure your `Dockerfile` is in the working directory.  
> - If not, navigate to it using `cd` command.

---

### 5. Check Docker Image Was Created

Check locally available Docker images:

	docker image ls

---

### 6. Test the Image Locally

Run the container and test locally on port 8080:

	docker run -p 8080:8080 us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v01
![image](https://github.com/user-attachments/assets/0771b8d3-2cad-42a0-8e99-ea868df8b929)
![image](https://github.com/user-attachments/assets/e1bfa4b8-33dc-4aef-8f06-f68e444d441f)

---

### 7. Push the Image to Artifact Registry

Push the image to the specified registry:

	docker push us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v01
![image](https://github.com/user-attachments/assets/1e398854-e3f0-4b61-bc7f-1d106a4f2f5a)

---

### 8. Now, you have an image available in Artifact Registry, you can deploy it on Cloud Run. 

- Go to **Cloud Run → Create Service**
- Select **"Deploy from existing container image"**
- Choose the image from **Artifact Registry**
![image](https://github.com/user-attachments/assets/6ea5fa80-5a2d-4bc9-9b10-0a3a4dccbe56)

---

### 9. Verify Deployment

- Once deployed, open the **URL** provided by Cloud Run.
- Your app should load in the browser.
![image](https://github.com/user-attachments/assets/c3b4d18d-a1a9-4985-92fe-7ff3e4294287)

---

### 10. Make Changes to Your App

Update the HTML or app logic and redeploy:

a. Edit HTML file:

	nano templates/index.html

b. Save changes:  
	**Ctrl + S** → then **Ctrl + X**

c. Run locally (optional):

	python app.py
![image](https://github.com/user-attachments/assets/d9ea4fb5-a407-4cc7-892f-656f08a3f910)

---

### 11. Deploy a new container image with your revision (New Revision)

Create a new version of your image:

	docker build -t us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v02 .

---

### 12. Push the image to the Artifact Registry

Push the new version to the registry:

	docker push us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v02

Now you have **2 versions** stored in Artifact Registry.
![image](https://github.com/user-attachments/assets/a78c6d11-324a-46d5-8eac-8b360b6a1e8f)
---

### 13. Deploy the New Version

- Go to **Cloud Run**
- Click **Edit and Deploy New Revision**
- Select the image:  
	us-central1-docker.pkg.dev/theta-topic-457803-u2/cloudrun-app/oz-run-demo:v02

![image](https://github.com/user-attachments/assets/7f9554c3-1cee-4556-91bf-7df59802e21e)

---

### 14. Verify the Second Version

- Open the updated URL or service link
- Confirm the new version is running
![image](https://github.com/user-attachments/assets/575fcb01-9bd8-49e2-a7fe-3abc8e571e72)


---

### 15. Manage Traffic Between Revisions

Cloud Run allows **traffic splitting** between versions.

- Go to the service in Cloud Run
- Under **"Revisions"**, click **"Manage Traffic"**
- Choose % split between v01 and v02 (e.g., 50/50, 100/0, etc.)
![image](https://github.com/user-attachments/assets/94d82023-5185-432c-9061-b8be0279bd67)


---
