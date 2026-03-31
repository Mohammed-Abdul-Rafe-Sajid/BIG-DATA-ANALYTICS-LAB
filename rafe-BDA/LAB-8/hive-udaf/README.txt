
HIVE PYTHON-BASED UDAF (STREAMING) PACKAGE

NOTE:
Hive does not support native Python UDAF like Spark.
This example uses Hive TRANSFORM (streaming) to simulate UDAF behavior.

------------------------------------------
STEP 1: Upload Data to HDFS
------------------------------------------
hdfs dfs -mkdir -p /user/hive/warehouse/enterprise_py_udaf/sales_data
hdfs dfs -put sales_data.csv /user/hive/warehouse/enterprise_py_udaf/sales_data/

------------------------------------------
STEP 2: Make Python Script Executable
------------------------------------------
chmod +x revenue_stddev.py

------------------------------------------
STEP 3: Run Hive Script
------------------------------------------
hive -f hive_python_udaf_example.hql

------------------------------------------
WHAT THIS DOES
------------------------------------------
✔ Uses Hive TRANSFORM
✔ Streams data to Python
✔ Computes StdDev per region
✔ Simulates UDAF behavior
✔ Works with Hadoop + Hive 3.x

Suitable for:
- Advanced lab demonstration
- Big Data streaming demo
- Hive-Python integration example
