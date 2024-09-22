## Connecting to MySQL Workbench Locally

### 1. Find Your Public IP Address:
- Search "What is my IP" on Google to get your public IP address.

### 2. Add Your IP to the Cloud SQL Instance:
- Go to your Cloud SQL instance in the Google Cloud Console.
- Navigate to `Connections > Network`.
- Add your public IP to the list of **Authorized Networks**.

### 3. Configure MySQL Workbench:
- Open **MySQL Workbench**.
- In the **Connections** window, create a new connection or edit an existing one.
- For the **Hostname**, enter the **public IP** of your Cloud SQL instance.
- Set the **Username** to the appropriate user for your instance, and enter the corresponding password.

### 4. Test and Connect:
- Click **Test Connection** to verify the setup.
- Once successful, save the configuration and connect to your Cloud SQL instance.
