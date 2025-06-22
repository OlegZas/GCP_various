# 🚀 Deploying Python Flask Application on Flexible App Engine Environment

## 1. Initial Setup

After creating your App Engine instance  
(*See GitHub guide: "Deploy Python Application on Google App Engine"*)  
Create the following files in your IDE:

- `app.yaml`
- `main.py`
- `requirements.txt`

![image](https://github.com/user-attachments/assets/fc2b52b6-0976-46bf-bc51-c26e04000388)
![image](https://github.com/user-attachments/assets/26a66d06-6e75-49f6-97c0-58efec2e2a73)
![image](https://github.com/user-attachments/assets/8c14ba0d-12da-4865-acee-83029a14ff83)

---

## 2. Fixing “Running scripts is disabled on this system” Error

You might encounter this error:

    sdk\bin\gcloud.ps1 cannot be loaded because running scripts is disabled on this system.
    For more information, see about_Execution_Policies

### ✅ Solution

Open **Visual Studio Code** (or another IDE) as **Administrator** and run the following command:

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

> This changes the policy permanently and allows scripts to run in PowerShell in VS Code.

---

## 3. Deploy the Application

To deploy your application, run:

    gcloud app deploy -v=v01 --project=theta-topic-457803-u2

This command deploys the app on the **Flexible App Engine** and creates a **Docker container**.

---

## 4. Check Your Service

After deployment, go to:

    Google Cloud Console → App Engine → Services

to verify your service is running.

![image](https://github.com/user-attachments/assets/a7c060d4-dc63-4637-855b-9a25afec9460)
![image](https://github.com/user-attachments/assets/5d2c00c5-21ae-4570-bb86-6ca9b2a726f3)

---
