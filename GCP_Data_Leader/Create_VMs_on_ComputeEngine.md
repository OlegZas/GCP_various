# Creating VM and Apache2 Installation and Setup Guide

1. **Get to VM instances through Compute Engine.**  
   ![image](https://github.com/user-attachments/assets/a6f3526e-68a1-4f58-8f7c-262ffbce92ec)

2. **Create an instance and set configurations.**  
   ![image](https://github.com/user-attachments/assets/d9390456-d337-4ce0-b2b7-205aaee843bf)

3. **Open SSH in Cloud Shell to be able to activate the instance and write commands in it:**  
   ![image](https://github.com/user-attachments/assets/4f681902-3acd-4587-bad3-531045eaeffd)

4. **Run the following to install Apache2. This will be used to run your website outside of gcp.**  
   Apache2, also known as Apache HTTP Server, is one of the most widely used open-source web servers in the world. It serves as a platform for hosting websites and web applications.

```
sudo apt update            # Update package list
sudo apt install apache2    # Install Apache2
```
5. **Type the following to check the status and if it's running:**

   ```
   sudo service apache2 status 
   ```

![image](https://github.com/user-attachments/assets/f1f2e3bb-589e-435a-befd-41c01bceabd9)

- **if it is not running, active it:**

  ```
  sudo systemctl start apache2  # Start Apache2 service
  ```

6. **To access the site on port 80, you will need to create a firewall rule:**

 **Creating a Firewall Rule in Google Cloud Platform (GCP)**

Creating a firewall rule in Google Cloud Platform (GCP) is crucial for managing network traffic and securing your cloud resources. A firewall rule allows you to control which traffic can flow to and from your virtual machine (VM) instances, networks, and other services within GCP.

a. **Get your IP address and paste it in the Source IP ranges:**

![image](https://github.com/user-attachments/assets/687dc14e-99e1-49af-9e7b-603cac5f0866)

b. **Specify the port:**

   ![image](https://github.com/user-attachments/assets/d123127f-5852-4257-bf76-a7fa0ea1cf6b)

   7. **View network details for your instance to check the firewall rules that apply** 
      
      ![image](https://github.com/user-attachments/assets/66a9384e-2735-4bef-9ea5-7bc4868b631d)

8. ** Create a connectivity test to check the connection between checkpoints so you can access your website outside of GCP**

![image](https://github.com/user-attachments/assets/175d610c-675d-456e-80ae-68388ed11c09)

9. ** Paste the external IP address of your instance in your browser's search bar **

![image](https://github.com/user-attachments/assets/34c81306-a69d-472d-8be3-b9959a8b1f2c)

