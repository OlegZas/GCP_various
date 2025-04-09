# Container Registry and Artifact Registry

## Overview
Container Registry and Artifact Registry are services for storing Docker images and other software artifacts in Google Cloud. They help manage and distribute containers and artifacts used in your applications.
![image](https://github.com/user-attachments/assets/57d9281d-3b86-4650-b7b9-ddb01de0d4e2)

### 1. **Container Registry**
- Used specifically for storing **Docker images**.
- **Storage**: Utilizes **Google Cloud Storage (GCS)** buckets to store Docker images.
  - **Limitations**: Can only store **container images**. It cannot store other artifact formats such as **JAR**, **WAR**, or **ZIP** files.

### 2. **Artifact Registry**
- The **evolution** of Container Registry.
- Supports the storage of **both container images** and other artifact formats.
  - Can store formats like **JAR**, **WAR**, **ZIP**, in addition to Docker images.
- **Recommended** in Google Cloud Platform (GCP) for artifact storage.
- Requires the creation of a **separate repository**. It does not use **GCS buckets** for storage.

## Key Differences
| Feature               | Container Registry                        | Artifact Registry                         |
|-----------------------|-------------------------------------------|-------------------------------------------|
| **Supported Formats**  | Only Docker images                        | Docker images, JAR, WAR, ZIP, and more    |
| **Storage**            | Uses GCS buckets                          | Separate repository (not GCS buckets)    |
| **Recommended**        | Not as widely recommended in GCP          | Recommended for new projects in GCP      |

## Conclusion
Artifact Registry is the recommended service for storing both containers and other artifacts in GCP. It provides more flexibility compared to Container Registry, which is limited to only Docker images.
