## Creating BigLake table from GCS 

---

### 1.	Create a Cloud Storage bucket and import data: 
 <img width="975" height="300" alt="image" src="https://github.com/user-attachments/assets/177fd073-fc87-49a5-b86a-937962d02963" />

### 2.	Create a table in your dataset using Cloud Storage as a source and Table type set to External table. Create a new cloud resource connection. 
 
<img width="975" height="794" alt="image" src="https://github.com/user-attachments/assets/c5ea0dec-16c5-4967-aa71-c74ca9bab8d1" />

### 3.	 When creating that table, a permissions erorr might appear: 
 <img width="864" height="1034" alt="image" src="https://github.com/user-attachments/assets/0893a0db-7b60-420b-922e-3324539b4fde" />

### 4.	Check the service account use in the BigLake connection: 
 
<img width="975" height="584" alt="image" src="https://github.com/user-attachments/assets/be3c5d94-4ef3-443d-a11e-a9ce4c5d7f02" />

### 5.	Copy the Service account id, navigate to the Cloud Storage bucket and add permissions. Add service account as a principal and add any Storage Object roles. Then you will be able to create the table. 
 <img width="975" height="605" alt="image" src="https://github.com/user-attachments/assets/f9dd2778-371b-4a4a-a957-18af0892eded" />

### 6.	The difference between external table and BigLake is that when you share the external table access with the users, the user will need access to the buckets and specified roles, but with Big Lake the user will not need it. With BigLake the user will be able to query the table without any issues. 
