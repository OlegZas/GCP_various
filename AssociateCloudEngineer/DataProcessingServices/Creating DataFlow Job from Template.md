# Creating DataFlow Job from Template

**Goal:** create data flow job from template for inserting data from the bucket to a BigQuery table

---

### 1. Navigate to Dataflow and click **Create Job From Template** and enable the **Dataflow API**.

<img width="767" height="301" alt="image" src="https://github.com/user-attachments/assets/8be6e333-3d7e-4e24-9569-d3018b0e5ee8" />

---

### 2. Set up the bucket and upload your files into it.

---

### 3. Define the schema of your BigQuery table based on the format requested:  
a. In this case, JSON format  
b. Upload it to the bucket as well
<img width="975" height="651" alt="image" src="https://github.com/user-attachments/assets/8f5f2ce8-8f2f-4dde-9c2a-597ad49b0683" />

> {"BigQuery Schema": [  
> { "name": "EmployeeID", "type": "INTEGER" },  
> { "name": "FirstName", "type": "STRING" },  
> { "name": "LastName", "type": "STRING" },  
> { "name": "Department", "type": "STRING" },  
> { "name": "Position", "type": "STRING" },  
> { "name": "Salary", "type": "INTEGER" },  
> { "name": "JoiningDate", "type": "DATE" },  
> { "name": "Country", "type": "STRING" }  
> ]}
<img width="975" height="379" alt="image" src="https://github.com/user-attachments/assets/cf36a9b7-9d10-44ea-8bf1-a1f187b33abf" />

---

### 4. After defining the schema above, go to BigQuery and create an empty table.
   <img width="611" height="560" alt="image" src="https://github.com/user-attachments/assets/ae581b25-63e8-478e-8e19-e82aa07968ed" />

a. Once created, select it as your output table.
<img width="975" height="450" alt="image" src="https://github.com/user-attachments/assets/73fc0161-2333-4acf-b8bb-dc1adb415c39" />

---

### 5. You can choose a bucket for the temp directory and for temporary location.  
a. For temporary location, add `/temp` to the bucket name.
<img width="589" height="307" alt="image" src="https://github.com/user-attachments/assets/cdea70ed-e602-4841-8777-55eca6dcd4ef" />

---

### 6. Optional Parameter is required to map your input file fields to BigQuery table columns:  
a. You can use JavaScript to map it  
b. Must be uploaded to the bucket

**Example JavaScript UDF Cloud Storage URI:**  
> gs://my-bucket/my-udfs/my_file.js

**JavaScript transform function:**

> function transform(line) {  
>     var values = line.split(","); // Split the input line by commas (CSV format)  
>     
>     // Check if it's the header row (first line) and skip it  
>     if (values[0] === "EmployeeID") {  
>         return null; // Skip processing the header row  
>     }  
>     
>     // Create an object mapping the values to the BigQuery schema  
>     var obj = new Object();  
>     obj.EmployeeID = parseInt(values[0]); // Convert to integer  
>     obj.FirstName = values[1];  
>     obj.LastName = values[2];  
>     obj.Department = values[3];  
>     obj.Position = values[4];  
>     obj.Salary = parseInt(values[5]); // Convert to integer  
>     obj.JoiningDate = values[6]; // Date as a string (ISO format YYYY-MM-DD)  
>     obj.Country = values[7];  
>     
>     // Convert the object to a JSON string  
>     var jsonString = JSON.stringify(obj);  
>     return jsonString;  
> }

---

### 7. When the Dataflow job is created, it will create a worker node at the backend. The worker node is a VM.
<img width="856" height="329" alt="image" src="https://github.com/user-attachments/assets/d2883b60-d0b3-4713-9510-0375243a5919" />
<img width="975" height="364" alt="image" src="https://github.com/user-attachments/assets/47c9b612-c1da-4911-86c5-7e74037c43da" />

---

### 8. To troubleshoot, check the logs, and once the error is fixed, clone the job (alter the name).
<img width="975" height="681" alt="image" src="https://github.com/user-attachments/assets/dc7f2350-9f81-42b4-841c-5a1a70389eaa" />
