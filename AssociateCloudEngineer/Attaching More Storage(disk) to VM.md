# Attaching Disk to VM

## 1. Go to VM Instance Edit and Click "Add New Disk"

Navigate to your VM instance in the Google Cloud Console, click **Edit**, and then click **Add new disk**.
![image](https://github.com/user-attachments/assets/25a8c390-ed4d-41e9-bd21-28954bd753a9)

---

## 2. Configure the Disk and Save

Set the disk parameters such as name, size, type (Standard, SSD, etc.), and whether it should be auto-deleted with the VM. Click **Save**.
![image](https://github.com/user-attachments/assets/8412f01b-bc41-4c47-bc6e-79a7da305652)

---

## 3. Create a Persistent Disk (Optional)

You can also create a persistent disk independently that is not initially attached to any VM.  
Go to **Disks** in the sidebar and click **Create Disk**.
![image](https://github.com/user-attachments/assets/cc85493b-037c-465b-bbde-79b67388dcb6)
![image](https://github.com/user-attachments/assets/f0f1a2e2-4c7b-4780-b3f0-fbcc3776d4ca)

---
## 4. Attach an Independent Disk to Your VM

Once created, go back to your VM instance, click **Edit**, and **Attach existing disk** to add the previously created disk.
![image](https://github.com/user-attachments/assets/cc2cb136-9d60-4772-a848-0f25e7af9d72)

---
