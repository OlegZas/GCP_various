# Steps to Set Up a VM in GCP

1. **Enable Compute API:**
   - Go to **Compute Engine > VMs** and click the “Create Instance” button to start configuring your VM.

2. **Configure VM Settings:**
   - **Name:** Provide a name for your VM.
   - **Region and Zone:** Choose the appropriate region and zone based on your needs.
   - **Machine Type:** Select a machine type that fits your performance requirements (e.g., standard, high CPU, or high memory).

3. **Choose an Operating System:**
   - Under the "Boot disk" section, click "Change" to select the operating system (Linux or Windows) and version you want to use.

4. **Configure Firewall Rules:**
   - Check the boxes to allow HTTP and/or HTTPS traffic if you plan to host web applications.

5. **Add SSH Keys (for Linux VMs):**
   - If you’re creating a Linux VM, add your SSH keys for secure access.

6. **Configure Additional Settings (optional):**
   - Adjust settings for networking, identity and API access, and monitoring as needed.

7. **Create the VM:**
   - Click the “Create” button to launch your VM.

8. **Access the VM:**
   - Once the VM is created, you can access it using SSH (for Linux) or RDP (for Windows) through the console.

9. **Install Necessary Software:**
   - Once logged in, install any required software and configure your environment.

10. **Deploy Applications:**
    - Upload and run your applications on the VM.

11. **Monitor and Manage Your VM:**
    - Use the GCP console to monitor performance, set up alerts, and manage your VM as needed.

# Creating Compute Engine VM from the Cloud Shell CLI: 
<img width="950" alt="image" src="https://github.com/user-attachments/assets/d42c5a88-459e-41a5-b929-1c43d49134fc" />
