# Installing a Browser on Your VM and Accessing Websites

Follow these steps to install Google Chrome on your VM and use it to access websites.

---

## 1. SSH Into Your VM

Use the following command:

    gcloud compute ssh <YOUR_VM_NAME> --zone=<YOUR_VM_ZONE>

Or open the SSH-in-browser option from the Google Cloud Console.

---

## 2. Update Your System

    sudo apt update && sudo apt upgrade -y

---

## 3. Install Required Packages

    sudo apt install -y wget gnupg2

---

## 4. Download and Install Google Chrome

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
