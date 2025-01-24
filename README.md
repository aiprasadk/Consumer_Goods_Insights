# Consumer_Goods_Insights
# Ad_Hoc_Requests-SQL (📄 Codebasics Resume Project challenge -4)

### 👋Introduction

Domain:  Consumer Goods | Function: Executive Management
Atliq Hardwares (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too.

### 📑 Problem Statement:

The management at Atliq Hardwares realized they lack actionable insights to make fast and smart data-informed decisions. To address this, the company provided 10 ad hoc business requests requiring analysis and insight.


### 📝 Project Objective:
**SQL Queries**:  
- Execute SQL queries to answer each of the 10 ad hoc requests.

**Data Visualization**:  
- Convert query results into meaningful and actionable visualizations for better comprehension.

**Insight Presentation**:  
- Present both visualizations and insights clearly to top-level management for strategic decision-making.


### 📋 Ad Hoc Requests:<br />
1. **APAC Market Presence**:  
   List the markets where customer "AtliQ Exclusive" operates in the APAC region.

2. **Unique Product Increase (2020 vs 2021)**:  
   Calculate the percentage increase of unique products in 2021 vs. 2020. The output includes:  
   - `unique_products_2020`  
   - `unique_products_2021`  
   - `percentage_chg`

3. **Unique Products by Segment**:  
   Report the count of unique products for each segment, sorted in descending order by product count.

4. **Segment-Wise Product Increase (2021 vs 2020)**:  
   Identify the segment with the largest increase in unique products from 2020 to 2021. Output includes:  
   - `segment`  
   - `product_count_2020`  
   - `product_count_2021`  
   - `difference`

5. **Highest and Lowest Manufacturing Cost**:  
   Find products with the highest and lowest manufacturing costs. Output includes:  
   - `product_code`  
   - `product`  
   - `manufacturing_cost`

6. **Top 5 Customers by Discount**:  
   List the top 5 customers who received the highest average pre-invoice discount percentage in the Indian market for the fiscal year 2021. Output includes:  
   - `customer_code`  
   - `customer`  
   - `average_discount_percentage`

7. **Gross Sales for AtliQ Exclusive**:  
   Generate a monthly report for "AtliQ Exclusive" showing gross sales in 2021, helping management understand high and low-performing months. Output includes:  
   - `Month`  
   - `Year`  
   - `Gross_sales_amount`

8. **Highest Sold Quantity in 2020**:  
   Identify the quarter of 2020 with the maximum sold quantity. Output includes:  
   - `Quarter`  
   - `total_sold_quantity` (sorted)

9. **Top Sales Channel (2021)**:  
   Report the channel that contributed the most to gross sales in 2021 and its percentage contribution. Output includes:  
   - `channel`  
   - `gross_sales_mln`  
   - `percentage`

10. **Top 3 Products by Division (2021)**:  
    List the top 3 products by total sold quantity for each division in 2021. Output includes:  
    - `division`  
    - `product_code`  
    - `product`  
    - `total_sold_quantity`  
    - `rank_order`
