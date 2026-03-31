-- Load data (year and temperature separated by space)
raw_data = LOAD '/user/pig/ncdc/input/weather_data.txt'
USING PigStorage(' ')
AS (year:chararray, temp:int);

-- Group by year
grouped_data = GROUP raw_data BY year;

-- Find maximum temperature per year
max_temp = FOREACH grouped_data
    GENERATE group AS year,
             MAX(raw_data.temp) AS max_temperature;

-- Store result
STORE max_temp INTO '/user/pig/ncdc/output';
