# Cloud Run

Cloud Run in Google Cloud Platform (GCP) is a service that lets you run your applications or containers without having to manage the underlying infrastructure. You only need to focus on your code or container, and Cloud Run automatically handles the scaling, networking, and management.

- **Container to production in seconds**
- **Fully managed**

### Here’s how it works:
1. **You create a container**: A container is like a package that contains everything your app needs to run, such as the code, libraries, and settings.
2. **You deploy the container to Cloud Run**: You upload your container to Cloud Run, and it automatically takes care of running your app.
3. **Automatic scaling**: Cloud Run automatically adjusts the number of instances (copies) of your app based on demand. If there’s a lot of traffic, it adds more instances; if traffic drops, it reduces them, so you only pay for what you use.
4. **Fully managed**: You don’t need to worry about servers, scaling, or infrastructure. Cloud Run is serverless, meaning Google takes care of it all.
5. **Public or private access**: You can make your service publicly accessible via a URL or restrict access to specific users or services in a containerized environment.

---

## Cloud Functions (Outdated, 2025)

- **Event-driven**: Cloud Functions is designed to run small pieces of code in response to specific events, like an HTTP request, a new file uploaded to Cloud Storage, or a message from a Pub/Sub topic.
- **Granular code execution**: It’s best for single, small functions (i.e., running a single block of code).
- **Stateless**: Each function is independent and does not maintain state between executions.

---

## Cloud Run

- **Container-based**: Cloud Run runs your application inside containers. You package your application with everything it needs (e.g., libraries, code, dependencies) into a container image and deploy it to Cloud Run.
- **More flexibility**: You can run entire web applications or APIs on Cloud Run, not just small functions. It’s well-suited for more complex workloads or services that may need more control over the environment.
- **Scalable**: Just like Cloud Functions, Cloud Run automatically scales based on traffic. It spins up or down instances of your container as needed.

---

## How Cloud Run Handles Cloud Functions:

- **Running Functions in Containers**: Cloud Functions is often used for quick, small tasks, while Cloud Run is more suited for running whole applications or APIs. However, you can deploy code written for Cloud Functions in a container on Cloud Run.
![image](https://github.com/user-attachments/assets/59642c48-f3cd-44b8-9b61-cf012314e6f5)

# Cloud Run Overview

### 1. Deploying Cloud Run Service from Existing Image

- You can deploy your Cloud Run service directly from an existing container image. This allows you to take advantage of your pre-built container, which contains all the necessary dependencies, and run it on Cloud Run.
- Steps to deploy:
  1. Build your container image and push it to a container registry (e.g., Google Container Registry or Artifact Registry).
  2. Use the `gcloud run deploy` command or the Google Cloud Console to deploy the container image to Cloud Run.
![image](https://github.com/user-attachments/assets/21282b6d-94b2-4a47-b377-c5502c0bfc1a)

---

### 2. CPU Allocation and Pricing

- Cloud Run uses a **pay-as-you-go** model based on the resources your service consumes (CPU, memory, and request duration).
- You can allocate the amount of CPU and memory your containerized service needs. The pricing is based on the amount of CPU and memory allocated and the duration your service runs.
- Cloud Run automatically scales your service up or down based on traffic, so you only pay for what is being used.

---

### 3. Auto-Scaling and the Number of Instances

- Cloud Run automatically scales your application based on incoming requests. If more traffic is received, Cloud Run will spin up additional instances to handle the load. If the traffic decreases, it will scale down the instances, potentially to zero.
- **Scaling considerations**:
  - You can define the maximum number of instances that Cloud Run should scale up to.
  - The number of instances is automatically adjusted based on the demand, ensuring optimal performance and cost-efficiency.

---

### Cold Start

- **Cold Start** occurs when a request is made to Cloud Run, and there are no available instances running.
- During this time, the container must be started from scratch, which increases the latency of the request.
  - Cold starts usually add **10+ seconds** to the initial request's latency.
  - After the container is started, subsequent requests can be handled with much lower latency as the instance is now "warm."
