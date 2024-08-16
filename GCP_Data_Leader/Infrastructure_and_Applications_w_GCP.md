# 1. Modernizing Infrastructure with the Cloud

**Virtualization** is a form of resource optimization that lets multiple systems run on the same hardware.

A **virtual machine (VM)** is a software-based emulation of a physical computer. It allows you to run an operating system (OS) and applications in an isolated environment on top of a host computer.

**Compute Engine** is Google Cloud's infrastructure as a service product that lets users create and run virtual machines on Google infrastructure.

- Each virtual machine contains the power and functionality of a fully-fledged operating system.
- A virtual machine instance can be created through the Google Cloud Console, a web-based tool to manage Google Cloud.

An **API** (Application Programming Interface) is a set of instructions that allows different software programs to communicate with each other.

**Containers** virtualize software layers above the operating system level (unlike VMs).

- Faster and more efficient than VMs.
- A container is packaged with your application and all of its dependencies, so it has everything it needs to run.

**Kubernetes** is an open-source platform designed to automate the deployment, scaling, and management of containerized applications.

- It makes it easy to orchestrate many containers on many hosts, scale them, and easily deploy rollouts and rollbacks.

**Google Kubernetes Engine (GKE)** is a Google-hosted, managed Kubernetes service in the Cloud.

- The GKE environment consists of multiple machines, specifically Compute Engine instances grouped to form a cluster.
- GKE makes it easy to deploy applications by providing an API and a web-based console.

**Cloud Run** is a fully managed serverless platform to deploy and run containerized applications without needing to worry about the underlying infrastructure.

- After your application code is containerized and deployed to Cloud Run, Google Cloud takes care of scaling and managing the infrastructure automatically.

**Serverless Computing**:

- Serverless computing doesn't mean there's no server; it means that resources like compute power are automatically provisioned in the background as needed.

**GCP provides**:

- **Cloud Run**: A fully managed environment for running containerized applications.
  - With this product, you don't have to worry about the underlying infrastructure.
- **Cloud Functions**: A platform for hosting simple single-purpose functions that are triggered by events emitted from your Cloud infrastructure and services.
  - For example, sending a notification to a mobile device when a new order is placed on a website.
- **App Engine**: A service to build and deploy web applications.

![image](https://github.com/user-attachments/assets/1a66f093-e428-4452-b096-8296d8e045f2)

# 2. Application Modernization

An **application** is a computer program or software that helps users do something.

**Modern Cloud Applications Development**:

- Modern cloud applications are typically built as a collection of microservices.
- Microservices are independently deployable, scalable, and maintainable components that can be used to build a wide range of applications, allowing application features to be released without the rest of the application being complete.

**GCP Rehosting Legacy Applications**:

- **Lift and Shift**: An application is moved from an on-premises environment to a cloud environment without making any changes to the application itself.
- **VMware Engine**: Helps migrate existing VMware workloads to the cloud without having to rearchitect the applications or retool operations.
- **Bare Metal Solution**: A fully managed cloud infrastructure solution that lets organizations run their Oracle workloads on dedicated, bare metal servers in the cloud.

**APIs - Application Programming Interfaces**:

- They allow applications to interact with each other in a standardized and efficient way.
- An API is a set of instructions that lets different software programs communicate with each other.
- They let developers access functionality and data from other programs without having to write all the code themselves, saving time and effort.
- An API takes a request from one software program, communicates with another program, and returns a response.

**Apigee API Management**: Google Cloud's API management service to operate APIs with enhanced scale, security, and automation.

- It helps with developing and deploying APIs through a visual API editor and a test sandbox.
- It offers API versioning, API documentation, and even API throttling, which is the process of limiting the number of API requests a user can make in a certain period.

**Hybrid Cloud**:

- A hybrid cloud environment comprises some combination of on-premises or private cloud infrastructure and public cloud services.

**Multi-Cloud**:

- A multi-cloud environment is where an organization uses multiple public cloud providers as part of its architecture.

**GKE Enterprise** is a managed production-ready platform for running Kubernetes applications across multiple cloud environments.
