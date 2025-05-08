# Attaching Disk to VM

## 1. Go to VM Instance Edit and Click "Add New Disk"

Navigate to your VM instance in the Google Cloud Console, click **Edit**, and then click **Add new disk**.

## 2. Configure the Disk and Save

Set the disk parameters such as name, size, type (Standard, SSD, etc.), and whether it should be auto-deleted with the VM. Click **Save**.

## 3. Create a Persistent Disk (Optional)

You can also create a persistent disk independently that is not initially attached to any VM.  
Go to **Disks** in the sidebar and click **Create Disk**.

## 4. Attach an Independent Disk to Your VM

Once created, go back to your VM instance, click **Edit**, and **Attach existing disk** to add the previously created disk.
