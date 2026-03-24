

# Superstore Sales Analysis

[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat-square&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-336791?style=flat-square&logo=postgresql&logoColor=white)](https://www.mysql.com/)
[![Status](https://img.shields.io/badge/Status-Completed-2ea44f?style=flat-square)]()

> *Transforming Superstore retail transaction data into actionable business insights on sales performance, profitability, and customer trends using SQL and Power BI.*

---

## Project Overview

This project analyses retail sales data from the **Superstore dataset** to understand sales performance, profitability, and customer trends. The analysis was performed using **SQL** for data extraction and querying, and **Power BI** for interactive visualisation.

The goal was to transform raw sales data into meaningful business insights that support strategic decision-making.

---

## Objectives

| # | Objective |
|---|-----------|
| 1 | Analyse overall **sales and profit performance** |
| 2 | Identify **high-performing products and categories** |
| 3 | Compare **sales performance by region** |
| 4 | Analyse **sales trends over time** |
| 5 | Identify **loss-making products** |
| 6 | Build an **interactive business dashboard** |

---

## Dataset

| Attribute | Detail |
|-----------|--------|
| **Name** | Superstore Dataset |
| **Source** | [Kaggle](https://www.kaggle.com/) |
| **Domain** | Retail / Business Sales |

**Columns included:**

`Order ID` · `Order Date` · `Ship Date` · `Customer ID` · `Customer Name` · `Segment` · `Region` · `State` · `Category` · `Sub-Category` · `Product Name` · `Sales` · `Profit` · `Quantity`

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Data storage and querying |
| SQL | Data analysis |
| Microsoft Power BI | Interactive dashboard & visualisation |

---

## Project Workflow

### Step 1 — Data Import
- Superstore dataset imported into a **MySQL database**
- Tables structured and verified for integrity

### Step 2 — Data Cleaning
- Checked and handled missing values
- Removed duplicate records
- Verified and corrected data types
- Standardised column names

### Step 3 — SQL Data Analysis

Eight key business questions answered with SQL:

| # | Query |
|---|-------|
| 1 | Total Sales |
| 2 | Total Profit |
| 3 | Total Orders |
| 4 | Total Customers |
| 5 | Sales by Region |
| 6 | Sales by Category |
| 7 | Top Selling Products |
| 8 | Monthly Sales Trend |

#### Sample SQL Queries

**Total Sales & Profit:**
```sql
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM salesdb.superstore;
```

**Sales by Region:**
```sql
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY Region
ORDER BY Total_Sales DESC;
```

**Top Selling Products:**
```sql
SELECT `Product Name`, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
```

**Monthly Sales Trend:**
```sql
SELECT MONTH (`Order Date`) AS Month ,
ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Month`
ORDER BY `Month`;
```

---

## Power BI Dashboard

An interactive dashboard was built in **Microsoft Power BI** featuring:

- **KPI Cards** — Sales, Profit, Profit Margin, Orders, Customers
- Sales Trend Analysis
- Category Performance
- Regional Sales Analysis
- Profit Analysis
- Interactive Filters

### Dashboard Preview

![Superstore Sales Dashboard]<img width="1177" height="723" alt="dashboard_overview" src="https://github.com/user-attachments/assets/650949cf-d332-4c65-94ab-e2a40c906654" />


---

## Key Insights

> **The West region leads in sales, Technology drives profit, but some sub-categories are actively losing money.**

- **West region generated the highest sales** across all regions
- **Technology category produced the highest profit** overall
- **Some sub-categories generated negative profit** — requiring urgent pricing review
- **Sales increased toward end of year** — indicating strong seasonal demand in Q4
- **Office Supplies showed consistent sales performance** throughout the year

---

## Recommendations

1. **Focus on profitable categories** — prioritise Technology and Office Supplies in marketing spend
2. **Optimise regional sales** — boost campaigns in underperforming regions
3. **Review loss-making products** — adjust pricing or discontinue low-profit sub-categories
4. **Plan for seasonal trends** — align inventory and marketing campaigns with Q4 peak months

---

## Conclusion

This project demonstrates the ability to transform raw retail data into actionable business insights using **SQL and Power BI**. The interactive dashboard allows stakeholders to explore sales performance and profitability across different dimensions.

The project showcases practical data analyst skills including **SQL querying, data visualisation, and analytical thinking** — all essential for a professional data analyst role.

---


---

## Author

**David J Misinzo**
- 📧 [davidmisinzo9@gmail.com](mailto:davidmisinzo9:gmail.com)
- 🔗 [LinkedIn](https://www.linkedin.com/in/david-misinzo-981594238)
- 🌐 [Portfolio Website](https://github.com/Misinzokhan/Data-Analytics-Portfolio)
---

