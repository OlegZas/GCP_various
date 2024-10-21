#Procedure to insert new records and update a column value in the table. 
CREATE OR REPLACE PROCEDURE `prod-xyz-db-a1b2.User_Data.spUserLogUpdate_CTR` ()
BEGIN 
    INSERT INTO `prod-xyz-db-a1b2.User_Data.UserActivityLog` 
    SELECT ActivityRec.* 
    FROM 
        UNNEST(`prod-xyz-db-a1b2.User_Data.fnRetrieveUserActivity_CTR`()) AS ActivityRec
    WHERE NOT EXISTS ( -- to ensure that no duplicates will be added 
      SELECT 1 
      FROM `prod-xyz-db-a1b2.User_Data.UserActivityLog` AS ExistingRec
      WHERE ExistingRec.ACTIVITY_ID = ActivityRec.ACTIVITY_ID 
        AND ExistingRec.USER_ID = ActivityRec.USER_ID);

    UPDATE `prod-xyz-db-a1b2.User_Data.UserLastActivity`
    SET LAST_ACTIVITY_TIME = COALESCE(
        (SELECT MAX(ACTIVITY_TIMESTAMP)  -- will set last activity time to the latest timestamp when an activity was logged 
         FROM `prod-xyz-db-a1b2.User_Data.UserActivityLog` 
         WHERE USER_ID = `prod-xyz-db-a1b2.User_Data.UserLastActivity`.USER_ID),
        CURRENT_TIMESTAMP()  -- if no records in UserActivityLog then set to current timestamp 
    )
    WHERE APPLICATION_SOURCE = 'Customer_Tracking';

END;
