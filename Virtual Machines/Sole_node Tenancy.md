# Sole-Node tenancy 
The VM’s created on Compute engine are created on the host computer owned by GC. The default tenancy is a shared tenancy, so each host computer can host VM’s that belong to other customer. 
-	When you don’t want the above, you would go for sole-tenant Nodes. Sole-tenant Nodes - they are virtualized instances on hardware that is dedicated to one customer 
### Use cases: 
1.	You want your Vm’s to e physically separated from those in other projects 
2.	To group your VM’s together – which will improve their performance 

---

> 1.	Create a sole-node group in Compute and assign affinity labels which will be used to link VM to it.

![image](https://github.com/user-attachments/assets/352851b4-c37f-48d2-ae8a-16c6d1522ec7)

![image](https://github.com/user-attachments/assets/f9b0e887-b263-4aa0-9b0a-aa45afbb6fe6)

---

> 2.	Then create a VM the usual way and go to advanced and choose the Sole-tenancy group that you’ve created.

![image](https://github.com/user-attachments/assets/de70133f-8c29-4945-9079-ea07229f6e08)
