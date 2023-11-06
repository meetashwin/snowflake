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

// Create a table CUSTOMERS
CREATE OR REPLACE TABLE "EXERCISE_DB"."PUBLIC"."CUSTOMERS" (
    "ID" INT,
    "first_name" STRING,
    "last_name" STRING,
    "email" STRING,
    "age" INT,
    "city" STRING
);

// Copy data from S3 into to CUSTOMERS
COPY INTO CUSTOMERS
    FROM s3://snowflake-assignments-mc/gettingstarted/customers.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1);

// Query from table
USE DATABASE "EXERCISE_DB";

SELECT COUNT(*) FROM "CUSTOMERS";
