# How to Create a Firewall Rule in Google Cloud

Creating a firewall rule in Google Cloud Platform (GCP) is a simple process through the GCP Console, and it allows you to specify which traffic should be allowed or denied. Follow these steps to create an effective firewall rule.

## Step 1: Go to the Firewall Rules Section
1. Log in to your Google Cloud Console.
2. Navigate to **VPC Network** on the left-hand menu.
3. Under the **VPC Network** menu, click on **Firewall rules**.
   - This is where you manage the firewall rules that control network traffic to and from your instances.

## Step 2: Create a New Firewall Rule
1. Click the **"Create Firewall Rule"** button at the top of the page.
   - This will take you to a form where you can configure the details of your firewall rule.

## Step 3: Configure the Firewall Rule
Now, you'll need to define the key parameters of your firewall rule. Here’s how you can configure the most common settings:

- **Name:**
   - Choose a descriptive name for the rule (e.g., `allow-http-https` for web traffic or `allow-ssh` for SSH access).
   - The name must be lowercase, and it can include numbers and hyphens (e.g., `allow-ssh`).
  
- **Description (optional):**
   - You can provide a description to help identify the rule later, such as "Allow HTTP and HTTPS traffic to web server" or "Allow SSH access to VM for admin".
  
- **Network:**
   - Select the network where the VM is located (usually **default** unless you’ve set up a custom VPC network).
  
- **Priority:**
   - This defines the priority of the rule. The lower the number, the higher the priority (i.e., more specific rules are applied first). The default value of 1000 is usually sufficient unless you need more complex rule ordering.
  
- **Direction of Traffic:**
   - **Ingress**: Use this for incoming traffic. You’ll typically use ingress for rules that allow external access to your VM.
   - **Egress**: Use this for outgoing traffic if you want to control traffic leaving your VM. For most use cases, you’ll work with ingress rules.
  
- **Action on Match:**
   - Select **Allow** to permit the traffic that matches the rule. If you want to block certain traffic, you could select **Deny** (but this is not common for typical usage).
  
- **Targets:**
   - **All instances in the network**: This means the rule will apply to all VMs in the network. You can also select **Specified target tags** if you want the rule to only apply to specific VMs with certain tags.
  
- **Source Filter:**
   - You can define who is allowed to send traffic to your VM. The most common option is:
     - **IPv4 ranges**: This is typically `0.0.0.0/0`, which means allow traffic from any IP address. This is common for web servers where you want users from anywhere to access the website.
  
- **Destination Filter:**
   - Leave this as **None** unless you need to specify particular destination IPs.
  
- **Protocols and Ports:**
   - Here, you can define which types of traffic are allowed. For instance:
     - **Allow all traffic**: This allows all types of traffic (not recommended for security reasons).
     - **Specified protocols and ports**: This is recommended for security, as you can specify exactly which protocols and ports should be open:
       - `tcp:80` (for HTTP)
       - `tcp:443` (for HTTPS)
       - `tcp:22` (for SSH, if you need to access the VM via SSH).
     - This ensures that only necessary ports are opened for external access.

## Step 4: Save the Firewall Rule
Once you've filled in the details, click the **"Create"** button at the bottom to apply the rule.

## Step 5: Verify the Rule is Working
After the firewall rule is created, verify that it's working by trying to access the relevant services on your VM:

- For HTTP/HTTPS traffic, open a browser and go to `http://<your-vm-ip>` or `https://<your-vm-ip>` (if you've configured SSL).
- For SSH access, try SSH-ing into the VM from your terminal (e.g., using `gcloud compute ssh` or a standard SSH command).

If everything is set up correctly, your VM should be accessible on the specified ports, and the firewall rule will be working as expected.


<img width="387" alt="image" src="https://github.com/user-attachments/assets/298eb688-86e8-4df4-906b-89fc18a00534" />

---

## Once set up, copy the external IP of the VM into your address bar and it should take you to the Apache2 Debian Default Page. 

<img width="734" alt="image" src="https://github.com/user-attachments/assets/06ff131b-30ae-4d1b-ac18-61066bdf423a" />

