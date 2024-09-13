# Order Processing Flow (Without PUB/SUB)

## Process Overview

1. **Order Service**  
   The order service receives the order and sends a message to the packaging service.

2. **Packaging Service**  
   The packaging service processes the packaging of the item and sends a message to the shipping service.

3. **Shipping Service**  
   The shipping service processes the shipment and sends a message to the notification service.

4. **Notification Service**  
   The notification service notifies the customer that the order has been processed.

5. **Order & Packaging Services Notifications**  
   Both the order and packaging services also send messages to the notification service to provide the customer with updates on their order status.

### Potential Issues with this Approach

- **Tight Coupling**  
  If a new service is introduced, it will need to interact with all existing services, which requires making changes in all of them.

- **Complex Testing**  
  Each individual service will need to be tested, making the testing process more difficult and time-consuming.

---

By implementing a PUB/SUB system, these complications could be significantly reduced by decoupling the services and simplifying communication.

# Order Processing Flow (With Cloud Pub/Sub)

## What is Cloud Pub/Sub?

**Cloud Pub/Sub** is a fully managed, real-time messaging service that allows you to send and receive messages between independent applications. It decouples various services and allows them to send messages to subscribers **asynchronously**.

### Key Concept: Messages

Messages are real-world events such as:
- **Order received**
- **Item sold**
- **Package shipped**

## How the Process Works with Cloud Pub/Sub

1. **Order Service**  
   The order service sends messages to **Pub/Sub** instead of directly to the packaging service.

2. **Message Storage**  
   The messages are stored in Pub/Sub.

3. **Message Delivery**  
   The packaging service and the notification service receive these messages from Pub/Sub, either by **push** or **pull**.

4. **Packaging Service**  
   The packaging service sends messages to Pub/Sub instead of directly to the shipping service.

5. **Message Consumption**  
   The shipping service and notification service receive the packaging event messages from Pub/Sub.

6. **Decoupled Services**  
   The packaging service does not need to know which services are receiving its messages.

7. **Shipping Service**  
   The shipping service sends messages to Pub/Sub.

8. **Order & Notification Services**  
   The order service and notification service receive shipping event messages from Pub/Sub.

---

### Benefits of Using Cloud Pub/Sub

With Cloud Pub/Sub:
- Services only need to **send/receive messages** to/from Pub/Sub without worrying about **who** receives them or **how** they are delivered.
- This architecture is **easily scalable** and allows for the **seamless introduction** of new services.
