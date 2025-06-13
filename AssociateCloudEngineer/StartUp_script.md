# Startup Script

## What is a Startup Script?

A **startup script** is a shell script (like a `.sh` file on Linux or PowerShell script on Windows) that runs **automatically every time a VM instance starts** (boot or reboot). It's part of instance metadata and can be provided when creating a VM.

A shell script can be created and uploaded into a **Cloud Storage bucket**, and VM instances can retrieve the startup script from there.

- When creating a **VM Instance Group**, you can add a startup script which will be shared by **all VM instances** in the group.

---

## What Can a Startup Script Do?

Startup scripts let you:

- ✅ Install packages, libraries, or dependencies  
  _Example: `apt install nginx`_
- ✅ Download and set up code  
  _Example: clone a Git repository_
- ✅ Configure services, firewalls, or other system settings

---
![image](https://github.com/user-attachments/assets/ad9210aa-d332-449e-ae20-432d52d5151a)

---

## How to Use a Startup Script with Google Cloud

### 1. Create a Storage Bucket

Upload your shell script (e.g., `startup.sh`) to a Google Cloud Storage bucket.
![image](https://github.com/user-attachments/assets/19321fe6-856d-4f9d-8b4d-48e5d6e577d9)

### 2. Configure the VM to Use the Script

When creating a new VM:

- Go to the **"Management, security, disks, networking, sole tenancy"** section
- Under **"Metadata"**, add a new item:
  - **Key**: `startup-script-url`
  - **Value**: `gs://your-bucket-name/startup.sh` (Replace with the actual path to your script)
![image](https://github.com/user-attachments/assets/8723476a-3ad0-4895-b236-099806540722)

---

## Example Startup Script (Linux)

```bash
#!/bin/bash
apt update
apt install -y nginx
systemctl start nginx
echo "Hello from startup script!" > /var/www/html/index.html

---


