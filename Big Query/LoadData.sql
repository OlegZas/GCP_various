-- *****************************************************************************]
-- **************************DATA_LOAD_PROCEDURE***************************************************]
--1. Creating the Staging table where the datatype of some columns will need to be updated
CREATE TABLE IF NOT EXISTS `DataLoad.Staging_Table` (
  CLIENT_ID STRING(4),
  RECORD_ID BIGINT NOT NULL, -- renamed from 'RULEELEMENTOWNERSEQ'
  RECORD_NAME STRING(127) NOT NULL, -- renamed "NAME"
  RECORD_DESCRIPTION STRING(255),
  SCHEME_NAME STRING(127), -- added to replicate UI
  DIVISION STRING(90),
  START_DATE DATE NOT NULL, -- DATE
  END_DATE DATE NOT NULL, -- DATE
  IS_ACTIVE INT64 NOT NULL,
  CREATED_AT TIMESTAMP NOT NULL, -- TIMESTAMP 
  REMOVED_AT TIMESTAMP NOT NULL, -- TIMESTAMP (if we filter > 2200, then this could be DATE, otherwise it could have TIME as well)
  ATTRIBUTE_1 STRING(255),
  ATTRIBUTE_2 STRING(255),
  ATTRIBUTE_3 STRING(255),
  ATTRIBUTE_4 STRING(255),
  ATTRIBUTE_5 STRING(255),
  ATTRIBUTE_6 STRING(255),
  ATTRIBUTE_7 STRING(255),
  ATTRIBUTE_8 STRING(255),
  ATTRIBUTE_9 STRING(255),
  ATTRIBUTE_10 STRING(255),
  ATTRIBUTE_11 STRING(255),
  ATTRIBUTE_12 STRING(255),
  ATTRIBUTE_13 STRING(255),
  ATTRIBUTE_14 STRING(255),
  ATTRIBUTE_15 STRING(255),
  ATTRIBUTE_16 STRING(255),
  NUMBER_1 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_1 BIGINT,
  NUMBER_2 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_2 BIGINT,
  NUMBER_3 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_3 BIGINT,
  NUMBER_4 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_4 BIGINT,
  NUMBER_5 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_5 BIGINT,
  NUMBER_6 BIGDECIMAL(25, 10),
  UNIT_TYPE_FOR_NUMBER_6 BIGINT,
  DATE_1 DATE,  -- DATE 
  DATE_2 DATE,
  DATE_3 DATE,
  DATE_4 DATE,
  DATE_5 DATE,
  DATE_6 DATE,
  BOOLEAN_1 INT64,
  BOOLEAN_2 INT64,
  BOOLEAN_3 INT64,
  BOOLEAN_4 INT64,
  BOOLEAN_5 INT64,
  BOOLEAN_6 INT64
);

--  
DROP TABLE `DataLoad.Staging_Table`; 

-- *******************************************************************************************

CREATE OR REPLACE PROCEDURE `DataLoad.SP_Data_Load` (IN TARGET_DATE DATE )
BEGIN
  --1. Staging table is created 
  --2. Declaring variables
  DECLARE STORAGE_BUCKET STRING;
  DECLARE FILE_PATH STRING DEFAULT CONCAT('Records/RECORD_', FORMAT_DATE('%Y%m%d', TARGET_DATE), '_*.csv'); -- pattern for the file name
  DECLARE FILE_URI STRING;

  SET STORAGE_BUCKET = (SELECT Value FROM Configuration.GlobalSettings WHERE KeyName='DATA_BUCKET');
  SET FILE_PATH = CONCAT('Records/RECORD_', FORMAT_DATE('%Y%m%d', TARGET_DATE), '_*.csv');
  SET FILE_URI = CONCAT(STORAGE_BUCKET, '/', FILE_PATH);
 
  --4. Truncating old Staging data
  TRUNCATE TABLE `DataLoad.Staging_Table`;

  --3. Loading data into the Staging tables with defined schema. Some of the columns will need to be modified later. 
  EXECUTE IMMEDIATE FORMAT(""" 
    LOAD DATA INTO DataLoad.Staging_Table ( 
      CLIENT_ID STRING(4),
      RECORD_ID BIGINT NOT NULL, -- renamed from 'RULEELEMENTOWNERSEQ'
      RECORD_NAME STRING(127) NOT NULL, -- renamed "NAME"
      RECORD_DESCRIPTION STRING(255),
      SCHEME_NAME STRING(127), -- added to replicate UI
      DIVISION STRING(90),
      START_DATE DATE NOT NULL, -- DATE
      END_DATE DATE NOT NULL, -- DATE
      IS_ACTIVE INT64 NOT NULL,
      CREATED_AT TIMESTAMP NOT NULL, -- TIMESTAMP 
      REMOVED_AT TIMESTAMP NOT NULL, -- TIMESTAMP (if we filter > 2200, then this could be DATE, otherwise it could have TIME as well)
      ATTRIBUTE_1 STRING(255),
      ATTRIBUTE_2 STRING(255),
      ATTRIBUTE_3 STRING(255),
      ATTRIBUTE_4 STRING(255),
      ATTRIBUTE_5 STRING(255),
      ATTRIBUTE_6 STRING(255),
      ATTRIBUTE_7 STRING(255),
      ATTRIBUTE_8 STRING(255),
      ATTRIBUTE_9 STRING(255),
      ATTRIBUTE_10 STRING(255),
      ATTRIBUTE_11 STRING(255),
      ATTRIBUTE_12 STRING(255),
      ATTRIBUTE_13 STRING(255),
      ATTRIBUTE_14 STRING(255),
      ATTRIBUTE_15 STRING(255),
      ATTRIBUTE_16 STRING(255),
      NUMBER_1 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_1 BIGINT,
      NUMBER_2 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_2 BIGINT,
      NUMBER_3 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_3 BIGINT,
      NUMBER_4 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_4 BIGINT,
      NUMBER_5 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_5 BIGINT,
      NUMBER_6 BIGDECIMAL(25, 10),
      UNIT_TYPE_FOR_NUMBER_6 BIGINT,
      DATE_1 DATE,  -- DATE 
      DATE_2 DATE,
      DATE_3 DATE,
      DATE_4 DATE,
      DATE_5 DATE,
      DATE_6 DATE,
      BOOLEAN_1 INT64,
      BOOLEAN_2 INT64,
      BOOLEAN_3 INT64,
      BOOLEAN_4 INT64,
      BOOLEAN_5 INT64,
      BOOLEAN_6 INT64 
    )
    FROM FILES  (
      skip_leading_rows=1,
      format = 'CSV',
      field_delimiter='\t',
      uris = ['%s']
    );
  """, FILE_URI);
END;

