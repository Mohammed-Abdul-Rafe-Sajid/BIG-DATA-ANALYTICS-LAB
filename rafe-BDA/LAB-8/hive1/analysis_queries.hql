
USE enterprise_sales;

SELECT SUM(quantity * price) AS total_revenue FROM sales;

SELECT region, SUM(quantity * price) AS revenue
FROM sales
GROUP BY region;

SELECT product, SUM(quantity) AS total_units
FROM sales
GROUP BY product
ORDER BY total_units DESC;

SELECT SUBSTR(order_date,1,7) AS month,
       SUM(quantity * price) AS monthly_revenue
FROM sales
GROUP BY SUBSTR(order_date,1,7)
ORDER BY month;

SELECT AVG(quantity * price) AS avg_order_value FROM sales;
