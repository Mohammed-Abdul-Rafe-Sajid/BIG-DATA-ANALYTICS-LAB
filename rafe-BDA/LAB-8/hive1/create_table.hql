
CREATE DATABASE IF NOT EXISTS enterprise_sales;

USE enterprise_sales;

CREATE EXTERNAL TABLE sales (
  order_id INT,
  order_date STRING,
  customer_id STRING,
  region STRING,
  product STRING,
  quantity INT,
  price INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/enterprise_sales/sales_data';
