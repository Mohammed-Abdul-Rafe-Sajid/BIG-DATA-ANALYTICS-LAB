import sys

def classify_revenue(amount):
    try:
        amount = float(amount)

        if amount >= 20000:
            return "PLATINUM"
        elif amount >= 10000:
            return "GOLD"
        elif amount >= 5000:
            return "SILVER"
        else:
            return "BRONZE"
    except:
        return "INVALID"

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    # Hive sends tab-separated fields → take order_amount (4th column)
    fields = line.split("\t")
    order_amount = fields[3]

    print(classify_revenue(order_amount))
