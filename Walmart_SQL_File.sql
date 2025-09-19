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
-- 1.How many unique cities does the data have?
SELECT COUNT(DISTINCT city)from sales ;
-- 2.In which city is each branch?
SELECT DISTINCT city, branch from sales ;

-- Product---
-- 1.How many unique product lines does the data have?
SELECT COUNT(DISTINCT product_line) FROM sales ;

-- 2.What is the most common payment method?
SELECT COUNT(*) , pay_method FROM sales 
GROUP BY pay_method ORDER BY COUNT(pay_method)DESC LIMIT 1;

-- 3.What is the most selling product line?
SELECT COUNT(*) , product_line FROM sales 
GROUP BY product_line ORDER BY COUNT(product_line)DESC LIMIT 1 ;

--  4.What is the total revenue by month?
SELECT SUM(total) AS total_revenue, month_name 
FROM sales GROUP BY month_name ;

-- 5.What month had the largest COGS?
SELECT SUM(COGS) ,month_name FROM sales GROUP BY month_name 
ORDER BY SUM(cogs) DESC LIMIT 1;

-- 6.What product line had the largest revenue?
SELECT product_line ,sum(total) FROM sales
GROUP BY product_line ORDER BY SUM(total) DESC LIMIT 1; 

-- 7.What is the city with the largest revenue?
SELECT city ,sum(total) FROM sales
GROUP BY city ORDER BY SUM(total) DESC LIMIT 1;

-- 8.What product line had the largest VAT?
SELECT product_line ,sum(vat) FROM sales
GROUP BY product_line ORDER BY SUM(vat) DESC LIMIT 1;

-- 9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT product_line,
CASE WHEN SUM(total) > (SELECT AVG(total) FROM sales) THEN "Good"
ELSE "Bad"
END AS product_category
FROM sales
GROUP BY product_line;

-- 10.Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) as qty FROM sales 
GROUP BY branch HAVING SUM(quantity) > (SELECT AVG(quantity) from sales);

-- 11.What is the most common product line by gender?
SELECT gender, product_line, count(gender) as total_count
FROM sales GROUP BY gender, product_line 
ORDER BY total_count DESC LIMIT 1;

-- 12.What is the average rating of each product line?
SELECT AVG(rating)AS avg_rating , product_line FROM sales 
GROUP BY product_line ORDER BY avg_rating DESC;

-- Sales -------
-- 1.Number of sales made in each time of the day per weekday?
SELECT day_name , time_of_day, COUNT(*) AS t_sales FROM sales 
GROUP BY day_name ,time_of_day
ORDER BY day_name ,t_sales DESC ;

-- 2.Which of the customer types brings the most revenue?
SELECT customer_type, sum(total) as t_revenue
FROM sales GROUP BY customer_type 
ORDER BY t_revenue desc LIMIT 1;

-- 3.Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, sum(vat) as t_vat
FROM sales GROUP BY city 
ORDER BY t_vat desc LIMIT 1 ;

-- 4.Which customer type pays the most in VAT?
SELECT customer_type, sum(VAT) as t_vat
FROM sales GROUP BY customer_type 
ORDER BY t_vat DESC LIMIT 1 ;

-- Customer ------
-- 1.How many unique customer types does the data have?
SELECT COUNT(DISTINCT customer_type) from sales  ; 

-- 2.How many unique payment methods does the data have?
SELECT COUNT(DISTINCT pay_method) from sales  ; 

-- 3.What is the most common customer type?
SELECT customer_type, COUNT(*) as cnt FROM sales
GROUP BY customer_type ORDER BY cnt DESC LIMIT 1  ;

-- 4.Which customer type buys the most?
SELECT SUM(total) AS t_purchase ,customer_type from sales 
GROUP BY customer_type ORDER BY t_purchase DESC LIMIT 1  ;

-- 5.What is the gender of most of the customers?
SELECT gender, COUNT(*) AS cnt
FROM sales
GROUP BY gender
ORDER BY cnt DESC LIMIT 1;

-- 6.What is the gender distribution per branch?
SELECT gender,count(gender), branch FROM sales
GROUP BY branch, gender ;

-- 7.Which time of the day do customers give most ratings?
select * from sales;
SELECT time_of_day ,count(rating) AS rating_count 
FROM sales GROUP BY time_of_day 
ORDER BY rating_count DESC LIMIT 1;

-- 8.Which time of the day do customers give most ratings per branch?
SELECT branch , time_of_day ,count(rating) AS rating_count 
FROM sales GROUP BY branch ,time_of_day
ORDER BY rating_count DESC ;

-- 9.Which day fo the week has the best avg ratings?
SELECT day_name , avg(rating) from sales
GROUP BY day_name ORDER BY avg(rating) DESC LIMIT 1;

-- 10.Which day of the week has the best average ratings per branch?
SELECT day_name, branch, avg(rating) from sales
GROUP BY day_name ,
	branch ORDER BY avg(rating) DESC LIMIT 1;







