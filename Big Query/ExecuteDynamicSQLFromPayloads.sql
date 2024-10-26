/*
 procedure is designed to process a series of dynamic SQL commands derived from JSON payloads. 
It retrieves data payloads, iterates through each entry, and extracts the necessary identifiers.
For each payload, it parses the JSON content and invokes a processing function to generate SQL statements. 
These statements are then executed sequentially. The procedure efficiently manages message statuses and ensures all commands 
are executed without skipping any, facilitating robust data handling and processing workflows.
*/

CREATE OR REPLACE PROCEDURE `xyz-abc-def-1234.NewSchema.spProcessDynamicSQL`(IN jobIdentifier STRING)
BEGIN
  DECLARE command STRING;
  DECLARE dataCollection ARRAY<STRUCT<id STRING, content STRING>>;
  DECLARE jsonData JSON; -- Retain as JSON
  DECLARE uniqueId STRING;
  DECLARE index INT64 DEFAULT 0;
  DECLARE sqlCommands ARRAY<STRING>;
  DECLARE cmdIndex INT64 DEFAULT 0;
  DECLARE identifier STRING;

  -- Retrieve the data payloads
  SET dataCollection = `xyz-abc-def-1234.NewSchema.fnFetchDataPayloads`();
  SET identifier = jobIdentifier;

  -- Iterate through each data payload and invoke the processing function
  WHILE index < ARRAY_LENGTH(dataCollection) DO
    SET uniqueId = dataCollection[OFFSET(index)].id;

    -- Explicitly parse the content to JSON
    SET jsonData = PARSE_JSON(dataCollection[OFFSET(index)].content);

    -- Invoke the processing function to generate SQL commands
    SET sqlCommands = `xyz-abc-def-1234.NewSchema.fnProcessJSONData`(jsonData, identifier, uniqueId);

    SET cmdIndex = 0; -- Reset index to prevent skipping commands
    -- Execute each SQL command
    WHILE cmdIndex < ARRAY_LENGTH(sqlCommands) DO
      EXECUTE IMMEDIATE sqlCommands[OFFSET(cmdIndex)];
      SET cmdIndex = cmdIndex + 1;
    END WHILE;

    -- Update the status of the message after processing
    CALL `xyz-abc-def-1234.NewSchema.spUpdateMessageStatus`(uniqueId);

    SET index = index + 1;
  END WHILE;
END;
