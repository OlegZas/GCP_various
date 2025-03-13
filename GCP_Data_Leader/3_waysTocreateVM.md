### VM HTTP server setup  
## Bootstrapping 
– installing OS patches or software when an VM instance is launched 
## Option1: Startup script 
![image](https://github.com/user-attachments/assets/c7b1602a-4d7a-4207-9a98-8940c30f3ec1)

![image](https://github.com/user-attachments/assets/ed640bb5-7a65-457f-a023-503aa2f6221d)

## Option2: Instance template 
-	When creating it, you can define machine type, image, labels, startup script and other properties 
-	Cannot be changed once created (can crate a copy and change that) 
 ![image](https://github.com/user-attachments/assets/7d9dd880-f90b-48c0-97ff-7662eefc8be5)

## Option3: Custom image 
-	Installing OS patches and software at launch increases boot up time 
-	You can create a custom image with software pre-installed 
o	You create a VM instance > custom image from it > other instances from custom image 
-	Can be created from instance, a persistent disk, a snapshot, another image, or file in Cloud Storage 
-	Faster at bootup than using a startup script 
-	<b>Disks</b> are storage of VM and are attached to the Vm
  
![image](https://github.com/user-attachments/assets/3ccb4da8-32f5-4633-a9ff-ad43b115d0a8)

![image](https://github.com/user-attachments/assets/1f2e87bc-52f8-44a3-8fc4-4f1333205a6b)

---

![image](https://github.com/user-attachments/assets/5275015f-482d-4d30-a050-74a2b4cbec4e)
- ###	In the startup script, you just create html file to put specific information and then start up the apache2 server (you don’t need to install it, as it’s preinstalled with the image)

![image](https://github.com/user-attachments/assets/ee011147-f1ec-4166-a263-bd21108084e9)
