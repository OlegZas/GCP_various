# Google Kubernetes Engine (GKE)
![image](https://github.com/user-attachments/assets/ad17b458-4919-47de-b3b5-916acdd68eb7)


- Most popular container orchestration tool
- Open source
- Allows you to create clusters and provides cluster management
- Managed service
- Auto-repair (repairs failed nodes) and auto-upgrade (always uses the latest version of K8S)
- Pod and cluster autoscaling (increases the number of instances for a specific microservice)

## Steps to Set Up GKE

### 1. Create a Kubernetes cluster with the default node pool after enabling the API.
![image](https://github.com/user-attachments/assets/295a6797-b26f-4508-bb0b-83858d85f5b2)

### 2. Connect to the cluster from Cloud Shell
```bash
gcloud config set project kubernetes-project-oz
gcloud container clusters get-credentials oz-autopilot-cluster --region us-central1 --project kubernetes-project-oz
```
![image](https://github.com/user-attachments/assets/2fb0ce8e-34c5-49dc-a1de-d786e15afecb)

### 3. Deploy a Microservice to Kubernetes:

#### a. Create deployment & service using kubectl commands

- To check the deployments:
  ```bash
  kubectl get deployment```
  
- You create a deployment to deploy a microservice using `kubectl`.

#### b. `kubectl` – CLI command that allows interaction with Kubernetes

- To create a deployment for a microservice:
  ```bash
  kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE```

- To access what is inside the deployment, run:
  ```bash
  kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080```

– you are creating a service to despose the deployment to the outside world, type of service created here is LoadBalancer 
-	kubectl get services – check the services that you have

  ![image](https://github.com/user-attachments/assets/f8f177e5-e7e1-4774-8971-e82a995481ad)
