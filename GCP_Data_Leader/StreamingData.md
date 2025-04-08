# Streaming Data

When working with streaming data, the following services are essential:
![image](https://github.com/user-attachments/assets/91c50542-c90f-4892-8b4e-812232018513)

## 1. **Pub/Sub** 
   - **Purpose**: The service used to receive real-time messages. Pub/Sub enables real-time message ingestion for processing and further analysis.

## 2. **Processing the Message**

   Once the message is received, you can process it using one of the following services:
   
   - **Dataflow**: 
     - Purpose: Used for analyzing, aggregating, and filtering data with more complex logic.
   
   - **Cloud Run Functions**:
     - Purpose: For simpler logic where you don't need complex processing. Ideal for lightweight data operations.

## 3. **Loading the Data**

   After processing the data, you can load it into different storage solutions based on the type of analysis or use case:
   
   - **BigQuery**:
     - Purpose: Best suited for ad-hoc complex analysis. BigQuery is a highly scalable data warehouse for running SQL queries over large datasets.
   
   - **Bigtable**:
     - Purpose: Best for time-series data with predefined queries. Bigtable allows real-time analysis and is optimized for large amounts of low-latency data.
   
   - **Datastore**:
     - Purpose: Useful for storing data for mobile or web applications. It provides a highly scalable NoSQL database for managing application data.
