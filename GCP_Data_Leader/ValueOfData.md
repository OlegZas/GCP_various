# Structured Data

**Structured Data**:
- Storing structured data are **Cloud SQL**, **Spanner**, or **BigQuery**.

**Semi-Structured Data** (e.g., emails, HTML, JSON, XML files):
- For semi-structured data, the options include **Datastore** and **Bigtable**.

**Unstructured Data** (e.g., text, music, data files, log files):
- **80-90%** of new enterprise data.
- Use **Machine Learning API** to extract information from unstructured data.
- **Cloud Storage**.

---

# Data Types

**First-Party Data**:
- **Description**: Proprietary customer datasets that a business collects from customer or audience transactions and interactions.
- **Example**: Length of time the user spends on the webpage.

**Second-Party Data**:
- **Description**: Often describes first-party data from another organization, such as a partner or other business in their supply chain, that can be easily deployed to augment a company's internal datasets.
- **Ownership**: Organization doesn't own it.

**Third-Party Data**:
- **Description**: Datasets collected and managed by organizations that don’t directly interact with an organization's customers or business.
- **Sources**: Government, nonprofit, or academic sources (e.g., weather or public demographic data), or from industry-specific sources like analyst reports or industry benchmarking.

![Data Types](https://github.com/user-attachments/assets/cb3d646a-cb6e-43b2-8308-0c1f6e646803)

---

# Databases

**Database**:
- **Description**: An organized collection of data stored in tables and accessed electronically from a computer system.

**Relational Database**:
- **Description**: Stores and provides access to data points that are related to one another, using tables, rows, and columns with a clearly defined schema.
- **Examples**: **Cloud SQL** and **Spanner**.

**Non-Relational (NoSQL) Database**:
- **Description**: Less structured in format, doesn’t use a tabular format of rows and columns.
- **Example**: **Bigtable**.

**Data Warehouse**:
- **Description**: An enterprise system used for the analysis and reporting of structured and semi-structured data from multiple sources.
- **Functions**: Central hub for all business data, containing structured data that has been cleaned and processed, ready for strategic analysis based on predefined business needs.
- **Benefit**: Better for insights.

**Data Lake**:
- **Description**: A repository designed to ingest, store, explore, process, and analyze any type or volume of raw data, regardless of the source (e.g., operational systems, web sources, social media, IoT).
- **Features**: Can store different types of data in its original format; ignores size limits, and requires minimal pre-processing or structuring.
- **Usage**: Raw data to explore, mine, and experiment with.

---

# Data Value Chain

1. **Data Genesis**: The initial creation of a unit of data (e.g., a click on a website, the swipe of a card, a sensor recording from an IoT device). It’s the raw material that will eventually be turned into an insight ready for action.
2. **Data Collection**: Extract data from the system in which it’s hosted and bring it to a new system.
3. **Data Processing**: Transform the collected raw data into a form that’s ready to derive insights from.
4. **Data Storage**: Where the data lands, can be found, and is ready for analysis and action.
5. **Data Analysis**: Provides direction for business-oriented action.
6. **Data Activation**: Analysis pushed to the relevant business procedures and decision-makers through business intelligence tools and dashboards.

---

# Data Governance

**Data Governance**:
- **Description**: Setting internal standards—data policies—that apply to how data is gathered, stored, processed, and disposed of.
- **Access Control**: Who can access the data.
- **Compliance**: Involves complying with external standards set by industry associations, government agencies, and other stakeholders.

**Benefits**:
- Reduces concerns about exposure of sensitive data to unauthorized individuals or systems.
- Helps prevent security breaches from malicious outsiders or insiders accessing unauthorized data.
- Ensures compliance with internal data policies and external standards.

---

# GCP Cloud Storage Products

**1. For Unstructured Data**:
- **Cloud Storage**: Offers object storage for unstructured data.
  - **Object Storage**: Manages data as “objects” rather than file storage or block storage.
    - **Features**: Objects are stored in a packaged format with binary data and metadata. Uses unique URLs and interacts well with web technologies.
    - **Common Data Types**: Video, pictures, and audio recordings.
  - **Uses**: Serving website content, storing data for archival and disaster recovery, distributing large data objects through direct download.
  - **Storage Classes**:
    - **Standard Storage**: Used for frequently accessed data.
    - **Nearline Storage**: For infrequently accessed data (once a month). Examples: data backups, long-tail multimedia content, data archiving.
    - **Coldline Storage**: For data read or modified at most once every 90 days.
    - **Archive Storage**: Ideal for data archiving, online backup, and disaster recovery.
  - **Autoclass**: A feature that automatically transitions objects to appropriate storage classes based on access patterns.

**2. For Structured Data**:
- **Cloud SQL**: Offers fully managed relational databases (MySQL, PostgreSQL, SQL Server).
  - **Features**: No software installation required, supports managed backups, encrypts customer data.
- **Spanner**: Fully managed, mission-critical relational database service that scales horizontally.
  - **Features**: Built for SQL relational databases with high availability, global consistency, automatic replication, and sharding.

**3. For Semi-Structured Data**:
- **Firestore**: Flexible, horizontally scalable NoSQL cloud database for real-time data syncing.
  - **Features**: Stores data in documents within collections, provides offline usage.
- **Bigtable**: NoSQL big data database service that powers many core Google services.
  - **Usage**: Ideal for highly scalable NoSQL database needs, handling massive data and high-throughput applications with low-latency access.

**Choosing Storage**:
- **Considerations**: BUSINESS NEED AND DATA TYPE.
- **Types**: Transactional (OLTP) vs. Analytical (OLAP) - requires more complex queries.

![Cloud Storage](https://github.com/user-attachments/assets/d2c40e19-cb22-4b88-b976-0a147a7407eb)

---

# Database Migrations

**1. Lift and Shift Platform Migration**:
- **Description**: Migrating databases from on-premises and private cloud environments to the same type of database hosted by a public cloud provider (e.g., Google Cloud).

**2. Managed Database Migration**:
- **Description**: Allows the migration of databases from SQL Server, MySQL, PostgreSQL, and others to a fully managed Google Cloud database.

**Google Cloud’s Database Migration Service (DMS)**:
- **Description**: A fully managed service facilitating the migration of databases to Google Cloud Platform with minimal downtime and complexity.
- **Supports**: Both homogeneous migrations (e.g., MySQL to MySQL) and heterogeneous migrations (e.g., Oracle to PostgreSQL).

**Datastream**:
- **Description**: Facilitates real-time data replication and synchronization across heterogeneous databases, data warehouses, and storage systems.
- **Functions**: Streams data in real-time from various sources to Google Cloud services (e.g., BigQuery, Cloud Storage), handles schema changes, data type conversions, and ensures reliable data delivery with minimal latency.


---


