# IAM (Identity and Access Management) in Google Cloud Platform (GCP)

IAM is a system that enables administrators to manage who has access to specific resources in GCP, and what actions they can perform on those resources.

### Key Concepts:
- **Authentication**: Identifying users, applications, or unauthenticated users.
- **Granular Control**: Provides fine-grained control over who can access resources and perform actions.

### Core Concepts of IAM:
1. **Member**: Example: Oleg
2. **Resource**: A specific cloud storage bucket.
3. **Action**: Operations such as upload or delete objects.
4. **Role**: A set of permissions to perform specific actions on specific resources.
   - **Roles DO NOT know about members**. It's all about permissions.
   - **Basic roles** (not recommended):
     - **Owner**: Manage roles, permissions, billing, and more.
     - **Editor**: Read and edit resources.
     - **Viewer**: Read-only access.
   - **Predefined roles**: Created by Google for specific tasks.
     - Example: `storage.admin`, `storage.object.admin`, `storage.object.viewer`, `storage.object.creator`.
   - **Custom roles**: Create your own role when predefined roles are not sufficient.
5. **Policy**: Assign a role to a member through a policy.

### IAM Process:
1. **Identify the proper role** with the correct permissions (e.g., `storage.object.admin`).
2. **Create a policy** to bind the member to the specific role (with permissions).

---

## Walkthrough:

### 1. Create a Principal and Assign a Predefined Role
   - Create a principal (user or service account) and assign them a predefined role.
     
![image](https://github.com/user-attachments/assets/26550be1-a6df-4019-acb7-3a40a9cc690f)

### 2. Use the **User Policy Troubleshooter** to Check User Permissions
   - This tool allows you to verify if the user has specific permissions to perform the desired actions.
     
![image](https://github.com/user-attachments/assets/f1dc8e8b-6397-45d4-8b05-fb8a3461364b)

---

## Service Accounts:

- **Service accounts** are identified by email addresses and are often shared by users.
- **Service accounts** do not require private user credentials.
- When a **VM** is created using **Compute Engine**, it is assigned a default Compute Engine service account.
- Service accounts do not have a password, instead, they use private/public RSA key pairs.
- By default, service accounts have **Editor** roles.

### Service Account Setup:
1. **Create a Service Account** and assign it specific roles (e.g., `storage.admin`).
   
   ![image](https://github.com/user-attachments/assets/0ba9dd0a-73ce-4711-a203-138369b1eb11)

2.  **Set the Service Account** where necessary (e.g., attach it to a VM).
   
   ![image](https://github.com/user-attachments/assets/d418b744-64e4-41dc-b364-ba74605848ae)

3. **Add a User to a Project** in the resources.
   ![image](https://github.com/user-attachments/assets/6690794a-f39d-4c13-92f6-063cbe2c448f)

4. **Create a VM Instance** and open SSH in a new window. Try to create a bucket:
```bash
gsutil mb gs://bucket-olegzasbucket1
```
5.	You get a 403 error access denied. You need to add storage permissions to the service account to access storage with it. Go to IAM and add StorageAdmin permission to your service account. 
 ![image](https://github.com/user-attachments/assets/8ad06182-6cce-4f90-81aa-93e39235c1bc)

6.	In SSH create the bucket by running the following:
![image](https://github.com/user-attachments/assets/e766944e-f98f-4387-ae78-0925da927df4)
