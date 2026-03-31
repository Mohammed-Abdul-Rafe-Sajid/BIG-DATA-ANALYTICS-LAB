
-- ==========================================
-- Hive Python-Based UDAF (Streaming)
-- ==========================================

USE enterprise_py_udaf;
DROP TABLE IF EXISTS sales;

CREATE EXTERNAL TABLE sales (
  order_id INT,
  region STRING,
  product STRING,
  quantity INT,
  price INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/enterprise_py_udaf/sales_data';

SELECT TRANSFORM(region, revenue)
USING 'python3 revenue_stddev.py'
AS (region STRING, revenue_stddev DOUBLE)
FROM (
    SELECT region, (quantity * price) AS revenue
    FROM sales
) t;
