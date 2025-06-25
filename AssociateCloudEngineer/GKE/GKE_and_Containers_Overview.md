# GKE and Containers

## Containers

A **container** is like a box that holds everything an application needs to run.

- Packs all the code, libraries, tools, and settings required by the app  
- The same container image can be run anywhere  
- **Lightweight** – smaller than a virtual machine (VM)  
- **Isolated** – like its own little world  

## Container Engine

A **container engine** is responsible for creating and running containers.

- Builds container images and ensures they run smoothly  
- Most widely used engine:  
  - **Docker** – the leading platform for building, shipping, and running containers

## Container Orchestration

**Container orchestration** tools ensure that multiple container images work well together across servers.

- **Kubernetes** – open-source orchestration platform for automating deployment, scaling, and management of containers

---

## Managed Kubernetes

With **managed Kubernetes**, the control plane is fully managed by a cloud provider.

- In Google Cloud, this is known as **GKE** (Google Kubernetes Engine)

![image](https://github.com/user-attachments/assets/ebecff3a-f7ca-4c52-9318-12904bba4484)

---

## Google Kubernetes Engine (GKE)

**GKE** is a managed Kubernetes service provided by **Google Cloud Platform (GCP)**. It enables you to deploy, manage, and scale containerized applications using Kubernetes—without manually managing the underlying infrastructure.

### Key Features

- **Managed Kubernetes**: Handles cluster setup, maintenance, and upgrades  
- **Scalability**: Supports automatic scaling of clusters and workloads  
- **Security**: Integrated with Google Cloud IAM and built-in security features  
- **Monitoring & Logging**: Integrated with Cloud Monitoring and Cloud Logging

---

### GKE Modes

- **GKE Autopilot**  
  - Fully managed mode  
  - Google manages both the control plane and worker nodes  
  - Provides automatic scaling, optimized resource usage, and reduced operational overhead  

- **GKE Standard**  
  - Provides full control over worker nodes  
  - Allows custom configurations and greater flexibility  
  - Suitable for workloads requiring customization
