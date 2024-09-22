
# Setting Up a Cloud Function with Pub/Sub and Scheduler

## Overview of Cloud Scheduler with Pub/Sub and Cloud Function

Cloud Scheduler sends a message to a Pub/Sub topic that runs every **5 minutes** (set up). This message will then trigger a Cloud Function to extract data from the Shopify store and print out the number of orders to the Cloud Function log. 

This setup serves as a good starting point for writing more advanced ETL pipelines.

<img width="460" alt="image" src="https://github.com/user-attachments/assets/fcc533eb-ca69-48b7-97af-7c06d1354a6a">

## Steps

1. **Create a Pub/Sub Topic**
   - This topic will serve as a trigger for the Cloud Function.
   - Messages from this topic will be used as triggers for the Cloud Function.

2. **Create Cloud Run Function**
   - Link it to the trigger from Pub/Sub.

![image](https://github.com/user-attachments/assets/c7fb272e-a2f0-4246-8531-a9ef07e5c8c6)

3. **Set Up the Scheduler**
   - Schedule a job and set it up.
   - Go to the [Crontab Guru](https://www.google.com/search?q=cron+tab+guru) to get the syntax for the job's run frequency.

![image](https://github.com/user-attachments/assets/d330fdf0-1c8a-43c7-9621-d7ac7d015fa9)

![image](https://github.com/user-attachments/assets/0b1e28e2-c09f-4bdb-b6e7-3a128711b08f)

4. **Configure Cloud Run Functions**
   - Set the runtime, build connection, and runtime variables.

![image](https://github.com/user-attachments/assets/6a933e21-79fa-4dbd-9d01-cb81e060ec5d)

5. **Write the Function**
   - Use Python to write the function, test it, and deploy.
