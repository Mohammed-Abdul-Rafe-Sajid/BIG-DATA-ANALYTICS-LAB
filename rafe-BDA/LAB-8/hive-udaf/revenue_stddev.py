#!/usr/bin/env python3
import sys
import math
from collections import defaultdict

data = defaultdict(list)

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    region, revenue = line.split("\t")
    
    # Skip NULLs
    if revenue == r'\N':
        continue
    
    try:
        data[region].append(float(revenue))
    except ValueError:
        continue  # skip invalid numbers

# Compute StdDev per region
for region in data:
    values = data[region]
    n = len(values)
    if n == 0:
        continue
    mean = sum(values) / n
    variance = sum((x - mean) ** 2 for x in values) / n
    stddev = math.sqrt(variance)
    print(f"{region}\t{stddev}")
