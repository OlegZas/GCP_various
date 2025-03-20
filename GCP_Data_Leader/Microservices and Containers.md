# Microservices and Containers
- **Microservices** are small applications that can be built in different programming languages (not recommended)
- **Downside:** Deployments are complex (e.g., the way you deploy on `CustomerService` can be in a different language from `BookingService`)

---

### Containers:
- **Docker** – A tool that helps you create a Docker image containing everything necessary to run a microservice.
    - A Docker image contains:
        - Application runtime (e.g., JDK, Python, or Node.js)
        - Application code and dependencies
    - It runs the same way on any infrastructure (cloud, corporate data center, local machine) and can create containers from the Docker image.
    - Docker containers are much lighter than VMs because they do not contain a Guest OS.
    - You run Java or Python containers on top of the **Docker Engine**.
    - Docker images are **cloud-neutral**.
    - Docker containers are **isolated**.

---

### Container Management:

![image](https://github.com/user-attachments/assets/32e53ce8-48ec-48cb-9f7b-7f219c15dabf)

- As you scale up and manage a large number of containers across multiple servers, manual management becomes impractical. This is where **container orchestration tools** come into play.
- **Container orchestrator** refers to tools that manage the deployment, scaling, networking, and operations of multiple containers in a distributed system.

- **Kubernetes**: The most widely used open-source container orchestration platform. It automates deployment, scaling, and management of containerized applications.
    - It organizes containers into clusters, each of which can have multiple servers.
    - Based on the number of requests coming into a microservice (e.g., `Microservice A`), the container orchestrator can scale the number of instances of that specific container.
    - **Service discovery**: Each microservice can ask the orchestrator for the location of other microservices.
    - **Load balancing**: Distributes the load among multiple containers.
    - **Self-healing**: If one of the instances is not working properly, the orchestrator can be configured to find it and replace it.
    - **Zero downtime**: New versions can be released without downtime.

![image](https://github.com/user-attachments/assets/452572b2-5fd8-4aa7-bdec-c6d11146c899)

