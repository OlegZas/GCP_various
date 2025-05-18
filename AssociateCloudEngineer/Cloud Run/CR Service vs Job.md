# ☁️ Two Ways to Execute Code on Cloud Run

## 1. Cloud Run **Service**
- Used to run code that **responds to web requests, events, or functions**.
- Automatically creates an **HTTP endpoint**.
- To access your service, you simply **make a request to the endpoint** (e.g., from a browser or API client).

**Example**:  
Build a web app, REST API, or event-driven function that reacts to Pub/Sub messages or file uploads.

---

## 2. Cloud Run **Job**
- Used to run code that **performs a task and then exits**.
- **Does not expose an HTTP endpoint**.
- Ideal for background work or automation where no web access is needed.

**Example**:  
Fetch data from a database, generate reports, or run scheduled scripts.

# 🛠️ Cloud Run: Services vs. Jobs

On **Cloud Run**, your code can run in two modes: as a **service** or as a **job**.  
Both run in the same environment and support the same integrations with other Google Cloud services.

---

## 🚀 Cloud Run Services
Use this for running code that **responds to web requests, events, or functions**.

### ✅ Use Cases:
- **Websites and Web Applications**:  
  Build dynamic web apps with your preferred stack, connect to SQL databases, and render HTML pages.

- **APIs and Microservices**:  
  Create REST or GraphQL APIs, or internal microservices using HTTP or gRPC.

- **Streaming Data Processing**:  
  Process real-time data using Pub/Sub push subscriptions and Eventarc.

- **AI Inference**:  
  Host machine learning inference models or run model training, optionally with GPU support.

---

## ⚙️ Cloud Run Jobs
Use this for running code that **performs a task and then exits**.

### ✅ Use Cases:
- **Script or Tool**:  
  Run scripts to perform database migrations or one-time operational tasks.

- **Array Job**:  
  Run tasks in parallel, like processing all files in a Cloud Storage bucket.

- **Scheduled Job**:  
  Automatically generate invoices, or export database query results at scheduled intervals.
