# Google Cloud SDK - Storage Commands Guide

## 1. Creating a Bucket in Cloud Storage

Cloud Storage buckets are containers that hold your data in Google Cloud Platform. Here's how to create them:

### Basic Bucket Creation
```bash
gsutil mb gs://bk-cloudsdkoleg
```

### Creating a Bucket with Project and Location
```bash
gsutil mb -p theta-topic-457803-u2-l -l us-central1 gs://bk-cloudsdkoleg
```

> **Note:** The `-p` flag specifies the project ID and `-l` sets the location (region) for your bucket.
![image](https://github.com/user-attachments/assets/e3623327-5c6b-4173-a145-8e476c7e8345)
![image](https://github.com/user-attachments/assets/44d5efb3-6e96-44bd-81d7-de1c75a8bc69)

## 2. Uploading Files to Cloud Storage

Transfer files from your local machine to Google Cloud Storage buckets.

### General Syntax
```bash
gsutil cp path/to/your/localfile.txt gs://your-bucket-name/
```

### Upload Example - Image File
```bash
gsutil cp C:\Users\zasuk\Pictures\IMG_6392.PNG gs://bk-cloudsdkoleg
```
![image](https://github.com/user-attachments/assets/7d767720-d6d6-404d-b25a-3b767cf8ad99)

![image](https://github.com/user-attachments/assets/63a6485d-31f0-4045-a0e5-07cdea600a77)

## 3. Downloading Files from Cloud Storage

Retrieve files from Cloud Storage and save them to your local machine.

### Download with Wildcard Pattern
```bash
gsutil cp gs://bk-cloudsdkoleg/IMG* C:\Users\zasuk\Downloads
```
![image](https://github.com/user-attachments/assets/b93aa60d-5a96-443f-9a03-30637f5d69f8)

> **Tip:** The `*` wildcard allows you to download multiple files matching the pattern.

---

### Additional Cloud SDK Commands

| Command | Description |
|---------|-------------|
| `gsutil ls gs://bucket-name` | List contents of a bucket |
| `gsutil rm gs://bucket-name/filename` | Delete a file from a bucket |
| `gsutil mv gs://source/file gs://dest/` | Move or rename files |
| `gsutil -m cp -r local/dir gs://bucket-name/` | Upload directory recursively |

For comprehensive documentation, visit [Google Cloud Storage documentation](https://cloud.google.com/storage/docs/gsutil)
