# Cloud PUB/SUB Overview

**Cloud PUB/SUB** follows a **Publisher > Subscriber** model.

---

## **Publisher App**

- Creates and sends messages to a **topic** (which is a named resource).
- Messages are stored until acknowledged by all subscribers.
- Can be any app that can make HTTPS requests to `GoogleApis.com`.

---

## **Subscriber App**

- Creates a subscription to a **topic** to receive stored messages.
- To receive the messages, the subscriber must create a subscription to the publisher's topic.
- The subscriber app receives messages by either:
  - **PUB/SUB pushing** them to the subscriber's chosen endpoint, or
  - **Subscriber pulling** them.
  
When the message is acknowledged by the subscriber, it is removed from the backlog and not delivered again.

---

## **Publisher – Subscriber Communication Types**

![image](https://github.com/user-attachments/assets/3625344c-01fb-400f-857d-c62c91332862)

![image](https://github.com/user-attachments/assets/34510a38-e037-4ea4-a0f5-cac17905999f)

![image](https://github.com/user-attachments/assets/ddd81eb9-6544-482a-a476-39c7ad42f947)
