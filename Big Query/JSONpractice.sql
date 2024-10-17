#1. Create the Table
CREATE TABLE mysqlpractice-436322.JSONpractice.employees (
    id INT64,
    name STRING,
    department STRING,
    details STRING -- Storing JSON as a STRING for flexibility
);
#2.Insert Sample Data
INSERT INTO JSONpractice.employees (id, name, department, details)
VALUES
    (1, 'Alice', 'Engineering', '{"age": 30, "salary": 70000}'),
    (2, 'Bob', 'HR', '{"age": 35, "salary": 60000}'),
    (3, 'Charlie', 'Marketing', '{"age": 28, "salary": 75000}'),
    (4, 'David', 'Sales', '{"age": 28, "salary": 60000}');
#3.Querying JSON Data
SELECT
    id,
    name,
    JSON_VALUE(details, '$.age') AS age,
    JSON_VALUE(details, '$.salary') AS salary
FROM
    JSONpractice.employees;
#4. Modify the table above by adding ARRAY column and inserting nested JSON 
ALTER TABLE mysqlpractice-436322.JSONpractice.employees
ADD COLUMN NestedJson ARRAY<STRUCT< -- the other method is prefered 
    task_id INT64,
    task_name STRING,
    status STRING
>>;

UPDATE JSONpractice.employees
SET NestedJson = [
    STRUCT(101, 'Design', 'Completed'),
    STRUCT(102, 'Development', 'In Progress')
]
WHERE id = 1;
UPDATE JSONpractice.employees
SET NestedJson = [
    STRUCT(201, 'Research', 'Pending'),
    STRUCT(202, 'Testing', 'Not Started')
]
WHERE id = 2; 

#5. Add column and insert nested json as a STRING
ALTER TABLE mysqlpractice-436322.JSONpractice.employees
ADD COLUMN SuperNestedJson STRING;

UPDATE JSONpractice.employees
SET SuperNestedJson = '''[
    {"task_id": 101, "task_name": "Design", "status": "Completed"},
    {"task_id": 102, "task_name": "Development", "status": "In Progress"}
]'''
WHERE id = 1;

UPDATE JSONpractice.employees
SET SuperNestedJson = '''
    {"task_id": 201, "task_name": "Research", "status": "Pending"},
    {"task_id": 202, "task_name": "Testing", "status": "Not Started"}
'''
WHERE id = 2;
#6. #Flattening Nested JSON
SELECT
    e.id,
    e.name,
    e.department,
    JSON_VALUE(e.details, '$.age') AS age,
    JSON_VALUE(e.details, '$.salary') AS salary,
    JSON_VALUE(t, '$.task_id') AS task_id,
    JSON_VALUE(t, '$.task_name') AS task_name,
    JSON_VALUE(t, '$.status') AS status
FROM
    JSONpractice.employees AS e
LEFT JOIN UNNEST(JSON_EXTRACT_ARRAY(e.SuperNestedJson)) AS t;

/* #7 Exercise 1: Query All Employee Information
Task: Write a query to retrieve all employee information, including their details and tasks from the NestedJson column. */
SELECT E.ID, E.NAME, E.DEPARTMENT, E.DETAILS, 
  JSON_VALUE(N,'$.TASK_ID') AS TASK_ID
FROM 
      JSONpractice.employees AS E
LEFT JOIN UNNEST(JSON_EXTRACT_ARRAY(E.SuperNestedJson)) AS N;


SELECT
    e.id,
    e.name,
    JSON_EXTRACT_ARRAY(e.SuperNestedJson) AS tasks
FROM
    JSONpractice.employees AS e
WHERE
    e.name = 'Bob';
