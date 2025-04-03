# Asynchronous Communication and PUB/SUB
![image](https://github.com/user-attachments/assets/e7aca5de-895c-4341-aded-8b212505255c)

When apps on your server make synchronous calls to your logging service, if the logging service goes down, the app will go down too. Also, when there is a sudden high load with a lot of logs, the logging service can go down often. This is where you use a decoupled service like **Pub/Sub**.

## Key Concepts:

- You decouple by making your application put messages on the topic instead of directly on your service. 
- Your service (in this example, the **Logging Service**) picks up messages from the topic and processes them when it’s ready.
- The app that is publishing messages is the **Publisher** – it keeps sending messages to the topic, irrespective of the **Subscriber**.
- Even if the **Subscriber** (the logging service) is down, the **Publisher** will keep on sending messages.

## Pub/Sub – Fully Managed Messaging Service
A fully-managed messaging service that can process billions of messages daily.
![image](https://github.com/user-attachments/assets/98e91fe2-c54c-441f-938e-52a4b8d96c83)

- **Low Cost**: You pay for the number of messages coming in.
- **Supports both Push and Pull Messages**:
  - **Pull**: The subscriber pulls messages whenever the message is ready.
    - The subscriber makes HTTP requests to `pubsub.googleapis.com` (topic).
    - The subscriber asks if there are messages and the topic responds "yes" or "no."
  - **Push**: As soon as the message is published to the topic, the message is atomically sent out to all the subscribers.
    - Subscribers provide a webhook endpoint at the time of registration (it's invoked when there is a message on the topic).
    - Once there is a message on the topic, an HTTPS POST request is sent to the webhook endpoints.

## Walkthrough:

1. **Create a Topic**:
   - Instructions on how to create a topic in your Pub/Sub system.
![image](https://github.com/user-attachments/assets/f55200d4-7346-4238-b13c-4eb04ad4f80f)

2. **Creating a Subscriber**:
   - Guide on how to create a subscriber that listens to the topic.
![image](https://github.com/user-attachments/assets/c6f41b5a-6af2-4ef6-a9d0-7fc228986605)

3. **Manually Publish a Message**:
   - Steps on how to manually publish a message to a topic.
![image](https://github.com/user-attachments/assets/e1cc19a6-ca47-4e76-945f-9c50e7d7903d)

4. **Pull Messages in Subscriber**:
   - If you turn on **Enable Acknowledgment** and click **ACK**, the next time you pull the message, it won’t be there.
   - This ensures that the messages are not processed more than once.
![image](https://github.com/user-attachments/assets/7c2ae360-5edc-4353-91fa-da26a0f07af4)

5. **Create a Snapshot**:
   - A snapshot is a point-in-time status of a specific subscription, allowing you to save the current state of a subscription for later replay.
![image](https://github.com/user-attachments/assets/60317272-41ef-4c1a-b160-050d0536024d)
