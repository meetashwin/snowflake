USE ROLE ACCOUNTADMIN;

//Create a sample warehouse

CREATE OR REPLACE WAREHOUSE "EXERCISE_WH"
WITH
WAREHOUSE_SIZE = XSMALL -- compute capacity
AUTO_SUSPEND = 600 -- auto suspend after 10 mins of not used
AUTO_RESUME = TRUE -- auto resume when used
COMMENT = 'A sample warehouse that of size XSMALL that can be used to process queries';

// Use Warehouse EXERCISE_WH
USE WAREHOUSE "EXERCISE_WH";

// Create a database EXERCISE_DB
CREATE OR REPLACE DATABASE "EXERCISE_DB";

// Use Database EXERCISE_DB
USE DATABASE "EXERCISE_DB";

// Creating schema for external stages
CREATE OR REPLACE SCHEMA EXTERNAL_STAGES;

// Create a Stage for JSON data
CREATE OR REPLACE stage EXERCISE_DB.EXTERNAL_STAGES.JSONSTAGE
     url='s3://snowflake-assignments-mc/unstructureddata/';

// Creating schema to keep things organized - for file formats
CREATE OR REPLACE SCHEMA EXERCISE_DB.FILE_FORMATS;

// Create a JSON file format
CREATE OR REPLACE file format EXERCISE_DB.FILE_FORMATS.JSONFORMAT
    TYPE = JSON;

// Create a table JSON_RAW
CREATE OR REPLACE table EXERCISE_DB.PUBLIC.JSON_RAW (
    raw_file variant);

// Copy data from S3 into to JSON_RAW
COPY INTO EXERCISE_DB.PUBLIC.JSON_RAW
    FROM @EXERCISE_DB.EXTERNAL_STAGES.JSONSTAGE
    file_format= EXERCISE_DB.FILE_FORMATS.JSONFORMAT;

// Query from table
SELECT * FROM EXERCISE_DB.PUBLIC.JSON_RAW;
