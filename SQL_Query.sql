# Request 1
SELECT * FROM dim_customer;

SELECT DISTINCT(market)
FROM dim_customer
WHERE region = 'APAC'
AND customer = 'Atliq Exclusive';

# Request 2    
WITH cte1 AS (
SELECT COUNT(DISTINCT(product_code)) 
AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year = 2020
),

cte2 AS (
SELECT COUNT(DISTINCT(product_code)) 
as unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year = 2021)


SELECT *,
	ROUND((b.unique_products_2021-a.unique_products_2020)*100/
    a.unique_products_2020,2) as pct_change
FROM cte1 a 
CROSS JOIN cte2 b

# Request 3
SELECT segment,
	COUNT(DISTINCT(product)) AS unique_products
FROM gdb023.dim_product
GROUP BY segment
ORDER BY unique_products DESC

# Request 4
WITH cte1 AS(
SELECT 
	segment,
	COUNT(DISTINCT(product_code)) AS product_count_2020
FROM fact_sales_monthly 
JOIN dim_product 
USING (product_code)
WHERE fiscal_year = 2020
GROUP BY segment),

cte2 AS (
SELECT 
	segment,
	COUNT(DISTINCT(product_code)) AS product_count_2021
FROM fact_sales_monthly 
JOIN dim_product 
USING (product_code)
WHERE fiscal_year = 2021
GROUP BY segment)

SELECT * ,
	(product_count_2021-product_count_2020) AS difference
FROM cte1
JOIN cte2
USING (segment)

# Request 5
SELECT product_code,product, manufacturing_cost FROM dim_product
JOIN fact_manufacturing_cost
USING (product_code)
WHERE manufacturing_cost = (SELECT max(manufacturing_cost) FROM fact_manufacturing_cost)

UNION

SELECT product_code,product, manufacturing_cost FROM dim_product
JOIN fact_manufacturing_cost
USING (product_code)
WHERE manufacturing_cost = (SELECT min(manufacturing_cost) FROM fact_manufacturing_cost)

# Request 6
SELECT 
	customer_code,customer,
	ROUND(AVG(pre_invoice_discount_pct)*100,1) AS avg_disc_pct
FROM fact_pre_invoice_deductions
JOIN dim_customer
USING (customer_code)
WHERE market = "India"
AND fiscal_year = 2021
GROUP BY customer,customer_code
ORDER BY avg_disc_pct DESC
LIMIT 5

# Request 7
SELECT CONCAT(
	MONTHNAME(DATE),' ',
    YEAR(DATE) ) AS MONTH,
    ROUND(SUM(sold_quantity*gross_price),2) AS Gross_sales_Amt
    
FROM fact_sales_monthly
JOIN dim_customer
USING (customer_code)
JOIN fact_gross_price
USING(product_code,fiscal_year)
WHERE customer = "Atliq Exclusive"
GROUP BY DATE

# Request 8
SELECT
QUARTER((DATE_ADD(DATE, INTERVAL 4 MONTH))) AS quarter,
SUM((sold_quantity)) AS total_sold_quantity

FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY QUARTER

# Request 9
WITH cte AS (
SELECT channel,
		ROUND((SUM(sold_quantity*gross_price))/1000000,2) AS gross_sales_mln

FROM fact_sales_monthly
JOIN fact_gross_price
USING (product_code, fiscal_year)
JOIN dim_customer
USING (customer_code)
WHERE fiscal_year = 2021
GROUP BY CHANNEL)

SELECT *,
     ROUND(gross_sales_mln*100/SUM(gross_sales_mln) OVER (),2) AS percentage   
     FROM cte
     
# Request 10

WITH cte1 AS (
SELECT 
	MAX(division) AS division,
    MAX(product_code) AS product_code,
    MAX(product) AS product,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
JOIN dim_product
USING (product_code)
WHERE fiscal_year = 2021
GROUP BY product
ORDER BY division),

cte2 AS (
SELECT * ,
	RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rnk
FROM cte1)
SELECT * FROM cte2 WHERE rnk <=3