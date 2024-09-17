# Pub/Sub Messages

- Multiple messages can be sent per service request (batching).
- Batching increases message rate but introduces latency for individual messages, which are queued in memory until their batch is filled.
- To minimize latency, turn off batching.
- Batching can be customized.

## Pub/Sub Subscriptions

- A topic can have multiple subscriptions, but each subscription belongs to one topic.

# Pull Delivery

- In pull delivery, the subscriber application initiates requests to the Cloud via the API and needs authorized credentials.
  - Any device on the internet with authorized credentials to call the API can serve as a pull endpoint.

# Push Delivery

- In push delivery, Pub/Sub initiates requests to the subscriber endpoint, which must be reachable with a DNS name and have an SSL certificate installed (not self-signed).

# Load Balancing

- **Pull Mechanism**: Multiple subscribers can make calls to the same subscription.
- **Push Mechanism**: The push endpoint itself can be a load balancer, distributing the request to the appropriate backend.
- Multiple subscriptions can point to the same endpoint.

# Pull vs Push: When to Use Each

## Pull

- Use the pull mechanism if the volume of messages is large (many more than 1 per second).
- Ideal when efficiency and throughput of message processing are critical.
- Prefer pull if setting up a public HTTPS endpoint with a non-self-signed SSL certificate is not feasible.

## Push

- Recommended for use with multiple topics that must be processed by the same webhook.
- Suitable for App Engine Standard and Cloud Functions, where Google Cloud tools handle message delivery automatically.
- Choose push if setting up Google Cloud dependencies (like credentials or libraries) isn’t practical for your system.

# Pub/Sub API for Pull Mode

1. Pull API
2. Streaming Pull API (default)
