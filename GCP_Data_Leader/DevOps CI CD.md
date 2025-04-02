# DevOps, CI, and CD

## Continuous Integration (CI)
Continuous Integration is a process where each time someone adds new code, it is automatically checked and tested to make sure it doesn't break anything in the project.

## Continuous Deployment (CD)
Continuous Deployment automatically sends (deploys) the code to users without needing anyone to manually do it.
![image](https://github.com/user-attachments/assets/31cd9fe9-e6be-4549-a521-9e33f8c58b01)

---

## Key Tools & Services in DevOps

### Cloud Source Repositories
- Fully-featured, private Git repositories.
- Similar to GitHub.

### Container Registry
- Store your Docker images here.

### Jenkins
- Tool to run your continuous integration pipelines.

### Cloud Build
- Managed service used to build deployable artifacts (e.g., JARs or Docker images) from your source code and configuration.

### Spinnaker
- Multi-cloud continuous delivery platform.
- Can deploy to GKE, Google Compute Engine, Google App Engine, etc.

### Terraform
- A tool that helps you manage and set up things in the cloud (infrastructure provisioning), like servers, databases, networks, and other resources, all in a way that is automated and repeatable.
- Think of Terraform as a way to treat your cloud infrastructure like computer code. You describe the resources you need in a configuration file, and Terraform takes care of setting them up and keeping them in the right state.

![image](https://github.com/user-attachments/assets/1156c79a-0447-4c63-a080-b82b36eb86b8)

---

## DevOps Operations in GCP

### Monitoring
Used for infrastructure and application quality checks:
- To understand how much CPU and memory your app is using.
- Set up **alerts** for abnormal behaviors.

### Logging
- Centralized logging solution to check all your running applications.
- **Audit logging**: Logs the actions of your team and the GCP team on your resources.
  - Example: Someone started a VM?

---

By utilizing these tools and practices, you can create an efficient, automated, and scalable infrastructure that continuously integrates and deploys code to users while ensuring quality and performance across your systems.
