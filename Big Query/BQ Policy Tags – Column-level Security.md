# BQ Policy Tags – Column-level Security
<img width="975" height="523" alt="image" src="https://github.com/user-attachments/assets/a62c1c50-94d4-462c-83d8-eda42a05caf5" />

## 1. Enable Google Cloud Catalog API
Ensure the **Google Cloud Catalog API** is enabled in your project. This is necessary for working with BigQuery policy tags.

## 2. Create Policy Tags in BigQuery
Within **BigQuery**, click on **Policy tags** in the navigation panel.
<img width="789" height="460" alt="image" src="https://github.com/user-attachments/assets/7b1d840d-6a25-45a6-b43f-1e064e5f2a20" />

## 3. Create a Taxonomy
Create a **taxonomy** with the appropriate tags for column-level security. These tags will define the sensitivity levels for your data.
<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/a9cc9c8b-f3ee-4e6b-8535-33a2e3d58469" />

## 4. Edit Table Schema
In your table, go to the **Schema** section. Click on the column you want to apply the policy tag to and choose **Add policy tag**.
<img width="975" height="630" alt="image" src="https://github.com/user-attachments/assets/d692ec46-a8e9-4fd3-8e4b-544acca5763e" />

## 5. Select Taxonomy and Sensitivity Level
Select the taxonomy you created earlier and assign the relevant **sensitivity level** to the column.
<img width="769" height="385" alt="image" src="https://github.com/user-attachments/assets/4fdd630f-330a-40a1-8f18-81b0735ba3e4" />

## 6. Test Permissions
When trying to query the table without the specific permissions, you will receive an **access denied** message for the table.

## 7. Mask Column Values (Optional)
To mask a portion of the column value (e.g., a password), go into the **policies** section and assign the appropriate rules to the different sensitivity levels.
<img width="975" height="444" alt="image" src="https://github.com/user-attachments/assets/f40b1ecc-6881-4e96-b852-cb16c05c8452" />

## 8. Assign "Masked Reader" Role
In **IAM**, add the **"Masked Reader"** role to the user. This will allow the user to see masked (hashed) column values.
