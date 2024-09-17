# Pub/Sub Messages

- Multiple messages can be sent per service request (batching).
- Batching increases message rate but introduces latency for individual messages, which are queued in memory until their batch is filled.
- To minimize latency, turn off batching.
- Batching can be customized.

## Pub/Sub Subscriptions

- A topic can have multiple subscriptions, but each subscription belongs to one topic.

### Pull Delivery

- In pull delivery, the subscriber application initiates requests to the Cloud via the API and needs authorized credentials.
  - Any device on the internet with authorized credentials to call the API can serve as a pull endpoint.

