# Database Categories

### Factors to Consider When Choosing a Database:
- Do you want a fixed schema?
- Atomicity of transactions?
- What kind of latency do you want? (seconds, milliseconds, microseconds)
- How many transactions do you expect? (hundreds, thousands, or millions of transactions?)
- How much data will be stored? (MBs, GBs, TBs, PBs, etc.)

## Relational Databases

- **Predefined schema** with tables and relationships
- **Very strong transactional capabilities**: One transaction can make updates to multiple tables and won’t be committed unless it succeeds.

  ![image](https://github.com/user-attachments/assets/9206ec7a-bb7e-46b1-86d6-82c40cda15b5)

### Used for:
- **OLTP (Online Transaction Processing)**: Example use cases include banking and stock trading.
- **OLAP (Online Analytics Processing)**: Used for running many queries on huge amounts of data.

## OLTP (Online Transaction Processing)
- Handles large numbers of users making a large number of transactions.
- Common in applications like **CRM**, **ERP**, **e-commerce**, and **banking**.

### Recommended on GCP:
- **Cloud SQL**: Supports regional databases up to a few TBs.
- **Cloud Spanner**: Scales unlimited (multiple PBs); recommended for global apps with users across the globe and horizontal scaling.

### Cloud SQL Setup:

1. **Connect to the instance**: 
   - (Provide connection steps here, e.g., via the GCP Console or command-line interface)
![image](https://github.com/user-attachments/assets/0bd7def0-c29a-4851-8796-41430993f9ac)

2. **Enable the Cloud SQL Admin API**: 
   - (Provide steps to enable the API)
![image](https://github.com/user-attachments/assets/533fcc85-6739-4544-9964-1a0428bf5e60)

3. **Create your schema**: 
   - (Provide steps or examples of schema creation)
![image](https://github.com/user-attachments/assets/2fc393f5-83f6-4297-84f8-a52cd5d848e2)
