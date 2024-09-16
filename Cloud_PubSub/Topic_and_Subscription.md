# Tutorial: Creating a Topic and Subscriptions

## 1. Console: Create/Use Existing Project

- Access the Google Cloud Console and create or use an existing project.

## 2. Create a Topic

- Navigate to:
  
  > Cloud Pub/Sub > Create a Topic

## 3. Create a Subscription

- After creating the topic, create a subscription:
  
  > Cloud Pub/Sub > Topics > Subscriptions > Create Subscription

![image](https://github.com/user-attachments/assets/12694cdd-5bc4-4300-920d-7d88f496a16a)

## 4. Add Proper Permissions to the Service Account

a. Assign **Subscriber** and **Publisher** permissions to the service account:
  
   - Subscriber: Consume messages from a subscription.
   - Publisher: Publish messages to a topic.

     ![image](https://github.com/user-attachments/assets/8c3906e4-a4fb-480e-9425-ecb5af7e51b6)

b. Click **Continue** to grant user access to this service account if necessary.

c. Create a **key** for the service account, which will be used by the client library to access the Pub/Sub API.

## 5. Start Publisher and Subscriber Applications

a. **Install the Google Cloud SDK** to start working with Pub/Sub services.

b. Watch the **3D video tutorial** for further instructions.

## 6. Test by Creating Sample Messages

- After setting

![image](https://github.com/user-attachments/assets/5c30b73d-ed67-4e94-aec5-054b6244f13f)

