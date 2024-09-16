# Tutorial: Creating a Topic and Subscriptions

## 1. Console: Create/Use Existing Project

- Access the Google Cloud Console and create or use an existing project.

## 2. Create a Topic

- Navigate to:
  
  > Cloud Pub/Sub > Create a Topic

## 3. Create a Subscription

- After creating the topic, create a subscription:
  
  > Cloud Pub/Sub > Topics > Subscriptions > Create Subscription

## 4. Add Proper Permissions to the Service Account

a. Assign **Subscriber** and **Publisher** permissions to the service account:
  
   - Subscriber: Consume messages from a subscription.
   - Publisher: Publish messages to a topic.
  
b. Click **Continue** to grant user access to this service account if necessary.

c. Create a **key** for the service account, which will be used by the client library to access the Pub/Sub API.

## 5. Start Publisher and Subscriber Applications

a. **Install the Google Cloud SDK** to start working with Pub/Sub services.

b. Watch the **3D video tutorial** for further instructions.

## 6. Test by Creating Sample Messages

- After setting
