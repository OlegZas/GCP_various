# Create a Windows Server VM on GCP

Follow these steps to create a Windows Server VM instance on Google Cloud Platform (GCP):

## 1. Go to Compute > Create Instance > OS and Storage > Change
- Navigate to **Compute Engine** in the Google Cloud Console.
- Click **Create Instance**.
- Under the **Boot Disk** section, click **Change** to select the appropriate Windows Server version.
![image](https://github.com/user-attachments/assets/04b178bc-bac2-4b2c-80e0-a6a1d8cb4adb)

## 2. Configure Firewall (Optional)
- Under the **Firewall** section, check the boxes for:
  - **Allow HTTP traffic** (if you want the VM to serve web traffic).
  - **Allow HTTPS traffic** (if you plan to use SSL/TLS).
- These are optional depending on whether you need your VM to serve web traffic.

## 3. Set up Access for RDP (Remote Desktop Protocol)
- **Windows Server VMs** on GCP come with an RDP setup to allow remote access.
- Under the **Security** section, ensure that the **"Allow full access to all Cloud APIs"** option is selected. This will enable the VM to communicate with other Google Cloud services.

## 4. Review and Create the VM
- Review all the configuration settings, and if everything looks good, click **Create**.
- The VM instance will be created, which may take a few minutes.

## 5. Connect to Your Windows Server VM via RDP
After the instance is created, follow these steps to connect to the VM using Remote Desktop Protocol (RDP):

1. Go to **VM instances** in the Google Cloud Console.
2. Click on the name of the instance you just created.
3. Under the **Remote access** section, click **Set Windows password**.
4. Enter a username (e.g., `admin` or `your-username`) and click **Set**. This will generate a password.
5. Once the password is generated, **copy** it.

Now, you can connect to your Windows Server VM using RDP:
- Open the **Remote Desktop Connection** app on your local machine.
- Enter the **external IP address** of the VM instance (found in the VM instance details).
- Use the username and password you generated in the previous step to log in.
