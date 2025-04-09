# Security

Google Cloud offers a range of security services to help protect your infrastructure, data, and applications. Below are some of the key services available:

## Key Services:

### 1. **KMS (Key Management Service)**
- A service that allows you to **create and manage cryptographic keys**.
- Provides control over how keys are used for **encryption** to ensure that only authorized entities can access sensitive data.
  
![image](https://github.com/user-attachments/assets/58f4e7dc-7d4c-4c44-9444-a72cc90c1a4e)

---

![image](https://github.com/user-attachments/assets/b8170ab0-242f-4574-a2de-c3239110904e)

### 2. **Secret Manager**
- Helps you **manage sensitive information** such as **database passwords**, **API keys**, and other secrets.
- Ensures that your secrets are securely stored and accessible to applications when needed.

### 3. **Cloud Data Loss Prevention (DLP)**
- Helps you **discover, classify, and mask sensitive data** across various Google Cloud services.
  - Can detect sensitive information like **credentials**, **passwords**, and personal data.
  - Integrates well with services such as **Cloud Storage**, **BigQuery**, and **Datastore** to identify and mask sensitive data stored within them.

### 4. **Cloud Armor**
- Protects your **production applications** from **DDoS attacks** and common **web attacks**.
- Offers robust security to ensure that only legitimate traffic reaches your application.

### 5. **Web Security Scanner**
- Helps identify security vulnerabilities by running automated **security tests** on your web applications.
- Detects potential threats such as cross-site scripting (XSS), mixed content issues, and outdated libraries.

### 6. **Binary Authorization**
- Ensures that only **trusted container images** are deployed to services like **Kubernetes** or **Cloud Run**.
- Verifies the integrity and security of container images before deployment to prevent the execution of unapproved or compromised code.

### 7. **Container Threat Detection**
- Detects and alerts you to potential **container runtime attacks**.
- Monitors the behavior of containers in your environment to identify anomalies and potential security breaches.

### 8. **Security Command Center**
- Provides a **consolidated view** of your cloud security posture.
- Includes a **dashboard** and **analytics system** to give you insights into your security status, risks, and compliance across your Google Cloud environment.
