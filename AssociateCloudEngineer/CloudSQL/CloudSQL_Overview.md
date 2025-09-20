# Cloud SQL

- Fully-managed relational database service in GCP (similar to Amazon RDS)
- Supports MySQL, PostgreSQL, and SQL Server

## When to use Cloud SQL:
- Smaller databases with moderate storage and performance needs.
- Transactional systems where data consistency, ACID compliance, and complex SQL queries are required.
- If you need compatibility with MySQL, PostgreSQL, or SQL Server.
- You need a fully-managed solution without worrying about maintenance and management overhead.

## Key Differences: When to Choose Each

| **Use Case** | **Cloud SQL** | **BigQuery** | **Cloud Spanner** |
|--------------|---------------|--------------|-------------------|
| **Data Size** | Small to medium | Large, petabyte-scale | Very large, horizontally scalable |
| **Type of Workload** | Transactional (OLTP) | Analytical (OLAP) | Mixed transactional & analytical |
| **Scalability** | Limited horizontal scaling | Massive scale, serverless | Global, horizontal scaling |
| **Performance** | Moderate, best for moderate traffic | Optimized for high-performance queries on large datasets | High performance for global, low-latency transactions |
| **ACID Compliance** | Yes | No (eventually consistent) | Yes |
| **Pricing** | Based on storage and compute | Based on storage and queries | Based on storage and compute (scales horizontally) |
| **Typical Use Case** | Relational DB for small to medium apps, transactional workloads | Data analysis, reporting, ML at scale | Large-scale applications with global distribution and high availability |

## Summary:
- Use **Cloud SQL** when you need a traditional relational database for transactional workloads (OLTP) with moderate traffic and you want a managed solution.
- Use **BigQuery** for large-scale data analysis (OLAP), especially if you have massive datasets, need real-time analytics, or want to run advanced queries without worrying about infrastructure.
- Use **Cloud Spanner** for high-performance, globally distributed transactional applications that require both strong consistency and horizontal scalability, or if your workload needs both OLTP and OLAP features.
