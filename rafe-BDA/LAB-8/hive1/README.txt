

STEP 1:
hdfs dfs -mkdir -p /user/hive/warehouse/enterprise_sales/sales_data
hdfs dfs -put sales_data.csv /user/hive/warehouse/enterprise_sales/sales_data/

STEP 2:
hive -f create_table.hql

STEP 3:
hive -f analysis_queries.hql
