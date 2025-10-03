SELECT count(*)
FROM bigquery-public-data.stackoverflow.posts_questions
WHERE EXTRACT(YEAR FROM creation_date) = 2020
;
CREATE SCHEMA `oz-gcp.BIGQUERY`;
------------------ NOT PARTITIONED, NOT CLUSTERED
CREATE TABLE `oz-gcp.BIGQUERY.STACKQA` AS
  SELECT *
  FROM `bigquery-public-data.stackoverflow.posts_questions`
  WHERE EXTRACT(YEAR FROM creation_date) = 2020;

--  SLOT TIME CONSUMED: 4 min 19 sec  - Bytes billed 3.41 GB
SELECT * FROM BIGQUERY.STACKQA
WHERE creation_date between '2020-03-01' and '2020-05-31' and tags = 'android';
----------------------- PARITIONED
# Partitioning must be done on a new table when created. 
CREATE TABLE `oz-gcp.BIGQUERY.STACKQA2` 
  PARTITION BY DATE(creation_date)
  AS
  SELECT *
  FROM `bigquery-public-data.stackoverflow.posts_questions`
  WHERE EXTRACT(YEAR FROM creation_date) = 2020;
--
SELECT * FROM BIGQUERY.STACKQA2
WHERE creation_date between '2020-03-01' and '2020-05-31';
-- SLOT TIME CONSUMED: 1 min 11 sec Bytes billed 968 MB
---------------------------- PARTITIONED AND CLUSTERING 
CREATE TABLE `oz-gcp.BIGQUERY.STACKQA3` 
  PARTITION BY DATE(creation_date)
  CLUSTER BY tags
  AS
  SELECT *
  FROM `bigquery-public-data.stackoverflow.posts_questions`
  WHERE EXTRACT(YEAR FROM creation_date) = 2020;

SELECT * FROM BIGQUERY.STACKQA3 -- Bytes billed 850 MB ___ Slot time consumed 14 sec
WHERE creation_date between '2020-03-01' and '2020-05-31' and tags = 'android';
