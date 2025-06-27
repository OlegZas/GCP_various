# Deploying an App on GKE

## Demo 1 Objectives:
1. Enable GKE API  
2. Create Autopilot Cluster  
3. Deploy Public Image on GKE Cluster  
4. Expose Deployment with Load Balancer  
5. Access the Application  

---

## Steps

1. Go to the **Kubernetes Engine** and activate the API.

2. Create an **Autopilot Cluster**.

3. Connect to your cluster using CLI.

4. Use CLI commands `kubectl` (not specific to GKE) to check the cluster.  
`kubectl` is the command-line tool used to interact with Kubernetes clusters.  
Example commands:

	 kubectl get pods  
	 kubectl apply -f deployment.yaml  
	 kubectl logs my-pod  
	 kubectl delete service my-service  

a. View your kubeconfig credentials:  
	
	 cat ~/.kube/config  
	
	This file contains credentials of the cluster.  

b. Check if nodes are created:  

	 kubectl get nodes  

> **NODE** — a node is a worker machine (virtual or physical) that runs your application workloads.

5. Deploy public image provided by Google on your GKE cluster:  
Public image: A Docker container image available publicly (e.g., on Google Container Registry (GCR) or [Artifact Registry]).  
Example image: `gcr.io/google-samples/hello-app:1.0`

- **Image** – a compressed app that contains all the code, dependencies, packages, libraries, runtime (e.g., Python runtime, JRE, Node runtime), and is ready to run anywhere.

🔁 **What happens during "deploy an image"?**  
Kubernetes pulls the image from a registry → starts a container based on it → runs it inside a pod on your cluster.

6. In your cluster, click **Deploy**.  
Paste the image URL provided by Google in **Container Details** > **New Container** and deploy the application.

Once deployed, check the number of nodes:  
*(In Autopilot you will not have access to the nodes — you won’t see the minimum Compute Engine nodes.)*

Check the number of pods:  

- A **pod** is a group of one or more containers that share storage, network, and a specification for how to run the containers.  
- Usually, a pod contains a single container (like your app), but it can have multiple containers that work closely together.  
- Pods run on nodes in your Kubernetes cluster.

7. To access the application in a browser, you need an external IP:  

a. To let others access your deployment, expose it to create a service.  

b. Click on **Expose**.

8. Access the service on the endpoint shown.

---
