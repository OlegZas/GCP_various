# Deploying an Application to App Engine

Follow the steps below to deploy your Python application to Google App Engine.

![image](https://github.com/user-attachments/assets/b7ac0e70-1bf2-4c9f-b816-764e01043a36)

## 1. Create an App Engine App

- Start by creating a new App Engine app in your Google Cloud project.

## 2. Open the Editor in Cloud Shell

- Launch the Cloud Shell editor from your Google Cloud Console.

## 3. Create a Python Application

- Create a new Python application in the editor. Ensure your files are ready for deployment.

## 4. Ensure That the Directory Is Set to Your Folder

- Check that your working directory is set to your project folder.

## 5. Configure the Project

To configure your Google Cloud project, run the following command to set the active project:

```bash
gcloud config set project braided-analyst-454400-f9
```
![image](https://github.com/user-attachments/assets/043e139f-9dee-4081-a77e-3585faa81578)

## 6.	Run ``` gcloud app deploy```  to deploy the application on App Engine 

![image](https://github.com/user-attachments/assets/8edf2625-f440-41df-b84d-2728e515e0e0)

## 7.	If you run into permissions error such as the one below, you would need to get Storage Object Viewer permissions for the service account or user. 

![image](https://github.com/user-attachments/assets/1725b368-b5e5-4784-9a58-801a11abd845)

![image](https://github.com/user-attachments/assets/c0c36428-5ab9-47e9-953e-2f79b17623fe)

## 8.	Deploy again ``` gcloud app deploy```
## 9.	Copy url and paste it into the search bar to open the app in your browser 

 ![image](https://github.com/user-attachments/assets/e34ee2c8-fb48-4ac5-a611-40bf98da7470)

## 10. To deploy a different version of the service: ``` gcloud app deploy --version=v2 ``` 

 ![image](https://github.com/user-attachments/assets/2841e082-82ce-4a38-8151-31300c1889fc)

## 11. Check the versions that are running 

![image](https://github.com/user-attachments/assets/686e0fd5-81ca-44af-9d7f-c4f9ec8d512b)
