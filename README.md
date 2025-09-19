# Walmart-Sales-Data-Analysis
# Overview
This project explores Walmart sales data to uncover top-performing branches and product lines, study sales trends, and understand customer behaviour.
Insights from this analysis can help improve and optimise Walmart’s sales strategies. 
## Objectives
- Identify best-selling product lines and those needing improvement.
- Analyse sales trends across time and branches.
- Understand customer segments, their purchasing patterns, and their profitability.
- Provide actionable recommendations to optimise marketing and operations.
## Dataset
- ** Dataset Link: ** [Walmart Dataset](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)
The dataset is sourced from the Kaggle Walmart Sales Forecasting Competition and contains 1,000 sales transactions from three Walmart branches located in Mandalay, Yangon, and Naypyitaw.

## Key Facts
- 17 columns describing sales transactions
-Historical data includes holiday markdown events that influence sales patterns.

# Database Schema
| Column              | Description                         | Data Type       |
| ------------------- | ----------------------------------- | --------------- |
| invoice\_id         | Unique invoice ID of the sale       | `VARCHAR(30)`   |
| branch              | Branch where sales occurred         | `VARCHAR(5)`    |
| city                | Location of the branch              | `VARCHAR(30)`   |
| customer\_type      | Type of customer                    | `VARCHAR(30)`   |
| gender              | Customer gender                     | `VARCHAR(10)`   |
| product\_line       | Product line sold                   | `VARCHAR(100)`  |
| unit\_price         | Price per product                   | `DECIMAL(10,2)` |
| quantity            | Quantity sold                       | `INT`           |
| VAT                 | Tax on the purchase                 | `DECIMAL(6,4)`  |
| total               | Total purchase cost                 | `DECIMAL(12,4)` |
| date                | Purchase date                       | `DATETIME`      |
| time                | Purchase time                       | `TIME`          |
| pay\_method         | Payment method                      | `VARCHAR(15)`   |
| cogs                | Cost of goods sold                  | `DECIMAL(10,2)` |
| gross\_mar\_percent | Gross margin percentage             | `DECIMAL(11,9)` |
| gross\_inc          | Gross income                        | `DECIMAL(12,4)` |
| rating              | Customer rating                     | `DECIMAL(3,1)`  |
| time\_of\_day\*     | Morning/Afternoon/Evening indicator |                 |
| day\_name\*         | Day of the week                     |                 |
| month\_name\*       | Month of the year                   |                 |

# Business Problems and SQL Solutions
# Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?
# Product
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?

# Sales
1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (Value Added Tax)?
4. Which customer type pays the most in VAT?

# Customer
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?

# Findings
- Top Product Lines: Certain categories consistently outperform others in total revenue.
- Branch Performance: One branch records significantly higher overall sales.
- Peak Periods: Evenings and specific weekdays show the highest sales volume.
- Customer Insights: A particular customer type contributes the highest revenue and tax (VAT).

# Code
For the rest of the code, check the SQL_queries.sql file
-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

