-- Create database
CREATE DATABASE WalmartSales;
USE WalmartSales;

-- Create table 
CREATE TABLE sales (invoice_id VARCHAR(30)NOT NULL PRIMARY KEY 
,branch VARCHAR(5)NOT NULL  ,
city VARCHAR(30) NOT NULL , 
customer_type VARCHAR(30) NOT NULL , 
gender VARCHAR(10)NOT NULL ,
product_line VARCHAR(100) NOT NULL ,
unit_price DECIMAL(10,2) NOT NULL , 
quantity INT NOT NULL ,
VAT DECIMAL(6,4) NOT NULL , 
total DECIMAL(12,4) NOT NULL ,
date DATETIME NOT NULL ,
time TIME NOT NULL ,
pay_method VARCHAR(15)NOT NULL ,
cogs DECIMAL(10,2) NOT NULL ,
gross_mar_percent DECIMAL(11,9) , 
gross_inc DECIMAL(12,4) NOT NULL ,
rating DECIMAL(3,1)) ;
select * from sales;
SELECT time ,
CASE WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	 WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
     ELSE "Evening"
     END AS time_of_day
     FROM sales;
ALTER TABLE sales ADD COLUMN time_of_day varchar(20);
UPDATE sales
 SET time_of_day = (
 CASE WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	 WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
     ELSE "Evening"
     END 
 );
ALTER TABLE sales ADD COLUMN day_name VARCHAR(30);

UPDATE sales 
SET day_name = DAYNAME(date) ;
select month_name from sales;
ALTER TABLE sales ADD COLUMN month_name VARCHAR(20);
UPDATE sales 
SET month_name = MONTHNAME(date);
-- Generic Questions --- 
-- 1.
SELECT COUNT(DISTINCT city)from sales ;
-- 2.
SELECT * from sales;
SELECT city, branch from sales ;
-- Product---
-- 1.
SELECT COUNT(DISTINCT product_line) FROM sales ;
-- 2.
SELECT COUNT(*) , pay_method FROM sales 
GROUP BY pay_method ORDER BY COUNT(pay_method)DESC LIMIT 1;
-- 3.
SELECT COUNT(*) , product_line FROM sales 
GROUP BY product_line ORDER BY COUNT(product_line)DESC LIMIT 1 ;
--  4.
SELECT SUM(total) AS total_revenue, month_name 
FROM sales GROUP BY month_name ;
-- 5
SELECT SUM(COGS) ,month_name FROM sales GROUP BY month_name 
ORDER BY SUM(cogs) DESC LIMIT 1;
-- 6.
SELECT product_line ,sum(total) FROM sales
GROUP BY product_line ORDER BY SUM(total) DESC LIMIT 1; 
-- 7.
SELECT city ,sum(total) FROM sales
GROUP BY city ORDER BY SUM(total) DESC LIMIT 1;
-- 8.
SELECT product_line ,sum(vat) FROM sales
GROUP BY product_line ORDER BY SUM(vat) DESC LIMIT 1;
-- 9
SELECT product_line, 
CASE WHEN total > AVG(total) THEN "Good"
ELSE "Bad"
END AS product_category
FROM sales;
-- 10
SELECT branch,SUM(quantity) as qty FROM sales 
GROUP BY branch HAVING SUM(quantity) > (SELECT AVG(qty) from sales);

select avg(quantity) from sales group by branch;
select * from sales;
-- 11
SELECT gender, product_line, count(gender) as total_count
FROM sales GROUP BY gender, product_line 
ORDER BY total_count DESC LIMIT 1;
-- 12
SELECT AVG(rating)AS avg_rating , product_line FROM sales 
GROUP BY product_line ORDER BY avg_rating DESC;
-- Sales -------
-- 1

-- 2
SELECT customer_type, sum(total) as t_revenue
FROM sales GROUP BY customer_type 
ORDER BY t_revenue desc LIMIT 1;
-- 3
SELECT city, sum(vat) as t_vat
FROM sales GROUP BY city 
ORDER BY t_vat desc LIMIT 1 ;
-- 4
SELECT customer_type, sum(VAT) as t_vat
FROM sales GROUP BY customer_type 
ORDER BY t_vat DESC LIMIT 1 ;
-- Customer ------
-- 1
SELECT COUNT(DISTINCT customer_type) from sales  ; 
-- 2
SELECT COUNT(DISTINCT pay_method) from sales  ; 
-- 3
SELECT COUNT(DISTINCT customer_type) FROM sales;
-- 4
SELECT SUM(total) AS t_purchase ,customer_type from sales 
GROUP BY customer_type ORDER BY t_purchase DESC LIMIT 1  ;
-- 5
SELECT gender, customer_type,count(customer_type) FROM sales 
GROUP BY gender , customer_type  ORDER BY COUNT(customer_type) desc ;
-- 6
SELECT gender,count(gender), branch FROM sales
GROUP BY branch, gender ;
-- 7
select * from sales;
SELECT time_of_day ,count(rating) AS rating_count 
FROM sales GROUP BY time_of_day 
ORDER BY rating_count DESC LIMIT 1;
-- 8
SELECT branch , time_of_day ,count(rating) AS rating_count 
FROM sales GROUP BY branch ,time_of_day
ORDER BY rating_count DESC ;
-- 9
SELECT day_name , avg(rating) from sales
GROUP BY day_name ORDER BY avg(rating) DESC LIMIT 1;
-- 10
SELECT day_name, branch, avg(rating) from sales
GROUP BY day_name ,branch ORDER BY avg(rating) DESC LIMIT 1;







