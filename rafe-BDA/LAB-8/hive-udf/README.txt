
========================================================
HIVE PYTHON UDF PROJECT (STREAMING)
========================================================

PROJECT FILES:
--------------
orders_data.csv
revenue_category_udf.py
hive_revenue_analysis.hql

========================================================
STEP 1: Start Hive
========================================================
hive
========================================================
STEP 2: Execute Script
========================================================
hive> source hive_revenue_analysis.hql;

OR from terminal:
hive -f hive_revenue_analysis.hql

========================================================
WHAT THIS PROJECT DOES
========================================================
✔ Creates enterprise_sales database
✔ Creates orders table
✔ Loads dataset
✔ Applies Python UDF using TRANSFORM
✔ Classifies revenue into:
     PLATINUM
     GOLD
     SILVER
     BRONZE
✔ Generates summary report using GROUP BY

========================================================
CLUSTER MODE NOTES
========================================================
- Ensure python3 available on all nodes
- Ensure Hive streaming enabled
- Upload CSV to HDFS if running distributed mode

hdfs dfs -put orders_data.csv /user/hive/

Modify LOAD DATA to:
LOAD DATA INPATH '/user/hive/orders_data.csv' INTO TABLE orders;

========================================================
