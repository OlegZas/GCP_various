# Google Cloud Compute Resources
![image](https://github.com/user-attachments/assets/32102b5a-ab6c-4527-bf8f-d6b81b5fbad7)

## Google Compute Engine (GCE)
- **IAAS solution**
- Google manages hardware (physical infrastructure), user manages VMs, software, firewalls, data, etc.
- Supports building Linux and Windows-based VMs
- Allows creation of Custom Machines (define RAM, CPU, Hard Drive specifications)
- Offers sustained and committed usage discounts (1-year, 3-year terms)

## Google Kubernetes Engine (GKE)
- Used for containerized applications
- Fully managed container orchestration
- Includes container control plane + worker nodes
- Features autoscaling and automatic upgrades

## Google App Engine (GAE)
- **PaaS solution**: You don't have to worry about managing virtual machines (VMs), operating systems, or networking. Just upload your application, and Google takes care of the infrastructure.
- Fully managed with autoscaling and downscaling capabilities
- Available in two environments:
  - **Standard Environment**: Simplest option with Google providing preconfigured runtime environments (Python, Node.js, Java, etc.). Optimized for web apps without custom configurations.
  - **Flexible Environment**: Allows more customization, including using Docker containers. Define your runtime and environment in a Dockerfile, with Google managing the VMs running these containers. Useful when you need more control or have specific software dependencies.

## Cloud Run
- Serverless (managed by Google) PaaS solution that handles containerized applications
- Essentially combines Google App Engine + containers
- **Cloud Functions** are now called "**Cloud Run Functions**" and run within Cloud Run
  - Operate in an *event-driven* manner (HTTP, file upload, etc.)
  - Maintain serverless functionality
  - Now part of the broader Cloud Run ecosystem, supporting containerized workloads and greater flexibility

## Selecting the Right Compute Option

### Decision Tree
1. Does your application need an IAAS solution (OS dependency or custom machine requirements)?
   - **Yes**: Use Compute Engine
   - **No**: Continue to next question

2. Is your application containerized or cloud-independent?
   - **Yes**: Does it require orchestration?
     - **Yes**: Use Google Kubernetes Engine (GKE)
     - **No**: Use Cloud Run
   - **No**: Is it event-driven?
     - **Yes**: Use Cloud Functions (for trigger-based operations)
     - **No**: Use App Engine (Standard or Flexible - the latter uses Docker)
