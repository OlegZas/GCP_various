# Deploying Application using Managed Instance Groups

## 1. Create a New Instance Template (in Compute Engine)

An **Instance Template** doesn’t hold any data; it’s just configuration information for your virtual machine.

![image](https://github.com/user-attachments/assets/797471d2-642d-44e4-b58e-85bc8121af88)

## 2. Navigate to Instance Groups through Compute Engine

![image](https://github.com/user-attachments/assets/f7ca88fc-ba80-41ad-981f-34ecfdaab984)

## 3. Choose the Type of Instance Group

- **New Managed Instance Group (Stateless)**
  - **Purpose**: For VMs that perform stateless tasks like serving web requests or batch processing where data does not need to be retained between sessions.
  - **When to use**: Use when the application doesn’t rely on persistent data, and each VM can be treated as disposable (e.g., web servers, front-end services).
  
- **New Managed Instance Group (Stateful)**
  - **Purpose**: For VMs that need to maintain persistent data or configurations, such as databases or applications requiring state retention.
  - **When to use**: Use when the VMs host stateful applications like databases or legacy systems, where data or configuration must be preserved across restarts.

- **New Unmanaged Instance Group**
  - **Purpose**: A group of VMs managed manually, without auto-scaling or automated updates.
  - **When to use**: Use when you need full control over VM configuration, scaling, and updates (e.g., legacy systems or custom setups). You handle scaling and health checks yourself.

## 4. When Creating an Instance Group, Add a Health Check

![image](https://github.com/user-attachments/assets/dc0110ea-1c75-4739-ab21-c88add377780)

- When creating Instance Groups, it will create the number of VM instances that you’ve specified.

## 5. After Creating, Click on the External IP of the Instances to Ensure the Page is Loading

![image](https://github.com/user-attachments/assets/49063bb2-4b1f-4330-905c-3a31e05e3088)

## 6. Create a Load Balancer

To create a **Load Balancer**, go to **Network Services**.

A load balancer is a system that distributes incoming network traffic across multiple servers to ensure no single server is overwhelmed, improving performance, reliability, and scalability.

- It will redistribute traffic among instances and reroute traffic to other instances if one instance goes down.

### Why create it?
1. **Improved Performance**: Distributes traffic evenly, preventing any server from being overloaded.
2. **High Availability**: Ensures that if one server fails, others can handle the traffic.
3. **Scalability**: Makes it easy to add more servers as demand increases.

![image](https://github.com/user-attachments/assets/facd2da6-76e1-4d33-a205-472d25e70b7b)

### Configure the Load Balancer Before Clicking Create:

![image](https://github.com/user-attachments/assets/02080fc8-0ff4-468f-bed1-d062a7b6bbc7)
