# 📘 Google Cloud Platform: Instance Templates & Instance Groups

Google Cloud provides tools to deploy and manage virtual machines (VMs) at scale. Two core components in this system are **Instance Templates** and **Instance Groups**.

---

## 📦 Instance Template

An **Instance Template** is a **blueprint** that defines the configuration of a VM. This includes:

- Machine type (e.g., `e2-medium`)
- Boot disk image and size
- Network and subnet settings
- Labels and metadata
- Startup scripts
- Service accounts and scopes
- Custom or container images

### ✅ Key Features:
- **Immutable**: Cannot be edited after creation.
- **Reusable**: Use it to spin up VMs or populate instance groups.
- **Efficient**: Avoids repeating configuration manually.

![image](https://github.com/user-attachments/assets/92b34ede-deeb-4fa2-9a72-12916b50843c)

---

## 🧱 Instance Group

An **Instance Group** is a **collection of VMs** treated as a unit. It comes in two types:

### 1. 🧠 Managed Instance Group (MIG)
Managed Instance Groups (MIGs) allow you to deploy and manage **identical** VMs based on an Instance Template.

#### Features:
- ✔️ Uses an instance template
- ✔️ Autoscaling support
- ✔️ Load balancing integration
- ✔️ Auto-healing (restarts failed instances)
- ✔️ Rolling updates
- ❌ VMs must be identical

#### ✅ Ideal for:
Stateless applications like web servers, containers, and microservices.

![image](https://github.com/user-attachments/assets/b8f6cab4-91ca-434d-bc53-5cee0d3c94c1)

---

### 2. 🧰 Unmanaged Instance Group
Unmanaged Instance Groups are simply **a group of VMs** that may have different configurations.

#### Features:
- ❌ No autoscaling
- ❌ No auto-healing
- ❌ No load balancing integration
- ✔️ Flexible VM configurations
- ✔️ Manual control

#### 🚧 Best for:
Legacy systems or special workloads needing manual setup.

---

## 🔁 Typical Workflow

```bash
# Step 1: Create an instance template
gcloud compute instance-templates create web-template \
    --machine-type=e2-medium \
    --image-family=debian-11 --image-project=debian-cloud

# Step 2: Create a managed instance group using the template
gcloud compute instance-groups managed create web-mig \
    --base-instance-name=web \
    --template=web-template \
    --size=3 \
    --zone=us-central1-a

# Step 3: Set up autoscaling and load balancing (optional)

#4 Step 4: Instance crashes? MIG replaces it automatically.
```

---

![image](https://github.com/user-attachments/assets/5206f908-430a-4a51-be59-e2100185e45c)
