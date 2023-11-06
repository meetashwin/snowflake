USE ROLE ACCOUNTADMIN;

// Create a sample warehouse

CREATE OR REPLACE WAREHOUSE "EXERCISE_WH"
WITH
WAREHOUSE_SIZE = XSMALL
AUTO_SUSPEND = 600 -- auto suspend after 10 mins of not used
AUTO_RESUME = TRUE
COMMENT = 'A sample warehouse that of size XSMALL that can be used to process queries';

// Create a database

CREATE OR REPLACE DATABASE "FIRST_DB";

// Create a sample table

CREATE OR REPLACE TABLE "FIRST_DB"."PUBLIC"."FIRST_TABLE" (
    "ID" STRING
);

// Ensure that table is empty

USE DATABASE FIRST_DB;

SELECT * FROM "FIRST_DB"."PUBLIC"."FIRST_TABLE";