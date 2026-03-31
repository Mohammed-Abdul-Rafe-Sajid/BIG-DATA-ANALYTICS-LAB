# -*- coding: utf-8 -*-
from pyspark.sql import SparkSession
import time
from pyspark.ml.feature import StringIndexer, VectorAssembler
from pyspark.ml.classification import RandomForestClassifier
from pyspark.ml import Pipeline
spark = SparkSession.builder \
    .appName("FraudDetection") \
    .getOrCreate()

data = spark.read.csv("transactions.csv", header=True, inferSchema=True)

# ✅ ADD THIS PART (missing in your code)
location_index = StringIndexer(inputCol="location", outputCol="locationIndex", handleInvalid="keep")
merchant_index = StringIndexer(inputCol="merchant", outputCol="merchantIndex", handleInvalid="keep")
device_index = StringIndexer(inputCol="device", outputCol="deviceIndex", handleInvalid="keep")

assembler = VectorAssembler(
    inputCols=["amount","locationIndex","merchantIndex","deviceIndex"],
    outputCol="features"
)

rf = RandomForestClassifier(labelCol="fraud", featuresCol="features")

pipeline = Pipeline(stages=[location_index, merchant_index, device_index, assembler, rf])

model = pipeline.fit(data)

predictions = model.transform(data)

predictions.select("amount","location","fraud","prediction").show()

time.sleep(300)   # optional, reduce from 180

spark.stop()
