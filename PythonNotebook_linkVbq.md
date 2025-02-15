# BigQuery Python Notebook Example

In BigQuery, you can create a Python notebook with Python code that can query your database and create graphs and other analyses.

![image](https://github.com/user-attachments/assets/30a63cfc-542e-4616-b6f6-08ea31d18f5d)

## Python Function to Run Your BigQuery SQL Query

The following Python function demonstrates how to query BigQuery using the `google.cloud` library and pandas:

```python
from google.cloud import bigquery
import pandas as pd

# Initialize a BigQuery client
def run_bigquery_query():
    # Initialize the BigQuery client inside the function
    client = bigquery.Client()

    # Query to run on BigQuery
    query = """
    SELECT name
    FROM `dataprocapachehive.Snowflake.OZ_BQ1`
    LIMIT 10
    """

    # Run the query and get the results into a Pandas DataFrame
    query_job = client.query(query)  # Make an API request
    df = query_job.to_dataframe()    # Fetch the results into a DataFrame

    # Print the DataFrame with the results
    print(df)

# This ensures that the script runs when executed directly
if __name__ == "__main__":
    run_bigquery_query()
