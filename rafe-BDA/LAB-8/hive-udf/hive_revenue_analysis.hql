-- Create Database
CREATE DATABASE IF NOT EXISTS enterprise_sales;
USE enterprise_sales;

-- Drop table
DROP TABLE IF EXISTS orders;

-- Create Table
CREATE TABLE orders (
    order_id INT,
    customer_name STRING,
    region STRING,
    order_amount DOUBLE,
    order_date STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- Load Data
LOAD DATA LOCAL INPATH 'orders_data.csv'
INTO TABLE orders;

-- Add Python Script
ADD FILE revenue_category_udf.py;

-- Create Classified Table (FINAL FIXED)
CREATE TABLE classified_orders AS
SELECT
    TRANSFORM(order_id, customer_name, region, order_amount, order_date)
    USING 'python3 revenue_category_udf.py'
    AS (revenue_category STRING)
FROM orders;

-- Final Analysis
SELECT revenue_category, COUNT(*)
FROM classified_orders
GROUP BY revenue_category;
