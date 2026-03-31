from pyspark import SparkContext
import time
sc = SparkContext(appName="LogAnalysisExample")

logs = sc.textFile("/home/hduser042/rafe-BDA/LAB-7/log-batch_analysis/server_log.txt")
errors = logs.filter(lambda x: "ERROR" in x)

error_counts = errors.map(lambda x: (x,1)).reduceByKey(lambda a,b:a+b)

top_errors = error_counts.take(10)

print("\nMost Frequent Errors:\n")

for error,count in top_errors:
    print(error,count)
time.sleep(180)
sc.stop()
