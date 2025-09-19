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

# Findings
- Top Product Lines: Certain categories consistently outperform others in total revenue.
- Branch Performance: One branch records significantly higher overall sales.
- Peak Periods: Evenings and specific weekdays show the highest sales volume.
- Customer Insights: A particular customer type contributes the highest revenue and tax (VAT).

# Recommendations

