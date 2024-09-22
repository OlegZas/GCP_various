# Creating a Data Stream from CloudSQL to BigQuery

## Steps

1. **In GCP, type `Datastream` in the search bar.**
2. **Enable Datastream API.**
3. **Click Create Stream**
   - **For hostname:** IP of your SQL instance
   - **Connectivity Method:** IP allowlist
   - **Copy all IP addresses inside your CloudSQL authorized network**
     1. Go to **CloudSQL** > **Connections** > **Network** > add copied IP addresses one by one
  
    ![image](https://github.com/user-attachments/assets/06e6eaca-96af-432d-8dc9-e58be9b65cbe)
        
     2. Run the test - it must be successful.
   - **Choose which Databases to connect.**
   - **Create a Connection Profile.**
   - **Staleness limit:** If you need the data to be immediately replicated in BigQuery, select `0`.
   - **Validate Stream.**

![image](https://github.com/user-attachments/assets/c1f15393-d58c-4630-9b7b-01940c6b2d84)

