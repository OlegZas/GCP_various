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
  kubectl get deployment
  ```
  
- You create a deployment to deploy a microservice using `kubectl`.

#### b. `kubectl` – CLI command that allows interaction with Kubernetes

- To create a deployment for a microservice:
  ```bash
  kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE
  ```

- To access what is inside the deployment, run:
  ```bash
  kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080
  ```
– you are creating a service to dispose the deployment to the outside world, The type of service created here is LoadBalancer 

-	kubectl get services – check the services that you have

  ![image](https://github.com/user-attachments/assets/f8f177e5-e7e1-4774-8971-e82a995481ad)

### 4.	Increase the number of instances in your Microservice 
-	Adding 3 nodes to the cluster 
```bash 
kubectl scale deployment hello-world-rest-api --replicas=3
```
-	Check the number of instances now :
  ```bash 
Kubectl get pods 
```
![image](https://github.com/user-attachments/assets/eb488df1-2240-48f6-a7fe-93f68ed3a840)

### 5.	To create more nodes in the cluster or to decrease the number :
-	This is only available with manual GKE cluster set up, not in autoscaling:
![image](https://github.com/user-attachments/assets/7132fd7c-7b84-4c5b-b50f-97136e270757)
```bash 
gcloud container clusters resize oz-autopilot-cluster –node-pool NodepoolName –num-nodes=2 –zone=MASTERzoneNamehere
```
### 6.	Set up Autoscaling (if in manual) for your microservice: 
```bash 
kubectl autoscale deployment hello-world-rest-api --max=4 --cpu-percent=70
```
![image](https://github.com/user-attachments/assets/fb25d20c-7b07-4543-ae05-9f7c5313a270)
### 7.	Set up Autoscaling (if in manual) on GKE cluster:
```bash 
Gcloud container clusters update oz-autopilot-cluster –enable-autoscaling –min-nodes=1 –max-nodes=10
```
### 8.	Deleting a Microservice: 
```bash
kubectl delete service 
kubectl delete deployment 
```
### 9.	Delete the Cluster 
```bash
gcloud container clusters delete 
```

---

# Troubleshooting if the service is not running in browser on instance externalIP: 

---
### 1.	Check the Firewall Rules and add one for port 8080 and your externalIp if necessary 
```bash
gcloud compute firewall-rules create allow-8080 \
  --allow tcp:8080 \
  --target-tags k8s-service \
  --description "Allow traffic to port 8080"
```
### 2.	If you are using GKE cluster where the nodes are managed by GKE, and you need to apply changes to nodes (such as add tags for Firewall Rules): 
- a.	Get the Cluster and Node Pool Information: Run the following command to get details about your GKE cluster and node pool:
  ```bash 
gcloud container clusters describe oz-autopilot-cluster --zone us-central1
```
### 3.	Add Tags to GKE Node Pool (via CLI):
Since you can’t directly add tags to individual VM instances in a GKE cluster, you'll need to apply a tag to the entire node pool. You can do this when you create a node pool or by updating an existing node pool.
```bash 
gcloud container node-pools update <default-pool> \
  --cluster <oz-autopilot-cluster> \
  --zone < central1> \
  --tags k8s-service
```
- 	Get the external address of the server
```bash
kubectl get svc
```
-	Check the number of instances now :
  ```bash 
Kubectl get pods 
```
