# Creating VM and Apache2 Installation and Setup Guide

1. **Get to VM instances through Compute Engine.**  
   ![image](https://github.com/user-attachments/assets/a6f3526e-68a1-4f58-8f7c-262ffbce92ec)

2. **Create an instance and set configurations.**  
   ![image](https://github.com/user-attachments/assets/d9390456-d337-4ce0-b2b7-205aaee843bf)

3. **Open SSH in Cloud Shell to be able to activate the instance and write commands in it:**  
   ![image](https://github.com/user-attachments/assets/4f681902-3acd-4587-bad3-531045eaeffd)

4. **Run the following to install Apache2.**  
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
