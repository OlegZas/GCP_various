# Block, File, and Object Storage in GCP

## Block Storage
Block storage is a type of storage that attaches hard disks to virtual machines, such as persistent disks.
![image](https://github.com/user-attachments/assets/30cc1822-8b15-4b54-b08f-65d34ad7ab53)

- Attached to a computer (virtual machine)
- One block storage device (hard disk) can only be attached to one virtual server, but a virtual server can have multiple storage devices attached
- Direct-attached storage – like a hard disk
- Storage Area Network (SAN) – high-speed network connecting a pool of storage devices (e.g., Oracle or SQL Server)

### In GCP:
- **Persistent Disks** – Block storage on the network; can be zonal (data in one zone) or regional (in multiple zones)
- **Local SSDs** – High-performance storage attached directly to the virtual machine
![image](https://github.com/user-attachments/assets/f21c7803-b611-499a-8e19-2b757b5399e3)
![image](https://github.com/user-attachments/assets/7a1fcbac-4283-49ee-b499-ee2aa7d91bd4)

---

## File Storage
![image](https://github.com/user-attachments/assets/6bd6cdfe-fbb7-466c-bd15-89cb36796c39)

File storage is a system that organizes and stores data as files, like a file server or file share.

- Shared by several virtual servers
- Used when enterprises need a quick way to share files securely
- Often used in media workflows that require large shared storage for video editing
![image](https://github.com/user-attachments/assets/38e79112-d353-4077-bb97-87497c2948f1)

### In GCP:
- **Filestore** – Managed file storage for applications that require a file system interface and a shared file system

---

## Object Storage
Object storage is a cloud-based storage system that stores data as objects, such as in cloud storage solutions.

- Cloud Storage: Files in the bucket are stored as objects
- Files (objects) are updated as a single unit, not partial updates
- Has access control at the **object level** (can restrict access to individual files)
- The CLI for Cloud Storage is `gsutil` (not `cloud`)
- Commonly used to store text, binary files, backups, and archives
![image](https://github.com/user-attachments/assets/2e725592-f764-4337-a3a6-2f0bc503a131)

##	Cloud Storage – Storage Classes: 
- Storage class can be assigned to a specific object (otherwise will get default) 
- All storage classes: 
  - Unlimited storage
  - Auto-scaling
    
 ![image](https://github.com/user-attachments/assets/5a039769-164e-44b4-a1d4-3187fed626fe)

## Object life-cycle management: 
-	Helps you to save costs by automatically moving files between the storage types 
-	It is automated and you just set the conditions based on which they’ll be selected 
-	Can only be moved down a class
-	Identify objects using conditions: 
  - o	Age, createdBefore, IsLive, MatchesStorageClass, NumberOfNewVersions etc. 
### Two kinds of actions: 
  - SetStorageClass actions (change from one storage class to another) 
  - Deletion actions (delete objects)
    
![image](https://github.com/user-attachments/assets/c57da0e5-5759-4592-a90b-4c7e91d2fdf8)

![image](https://github.com/user-attachments/assets/1f74bfb6-2db9-4d57-8234-312423a762f6)
![image](https://github.com/user-attachments/assets/571aecb8-bcc9-4c35-a2bf-102506dbfaac)

---
# Transferring from On-Premises to Cloud

## Options:

1. **Online Transfer**: Use `gsutil` or API to transfer data to Cloud Storage
   - There are a number of APIs provided by Cloud Storage
   - Good for one-time transfers
   - Recommended only when transferring <1 TB from on-premises or another GCS bucket

2. **Storage Transfer Service**: Recommended for large-scale (petabytes) online data transfer from AWS, Azure, private data centers, etc.
   - Can set up a repeating schedule
   - Supports incremental transfers
   - Fault-tolerant
   - Recommended when transferring more than 1 TB from anywhere or transferring from a different cloud

![image](https://github.com/user-attachments/assets/f1ec534b-3933-4c5b-9039-d536d1910260)

3. **Appliance Transfer**: For transfers of physical data with physical storage (physical appliance will be sent to you by Google)
   - Used when data size is greater than 20 TB or when the transfer takes more than 1 week
   - You transfer data to the appliance, ship it to Google, and Google copies that data into your storage

![image](https://github.com/user-attachments/assets/b5e0f7a8-24a1-42ac-b74d-667e9c1588ad)
