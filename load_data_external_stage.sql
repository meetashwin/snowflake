// Create a database EXERCISE_DB
CREATE OR REPLACE DATABASE "EXERCISE_DB";

// Create a Customer table 
CREATE OR REPLACE TABLE EXERCISE_DB.PUBLIC.CUSTOMERS (
    ID INT,
    FIRST_NAME VARCHAR(30),
    LAST_NAME VARCHAR(30),
    EMAIL VARCHAR(40),
    AGE INT,
    CITY VARCHAR(30));
    
SELECT * FROM EXERCISE_DB.PUBLIC.CUSTOMERS;

// Creating schema for external stages
CREATE OR REPLACE SCHEMA external_stages;

// Creating external stage

CREATE OR REPLACE STAGE EXERCISE_DB.external_stages.aws_stage
    url='s3://snowflake-assignments-mc/loadingdata/';

// List files in the external stage
LIST @aws_stage

// Copy file contents to table
COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS
    FROM @EXERCISE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=';' skip_header=1)
    files = ('customers2.csv');

COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS
    FROM @EXERCISE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=';' skip_header=1)
    files = ('customers3.csv');