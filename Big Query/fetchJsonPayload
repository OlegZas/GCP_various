# Function to fetch multiple records (columns and JSON payload) from the table 
CREATE OR REPLACE FUNCTION `fnFetchEventDetails`()    
RETURNS ARRAY<STRUCT< 
    EVENT_ID STRING, 
    TIMESTAMP_PUBLISHED TIMESTAMP, 
    ORIGIN STRING, 
    PAYLOAD_DATA STRING, 
    STATUS_CODE STRING, 
    CREATED_AT TIMESTAMP, 
    USER_INITIATED STRING, 
    INSERT_TIMESTAMP TIMESTAMP,
    LAST_PROCESSED TIMESTAMP 
>> AS (( 
    SELECT 
        ARRAY_AGG(STRUCT(
            identifier AS EVENT_ID,
            created_time AS TIMESTAMP_PUBLISHED,
            'SERVICE_A_REQUEST_V1' AS ORIGIN,
            json_payload AS PAYLOAD_DATA, 
            "RECEIVED" AS STATUS_CODE,
            CURRENT_TIMESTAMP() AS CREATED_AT,
            'SYSTEM_USER' AS USER_INITIATED,
            insert_time AS INSERT_TIMESTAMP,
            CURRENT_TIMESTAMP() AS LAST_PROCESSED 
        ))
    FROM 
        `EventRequests_V1` AS EVENT_SOURCE
     WHERE
          EVENT_SOURCE.created_time >  (SELECT LAST_UPDATE FROM `my_database.my_project.LastRefreshData` WHERE SOURCE_ID = 'SERVICE_A')
));
