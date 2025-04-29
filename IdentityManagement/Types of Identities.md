# Cloud Identity Overview
![image](https://github.com/user-attachments/assets/3872dfa3-83c7-4045-a967-c9e1db84c1c9)

## Service Account
Used for applications so they can interact with each other and access each other’s resources.

- No username, no password.
- Authentication is handled via key-based access.
![image](https://github.com/user-attachments/assets/31038983-f8e6-41cf-b8c4-6b8540b864b1)

---

## Google Workspace (Formerly G Suite)

**Google Workspace** is a suite of cloud-based productivity and collaboration tools provided by Google, including Gmail, Google Drive, Google Calendar, Google Docs, and more.

When you set up a **Google Workspace domain**, you're essentially connecting your organization’s custom domain (e.g., `yourcompany.com`) to Google Workspace. This allows you to:

- Create custom email addresses (e.g., `name@yourcompany.com`)
- Manage user accounts, permissions, and security settings
- Use Google’s collaboration tools under your own domain for better branding and control

---

## Cloud Identity Domain

A **Cloud Identity domain** is a lightweight, cloud-based identity and access management (IAM) solution by Google. It provides:

- Centralized user and group management
- Integration with Google services and third-party apps via Single Sign-On (SSO)
- Device and security policy enforcement
- Basic directory services without the full productivity suite included in Google Workspace

Cloud Identity is ideal for organizations that want secure identity management but don't require Gmail, Docs, or other collaboration tools.
![image](https://github.com/user-attachments/assets/44b0b8b1-7f9f-4578-a1cb-352fe0068ebc)

---

## Google Groups for IAM

**Google Groups** is a tool offered by Google where you can group members (e.g., Gmail users) and grant them permissions to Google Cloud resources.

### Steps to Use Google Groups with IAM:

1. Create a Google Group by visiting [Google Groups](https://groups.google.com/).
  ![image](https://github.com/user-attachments/assets/ea4e083e-06be-4539-9504-e9f7b1ee3b23)

2.  Add users to the group who will share access to cloud resources.
   ![image](https://github.com/user-attachments/assets/fe38d364-5482-4ff9-a3db-636aad4c7dcc)

3. Copy the group’s email address.In the Google Cloud Console, go to IAM and add the group email as a **principal**.
![image](https://github.com/user-attachments/assets/8a63e70a-ccf2-404a-8cc0-c30e83d2133f)

   
4. Assign the required **roles and permissions** — these will be shared by all members of the group.
![image](https://github.com/user-attachments/assets/b105c507-23d7-4f4c-9508-2527d6dbaeeb)

---

