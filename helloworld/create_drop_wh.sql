USE ROLE ACCOUNTADMIN;

//Create a sample warehouse

CREATE OR REPLACE WAREHOUSE "EXERCISE_WH"
WITH
WAREHOUSE_SIZE = XSMALL -- compute capacity
AUTO_SUSPEND = 600 -- auto suspend after 10 mins of not used
AUTO_RESUME = TRUE -- auto resume when used
COMMENT = 'A sample warehouse that of size XSMALL that can be used to process queries';

// Describe the sample warehouse

DESCRIBE WAREHOUSE EXERCISE_WH;

// Drop the sample warehouse

DROP WAREHOUSE EXERCISE_WH;

