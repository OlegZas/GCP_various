# Connecting a GCP VM to a Cloud SQL Instance

## 1. Public IP Connection

- **Enable Public IP on Cloud SQL:**
  - Make sure your Cloud SQL instance has a public IP enabled.

- **Authorize VM's External IP:**
  - Go to your Cloud SQL instance in the GCP Console.
  - Navigate to the **Connections** tab.
  - Under **Authorized networks**, add the external IP address of your GCP VM (you can find this in the VM details).

- **Install Database Client:**
  - SSH into your VM.
  - Install the necessary client for your database (e.g., MySQL client for MySQL databases).

  ```bash
  sudo apt-get update
  sudo apt-get install default-mysql-client

 - **Connect to Cloud SQL:** 

Use the following command to connect:

```bash
mysql -h [CLOUD_SQL_IP] -u [USERNAME] -p
```
Replace [CLOUD_SQL_IP] with the public IP address of your Cloud SQL instance, and [USERNAME] with your database username.

## 2. Private IP Connection

### Enable Private IP

If you want a more secure setup, create your Cloud SQL instance with a private IP.

### Configure Private Services Access

Ensure your VM is in the same VPC network as your Cloud SQL instance or has access through VPC peering.

### Connect to Cloud SQL

1. SSH into your VM.
2. Install the necessary database client as before.
3. Use the following command to connect:

   ```bash
   mysql -h [PRIVATE_IP] -u [USERNAME] -p
    ```

Replace [PRIVATE_IP] with the private IP address of your Cloud SQL instance.

<img width="506" alt="image" src="https://github.com/user-attachments/assets/89651463-af8e-46fb-9181-d7bafbdc7a96">

