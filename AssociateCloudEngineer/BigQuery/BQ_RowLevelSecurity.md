# BQ: Row-Level Security

## 1. Restrict the Ability to View Records by Department
<img width="975" height="650" alt="image" src="https://github.com/user-attachments/assets/e0f5a850-c43c-4c6d-a26d-df6343b5d1ed" />

### Option 1: Create a New Dataset and a View in It

#### a. Creating a Dataset
- First, create a new dataset in BigQuery.
<img width="975" height="486" alt="image" src="https://github.com/user-attachments/assets/c4ce4531-2b16-4ba4-82aa-7885b3bb4b81" />

#### b. Creating a View
- Create a view in the new dataset to filter records by department.
<img width="975" height="380" alt="image" src="https://github.com/user-attachments/assets/82d7d85d-e81f-4968-8e1c-a903bce7da4f" />

#### c. Restrict Access to the Department at the Dataset Level
- To restrict access to the department at the dataset level:
  1. Navigate to the dataset.
  2. Click on **Share**.
  3. Under **Permissions**, click on **Add Principal**.
  4. Add the **Marketing Department** (or whichever department you want to grant access to) to the permissions list.
<img width="975" height="526" alt="image" src="https://github.com/user-attachments/assets/9471822a-34ff-4712-a082-2cdde9e50915" />

---

### Option 2: Create Row Access Policy

1. **Create a Row Access Policy**  
   To create a row-level security policy, write a query that specifies which records are accessible based on department.  
   You can restrict access for individual users or groups. For example, to grant access to a specific group, use the following syntax:
   ```sql
   GRANT TO ("group:oleggroup@gmail.com")```
<img width="975" height="381" alt="image" src="https://github.com/user-attachments/assets/bee58113-2600-4dfd-9c6d-06d24bc7f6b9" />

2. **To view the row-access policies click on the table schema and select “view Row access policies” :**
<img width="975" height="279" alt="image" src="https://github.com/user-attachments/assets/8e02fa22-d881-4daf-8a3b-8b3874e6f7aa" />
