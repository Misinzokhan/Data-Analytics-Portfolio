-- CREATING DATABASE
CREATE DATABASE SalesDB;
USE SalesDB;
SELECT *
FROM salesdb.superstore;

-- DATA CLEANING

-- 1. Inspecting the raw table
DESCRIBE SalesDB.superstore;
SELECT * FROM salesdb.superstore
LIMIT 10;

-- 2. Check for duplicates
SELECT *, COUNT(*)
FROM salesdb.superstore
GROUP BY 'Row ID'
HAVING COUNT(*) > 1;

-- 3. Fix data types
SELECT `Order Date`, `Ship Date`
FROM salesdb.superstore
LIMIT 10;

UPDATE salesdb.superstore
SET `Order Date` = STR_TO_DATE(`Order Date`, '%m/%d/%Y');
UPDATE salesdb.superstore
SET `Ship Date` = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');

-- 4. Check missing values
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Missing_Profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Missing_Region,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Missing_Discount
FROM salesdb.superstore;

SELECT * FROM salesdb.superstore
WHERE 'Order Date' is NULL
  OR  'Order Date' = '';
 
 
-- 5.Validation of business logic
SELECT *
FROM salesdb.superstore
WHERE 'Ship Date' < 'Order Date';

SELECT *
FROM superstore
WHERE Sales < 0;

-- EXPLORATORY DATA ANALYSIS

-- 1. Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore;

-- 2. Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM salesdb.superstore;

-- 3. Total Order 
SELECT COUNT(DISTINCT `Order ID`) AS Total_Order
FROM salesdb.superstore;

-- 4. Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customer
FROM salesdb.superstore;

-- 5. Sales by Region 
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 6. Sales by Category
SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 7. Profit by Category
SELECT Category, ROUND(SUM(Profit),2) AS Total_Profit
FROM salesdb.superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 8. Top Selling  Products
SELECT `Product Name`, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Top Customers
SELECT `Customer Name`, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 10. Sales by Year
SELECT YEAR (`Order Date`) AS Year ,
ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Year`
ORDER BY `Year`;

-- 11. Sales by Month
SELECT MONTH (`Order Date`) AS Month ,
ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Month`
ORDER BY `Month`;

-- 12. Most profitable Product
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM salesdb.superstore
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

-- 13. Loss-Making Products
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM salesdb.superstore
GROUP BY `Product Name`
ORDER BY Profit ASC
LIMIT 10;

-- 14. Profit Margin by Category
SELECT Category,
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM salesdb.superstore
GROUP BY Category;

-- 15. Create View
CREATE VIEW Sales_by_Region AS
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

CREATE VIEW Total_Sales AS
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore;

CREATE VIEW Total_Profit AS
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM salesdb.superstore;

CREATE VIEW Sales_by_Year AS
SELECT YEAR (`Order Date`) AS Year ,
ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Year`
ORDER BY `Year`;

CREATE VIEW Most_Profitable_Products AS
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM salesdb.superstore
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

CREATE VIEW Sales_by_Month AS
SELECT MONTH (`Order Date`) AS Month ,
ROUND(SUM(Sales),2) AS Total_Sales
FROM salesdb.superstore
GROUP BY `Month`
ORDER BY `Month`;











 
  
   