# Types of Clouds and Networks

## Types of Cloud

### 1. **Public Cloud**
   - **No company data centers**, everything is hosted on the cloud.
   - **Advantages**:
     - **No capital expenditure**: Pay-as-you-go model for resources.
     - **Hardware owned by GCP** (Google Cloud Platform).
   - **Disadvantages**:
     - Limited **control** over infrastructure.

### 2. **Private Cloud**
   - All infrastructure is located **within your own data center**.
   - **Advantages**:
     - **Complete control** over security and privacy.
   - **Disadvantages**:
     - Requires **substantial capital expenditure**.
     - Needs **ahead-of-time planning** for workloads that will run in the future (e.g., 6 months).
     - **Difficult to handle unpredictable spikes** in demand.
     - Resources can often **sit idle** when purchased in advance for future spikes.
     - Hardware **refresh and updates** take time and need to be purchased.
   
### 3. **Hybrid Cloud**
   - **Combination** of public and private clouds.
   - **Example**: An on-premise app communicating with a Cloud Spanner instance.
   - **Advantages**:
     - Provides **flexibility** by combining the best of both worlds.

---

## Hybrid Cloud: Connecting Private to Cloud

### How to Connect On-Premise Network to Cloud Network?

#### Option 1: **Cloud VPN**
   - Use **Cloud VPN** to connect your on-premise network to a cloud network.
   - **Recommended for low bandwidth needs**.
   - Implemented using **IPSEC VPN TUNNEL**.
   - **Traffic flows through the internet (public)** but is **encrypted** using the Internet Key Exchange protocol.
   
   **Two Types of Cloud VPN**:
   - **HA VPN**:  
     - High availability VPN with two external IP addresses.
     - **99.99% service availability SLA**.
     - Supports **dynamic routing only** (not static).
   - **Classic VPN**:
     - **99.9% service availability SLA**.
     - Uses a **single external IP address**.
     - Supports both **static and dynamic routing**.

#### Option 2: **Cloud Interconnect**
   - A **high-speed physical connection** between your on-premise network and VPC (Virtual Private Cloud) networks.
   - **Very high speed and highly available**.
   - **Data exchange happens through a private network**, unlike Cloud VPN, where data flows over the public network.
   - To communicate from on-premise to VPC resources, use the VPC network's **internal IP addresses**.
   - **Allows access to Google APIs and services** from your private network.
   - **Recommended for high bandwidth needs**.

#### Option 3: **Direct Peering**
   - Used to connect a customer's **network directly** to Google's network via **network peering**.
   - It’s a **direct path** from your on-premise network to Google services.
   - **NOT a GCP service**.
   - **Lower-level network connection** outside of GCP, so it’s generally **not recommended**.

---
