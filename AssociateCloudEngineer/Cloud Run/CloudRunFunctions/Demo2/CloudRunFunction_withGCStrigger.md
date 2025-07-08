# Creating a cloud function with gcs trigger (move file to different bucket)
## 1. Create a 2nd bucket 
## 2. Create your python script: 
- in this case I will move the file to another bucket if constraints are met
  
 ![image](https://github.com/user-attachments/assets/fd5dd756-c400-43f1-b2de-5b94790e90fc)


> [!TIP]
> NOTE: Cloud Run is designed to handle only HTTP requests, so your function must accept a request object, which represents the incoming HTTP request. In contrast, Cloud Functions can handle both HTTP and background events (like GCS triggers) and use event and context parameters for those. If you try to use event, context in Cloud Run, it will fail because Cloud Run never passes those — it only sends a structured HTTP request.
> -	Must use: def ozmovingfiles(request: Request):
> -	Not: def ozmovingfiles(event, context):

## 3. Upload file – it should be moved immediately by your function: 
 
![image](https://github.com/user-attachments/assets/cd3003e1-8a9d-4103-adf6-c4f28bab14d0)

 ![image](https://github.com/user-attachments/assets/d8bde357-230c-4752-8218-6f0763b539ee)

	
