# BigQuery Python Notebook Example

In BigQuery, you can create a Python notebook with Python code that can query your database and create graphs and other analyses.
## Here’s What BigQuery Notebooks Provides:

- **Interactive Analysis**: You can run queries and Python code against BigQuery tables.
- **Visualization**: It has built-in support for visualizing data directly within the notebook environment (similar to Jupyter notebooks).
- **Data Science/ML Workflows**: You can integrate Python libraries, such as pandas, sklearn, and others, to perform data analysis and machine learning tasks.
- **Direct Access to BigQuery**: The notebooks are tightly integrated with BigQuery, making it easier to access and analyze large datasets stored in BigQuery.

### Limitations:

However, BigQuery Notebooks do not inherently support scheduled tasks or automation. This is a key limitation when you need to run a script on a recurring basis.

# Example: 

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
BigQuery Notebooks
BigQuery Notebooks is essentially an environment to interactively run Python code on top of BigQuery data. It allows data scientists, analysts, and developers to run SQL queries and Python code, all within the BigQuery UI, enabling analysis, data manipulation, and machine learning workflows.
```

