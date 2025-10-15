# BQ: Row-Level Security

## 1. Restrict the Ability to View Records by Department

### Option 1: Create a New Dataset and a View in It

#### a. Creating a Dataset
- First, create a new dataset in BigQuery.

#### b. Creating a View
- Create a view in the new dataset to filter records by department.

#### c. Restrict Access to the Department at the Dataset Level
- To restrict access to the department at the dataset level:
  1. Navigate to the dataset.
  2. Click on **Share**.
  3. Under **Permissions**, click on **Add Principal**.
  4. Add the **Marketing Department** (or whichever department you want to grant access to) to the permissions list.

---

### Option 2: Create Row Access Policy

1. **Create a Row Access Policy**  
   To create a row-level security policy, write a query that specifies which records are accessible based on department.  
   You can restrict access for individual users or groups. For example, to grant access to a specific group, use the following syntax:
   ```sql
   GRANT TO ("group:oleggroup@gmail.com")```

2. **To view the row-access policies click on the table schema and select “view Row access policies” :**
