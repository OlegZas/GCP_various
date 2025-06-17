# Deploy Python Application on Google App Engine

## Steps

1. **Create an App Engine instance**
![image](https://github.com/user-attachments/assets/9965d2e8-d4c8-4a02-9ae4-1c1eb99a2d50)

2. **Create the `.py` file** with the code of your app.
![image](https://github.com/user-attachments/assets/c3f4c4f2-9c1f-4b92-aa41-e75b68e46a82)

![image](https://github.com/user-attachments/assets/6b6c56ba-0ff8-410a-a532-e5ef661720bf)

3. **Prepare deployment files**  
   To deploy on App Engine, you need:
   - `app.yaml` file
   - `requirements.txt` file

![image](https://github.com/user-attachments/assets/1f01a573-552a-4394-b9ea-e12b40fb8c2f)

4. **Deploy the project**  
   Run the following command:
   ```bash
   gcloud app deploy --project=theta-topic-423803-u2 -v=v02
    ```

![image](https://github.com/user-attachments/assets/a4d3c8d2-cf06-4df3-b65a-d28e0418d0da)

5. **Default Service Creation**  
   When you deploy for the first time using App Engine, it creates the **default service** automatically.

![image](https://github.com/user-attachments/assets/6c0139b4-3f75-401d-8b9d-bb6624dcdf0e)

6. **Checking Logs for Errors**  
   If you encounter an error when attempting to run the service (e.g., by clicking on "default" under **App Engine > Services**), navigate to:

   **App Engine > Versions**  
   to check the deployment logs and troubleshoot issues.

![image](https://github.com/user-attachments/assets/ea7be3c8-b168-4dd1-9840-5a207110e69e)

7. **Creating a New Version (for Testing)**  
   When updating your application with code changes, it's important to test the new version before routing traffic to it.

   Use the following command:
   ```bash
   gcloud app deploy --project=theta-topic-457803-u2 -v=v3 --no-promote
    ```

The --no-promote flag ensures that traffic does not get automatically routed to the new version. Instead, it remains on the currently active version so the new deployment can be tested safely.

![image](https://github.com/user-attachments/assets/ee8bbd28-8036-498e-ae98-3176af2869df)

8. **Splitting Traffic Between Versions**  
   To split traffic between different versions of your app:

   - Go to **App Engine > Versions**
   - Select the versions you want to use
   - Use the traffic-splitting UI to allocate percentages as needed

![image](https://github.com/user-attachments/assets/782364ba-1f50-49f3-846e-779980e7afc4)

![image](https://github.com/user-attachments/assets/d049df48-4cf7-49da-8609-e76a0572f8cb)
