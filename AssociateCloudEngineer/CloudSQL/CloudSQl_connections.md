# Cloud SQL: Cloud Shell, MySQL Workbench & Cloud SQL Studio

## 1. Create Cloud SQL Instance

- When you create a MySQL instance on AWS (RDS) or GCP (Cloud SQL), the data is stored in the instance itself, but you can query it from outside the cloud environment.
- The point of creating a MySQL instance on cloud services like AWS or GCP is to leverage the **scalability**, **availability**, and **managed infrastructure** that these providers offer—even if you connect using tools like Workbench or DBeaver.
- Choose the SQL dialect (e.g., MySQL, PostgreSQL, etc.)
<img width="647" height="503" alt="image" src="https://github.com/user-attachments/assets/fcd4253e-d30c-4fe4-8279-39b9e8a43a9f" />

---

## 2. Create a Firewall Rule in VPC Network

This is done to allow your **IP address** to access the Cloud SQL instance.

- **TCP**: Use port `3306` (default port for MySQL).  
  You can also specify other ports if necessary (e.g., `80`, `443` for HTTP/HTTPS access).

- **Source IPv4 Ranges**: Your public IP address  
  (Find it at [whatismyip.com](https://www.whatismyip.com))

**Example Configuration:**

| Setting               | Value                                                |
|-----------------------|------------------------------------------------------|
| **Name**              | `forsql`                                             |
| **Description**       | Allow MySQL access to Cloud SQL instance from my IP |
| **Network**           | `default`                                            |
| **Priority**          | `1000`                                               |
| **Direction of Traffic** | `Ingress`                                       |
| **Action on Match**   | `Allow`                                              |
| **Targets**           | All instances in the network                         |
| **Source Filter**     | `IPv4 ranges`                                        |
| **Source IPv4 Ranges**| `your-public-ip/32` (Replace with your actual IP)   |
| **Protocols and Ports**| `TCP:3306`                                          |

<img width="707" height="771" alt="image" src="https://github.com/user-attachments/assets/2476c4f2-3d40-4260-a58e-e1e056200907" />

---

## 3. Add Your IP Address to the Instance’s Authorized Networks

Navigate to:  
`Instance > Connections > Networking > Authorized Networks`  
Add your public IP address here to allow access.
<img width="561" height="564" alt="image" src="https://github.com/user-attachments/assets/0ed2ac87-97e7-4a13-91bd-a5c9eae9e99c" />

---

## 4. Connect to the Instance with MySQL Workbench

- **Hostname**: Use the **public IP** of your Cloud SQL instance
<img width="975" height="617" alt="image" src="https://github.com/user-attachments/assets/54c846e1-b744-49e9-9ebf-bb5f9f06ee02" />

---

## 5. Create a Database in Cloud SQL Instance

Use MySQL Workbench, Cloud Shell, or Cloud SQL Studio to create your database.
<img width="975" height="360" alt="image" src="https://github.com/user-attachments/assets/bcae695f-2f0e-4c4f-ba30-880ecd7aef47" />

---

## 6. Create the Tables and Your Data

Define your schema and insert the necessary data into the tables.

<img width="975" height="714" alt="image" src="https://github.com/user-attachments/assets/4290f159-bb59-4aa6-8638-2fda47435a27" />

---

## 7. Connect with Cloud Shell

In the **overview** of your Cloud SQL instance, click on:

> `Open Cloud Shell`

<img width="612" height="594" alt="image" src="https://github.com/user-attachments/assets/f13954a7-b0d0-4784-a086-7aecd2915295" />

---

## 8. Run SQL Queries from Cloud Shell
Use the MySQL CLI to run your SQL commands:

<img width="623" height="923" alt="image" src="https://github.com/user-attachments/assets/f7425417-6e31-4766-ae54-9147df951e8d" />


## 9.	To connect with Cloud SQL Studio, you need to create an additional user (cannot use root) : 
<img width="767" height="472" alt="image" src="https://github.com/user-attachments/assets/445a3eed-e9eb-442c-a4e7-3b6ac14f5d9c" />



## 10.	Authenticate the user to connect to the database and then you can write your queries in the studio. 

<img width="798" height="332" alt="image" src="https://github.com/user-attachments/assets/38829178-1bf5-44ea-9d83-cbbf9a1c179c" />
