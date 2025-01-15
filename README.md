# asos-vs-prism-performance

# ASOS vs Prism Performance Benchmark (2023)

## Overview
This repository contains a benchmarking analysis comparing ASOS's 2023 financial performance with Prism's internal KPIs. The analysis focuses on key performance metrics such as gross margin, active customers, visits, orders, and expenses.

## Project Structure
- **`analysis.docx`**: The full comparison document with KPI tables and SQL query results.
- **`sql_queries.sql`**: SQL scripts used to retrieve data for each KPI.
- **`results_summary.md`**: A summary of insights based on the comparison.

## Key Performance Indicators (KPIs)
| **KPI**                | **ASOS (2023)** | **Prism** |
|------------------------|-----------------|-----------|
| **Gross Margin**        | 40.01%           | 47.16%    |
| **Active Customers**    | 26.4M            | 0.2M      |
| **Visits**              | 3.02B            | 60.6M     |
| **Orders**              | 99.7M            | 0.4M      |
| **NSM**                 | Customer Engagement | 0.98%  |
| **ABV**                 | £37.85           | £25.38    |
| **Conversion Rate**     | 3.3%             | 0.98%     |
| **Distribution of Expenses** | £429.7M (Distribution), £1,279.8M (Admin) | £4.76M (Product Cost) |

## SQL Queries
All queries are located in `sql_queries.sql`. Here is a sample query for calculating gross margin:
```sql
SELECT 
    ((SUM(item_quantity * item_price) - SUM(cost_of_item)) / SUM(item_quantity * item_price)) * 100 AS gross_margin_percentage
FROM 
    `prism-insights.prism_acquire.transactionsanditems` AS t
JOIN 
    `prism_acquire.product_costs` AS pc
ON 
    t.item_id = pc.item_id;
