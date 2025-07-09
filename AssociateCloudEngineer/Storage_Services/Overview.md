# Storage Services 
> [!TIP] Tips to Choose:
> •	Use Cloud Storage for files and backups.
> •	Use Cloud SQL or AlloyDB for traditional apps needing SQL.
> •	Choose Spanner if your app needs SQL + global scale.
> •	Use Datastore or Bigtable for NoSQL, depending on complexity and size.
> •	Choose BigQuery for reporting and large-scale analytics.
 

## 1. Google Cloud Storage (GCS)
•	What it is: A storage service for files like images, videos, backups, or any large unstructured data.
•	When to use: For storing large files or data backups; like a file cabinet in the cloud.
•	Why: You need a scalable, low-cost way to store and access data (e.g., media, exports, reports).
•	Purpose: General-purpose object storage.
•	Advantages:
o	Very scalable and durable
o	Access from anywhere
o	Cheap for storing large files
________________________________________
## 2. Persistent Disk
•	What it is: A virtual hard drive for your virtual machines (VMs).
•	When to use: When using Compute Engine VMs and need disk storage (like a computer’s SSD or HDD).
•	Why: You need to store data used by VMs, such as databases or app files.
•	Purpose: Block storage for VMs.
•	Advantages:
o	High performance
o	Automatically backed up
o	Can resize without downtime
________________________________________
## 3. Filestore
•	What it is: A network file system (like Google Drive for servers).
•	When to use: When apps need shared file storage (e.g., for images or logs).
•	Why: You need multiple VMs to access the same files quickly.
•	Purpose: Shared file storage using NFS.
•	Advantages:
o	Easy to mount on multiple VMs
o	Fast performance
o	Good for shared folders between apps
________________________________________
## 4. Cloud SQL
•	What it is: Managed relational databases like MySQL, PostgreSQL, or SQL Server.
•	When to use: When you need structured data with SQL queries and transactions.
•	Why: You want a traditional database without managing the server yourself.
•	Purpose: Easy-to-use SQL database service.
•	Advantages:
o	Fully managed (updates, backups, failover)
o	Easy to scale
o	Familiar SQL interface
________________________________________
## 5. Cloud Spanner
•	What it is: A scalable, global relational database.
•	When to use: When you need SQL with high availability across regions and massive scale.
•	Why: You need strong consistency and SQL features for global apps.
•	Purpose: Distributed SQL database for large systems.
•	Advantages:
o	Global scalability
o	Strong consistency
o	Fully managed
________________________________________
## 6. AlloyDB
•	What it is: A fast, managed PostgreSQL database built for performance and analytics.
•	When to use: When you want PostgreSQL but with faster queries and better scaling.
•	Why: You need PostgreSQL compatibility with advanced features.
•	Purpose: Enterprise-grade PostgreSQL with high performance.
•	Advantages:
o	4x faster than standard PostgreSQL
o	Compatible with PostgreSQL
o	Handles both transactions and analytics well
________________________________________
## 7. Cloud Datastore (now called Firestore in Datastore mode)
•	What it is: A NoSQL database for app data (key-value/document style).
•	When to use: For mobile/web apps needing fast and flexible data storage.
•	Why: You need a simple database with fast lookups and scaling.
•	Purpose: Store structured data without complex schemas.
•	Advantages:
o	NoSQL flexibility
o	Scales automatically
o	Good for web/mobile apps
________________________________________
## 8. Google Bigtable
•	What it is: A NoSQL database for massive, real-time workloads (e.g., analytics).
•	When to use: When you need fast reads/writes on huge data (e.g., IoT, finance, ad tech).
•	Why: You need horizontal scaling and fast processing of huge datasets.
•	Purpose: Wide-column store for big, fast data.
•	Advantages:
o	Very fast
o	Scales to billions of rows
o	Works well with analytics engines
________________________________________
## 9. BigQuery
•	What it is: A serverless data warehouse for analytics and reporting.
•	When to use: When analyzing large datasets using SQL.
•	Why: You need fast, on-demand querying of large data without managing servers.
•	Purpose: Analyze and report on large datasets.
•	Advantages:
o	Super-fast SQL queries
o	Pay-per-query or flat-rate pricing
o	Integrates well with Looker and Data Studio
