REGISTER 'is_good.py' USING jython AS myfuncs;
records = LOAD 'weather_data.txt'
USING PigStorage('\t')
AS (year:chararray, temp:int, quality:int);

filtered_records = FILTER records BY myfuncs.is_good(quality);

DUMP filtered_records;
