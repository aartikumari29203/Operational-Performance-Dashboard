# Operational Performance Dashboard

An interactive Power BI dashboard built using SQL Server and DAX to analyze sales revenue, regional performance, monthly trends, and top-performing products.

## Project Overview

This project demonstrates a complete SQL Server → Power BI analytical workflow using the AdventureWorks2022 dataset.

The dashboard provides insights into:

- Total revenue
- Revenue by region
- Monthly revenue trends
- Top-performing products by category
- Year-over-year (YoY) revenue growth

## Tech Stack

- SQL Server
- Power BI
- DAX
- AdventureWorks2022
- Git & GitHub

## SQL Analysis

Developed reusable SQL views using:

- JOINs
- Common Table Expressions (CTEs)
- Aggregations
- Window functions
- `RANK()`
- Date-based aggregation

### SQL Views

1. `vw_RegionalRevenue` – Calculates total revenue by sales region.
2. `vw_MonthlyRevenue` – Calculates monthly revenue for trend analysis.
3. `vw_TopProducts` – Ranks products within each category based on revenue.

## Power BI Dashboard

The dashboard includes:

- Total Revenue KPI
- Revenue by Region
- Monthly Revenue Trend
- Top Products by Category
- Regions Covered
- YoY Revenue Growth
- Interactive date and region filters

## DAX

A YoY Revenue Growth measure was created to compare revenue with the corresponding period in the previous year.

```DAX
YoY Growth % =
VAR CurrentRevenue =
    SUM(vw_MonthlyRevenue[TotalRevenue])
VAR PreviousYearRevenue =
    CALCULATE(
        SUM(vw_MonthlyRevenue[TotalRevenue]),
        DATEADD(vw_MonthlyRevenue[RevenueMonth], -1, YEAR)
    )
RETURN
    DIVIDE(
        CurrentRevenue - PreviousYearRevenue,
        PreviousYearRevenue
    )
```

## Dashboard Preview

The Power BI dashboard analyzes AdventureWorks sales data through interactive visualizations and KPI cards.

![Operational Performance Dashboard](Screenshots/dashboard.png)

## Repository Structure

```text
Operational-Performance-Dashboard/
│
├── Project_TV.pbix
├── README.md
├── Screenshots/
│   └── dashboard.png
│
└── SQL/
    ├── vw_RegionalRevenue.sql
    ├── vw_MonthlyRevenue.sql
    └── vw_TopProducts.sql
```

## Dataset

This project uses the Microsoft AdventureWorks2022 sample database for demonstration and analytical purposes.

## Key Learning Outcomes

- SQL Server data analysis and view creation
- CTE-based analytical queries
- Window functions and ranking
- Power BI dashboard development
- DAX-based KPI calculation
- Interactive business reporting


