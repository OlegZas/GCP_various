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
