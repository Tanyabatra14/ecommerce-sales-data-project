-- 1 create database named "ecommerce-sales-data"
CREATE DATABASE IF NOT EXISTS ecommerce_sales_data
 SHOW DATABASES
 USE ecommerce_sales_data
 -- 2  CREATE A TABLE INSIDE THE DATABASE NAME "ecommerce_sales_data"
  -- Command to generate SQL File -- csvsql -- dialect mysql --snifflimit 10000 Sales_Dataset.csv > Result.sql
 CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);
SHOW TABLES
DESC sales_Dataset

-- 3. Load the data available in Sales_Dataset.csv file to the Sales_Dataset tables
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales_Dataset.csv'
INTO TABLE Sales_Dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from Sales_Dataset
  
-- indentify the top 3 states with the highest shipping costs
 -- state highest_sum_shipping_cost
 Select state ,SUM(shipping_cost) AS avg_shipping_cost
 from Sales_Dataset
 group by state 
 order by avg_shipping_cost desc
 LIMIT 3;
 
 -- comman table expressions - Complexity of any given query + resuability of the query
 with states as (
 Select state ,SUM(shipping_cost) AS avg_shipping_cost
 from Sales_Dataset
 group by state 
 order by avg_shipping_cost desc
   LIMIT 3
 ) select * from states
 
-- top 10 products by revenue
SELECT product_name, SUM(sales) AS total_revenue
FROM Sales_Dataset
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Customer Segmentation by Purchase Frequency
SELECT customer_name, COUNT(order_id) AS num_orders
FROM Sales_Dataset
GROUP BY customer_name
ORDER BY num_orders DESC;







 



