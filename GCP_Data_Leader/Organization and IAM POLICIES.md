# Organization Policy

- Enables you to create centralized constraints on all resources created in an organization.
  - Example: Disable creation of service accounts.
  - Allow/Deny creation of resources in specific regions.
  
- **IAM** focuses on **WHO** (people, users).
- **Organization Policy** focuses on **WHAT** – overrides IAM.
![image](https://github.com/user-attachments/assets/740667b2-56f9-49a9-8d02-8556fcaea786)

---

# IAM Policy

- IAM policy is set at the project, folder, or organization level.
- Resources inherit policies at all levels.
- Policies are inherited from levels above: 
  - Organization > Folder > Project > Resource
