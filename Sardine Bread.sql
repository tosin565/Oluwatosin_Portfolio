SELECT *
FROM [Sardine _Bread_sales]

-- Total Sales/Revenue
SELECT Round(SUM(total_price),2) Total_Revenue
FROM [Sardine _Bread_sales]

-- Average Sales/Revenue
SELECT Round(AVG(total_price),2) Avg_Sales
FROM [Sardine _Bread_sales]

--Average Order Value
SELECT CAST(CAST(SUM(total_price) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) Avg_Order_Value
FROM [Sardine _Bread_sales]

--Total Bread Sold
SELECT SUM(quantity) Total_Bread_Sold
FROM [Sardine _Bread_sales]

--Total Orders
SELECT COUNT(DISTINCT order_id) Total_Orders
FROM [Sardine _Bread_sales]

-- Average Bread Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id)
AS DECIMAL(10,2)) AS DECIMAL(10,2)) Avg_Bread_Per_Order
FROM [Sardine _Bread_sales]

--Daily Sales Trend
SELECT DATENAME(DW, order_date) order_day, ROUND(SUM(total_price),2) Daily_Sales
FROM [Sardine _Bread_sales]
GROUP BY DATENAME(DW, order_date)
ORDER BY Daily_Sales

--Daily Trend for Order_Id
SELECT DATENAME(DW, order_date) order_day, COUNT(DISTINCT order_id) Total_orders
FROM [Sardine _Bread_sales]
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_orders 

--Monthly Sales Trend
SELECT DATENAME(MONTH, order_date) Monthly_Order, ROUND(SUM(total_price),2) Monthly_Sales
FROM [Sardine _Bread_sales]
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Monthly_Sales DESC

--Quarterly Sales Trend
SELECT DATENAME(QUARTER, order_date) Quarterly_order, ROUND(SUM(total_price),2) Quarterly_Sales
FROM [Sardine _Bread_sales]
GROUP BY DATENAME(QUARTER, order_date)
ORDER BY Quarterly_Sales DESC

--Sales Percent by Category
SELECT category, ROUND(SUM(total_price),2) Sales_Category, CAST(CAST(SUM(total_price) AS DECIMAL(10,2)) * 100/
(SELECT CAST(SUM(total_price)  AS DECIMAL(10,2))  FROM [Sardine _Bread_sales]) AS DECIMAL(10,2)) PCT
FROM [Sardine _Bread_sales]
GROUP BY Category
ORDER BY PCT DESC

--Sales Percent by Size
SELECT size, ROUND(SUM(total_price),2) Sales_Size, CAST(CAST(SUM(total_price) AS DECIMAL(10,2)) * 100/
(SELECT CAST(SUM(total_price)  AS DECIMAL(10,2))  FROM [Sardine _Bread_sales]) AS DECIMAL(10,2)) PCT
FROM [Sardine _Bread_sales]
GROUP BY Size
ORDER BY PCT DESC

--Top 5 Sellers by Sales
SELECT TOP 5 Name, SUM(total_price) Total_Sales
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Sales DESC

--Bottom 5 Sellers by Sales
SELECT TOP 5 Name, ROUND(SUM(total_price),2) Total_Sales
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Sales ASC

--Top 5 Sellers by Quantity
SELECT TOP 5 Name, SUM(Quantity) Total_Quantity
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Quantity DESC

--Bottom 5 Sellers by Quantity
SELECT TOP 5 Name, SUM(Quantity) Total_Quantity
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Quantity ASC

--Top 5 Sellers by Total Order
SELECT TOP 5 Name, COUNT(DISTINCT order_id) Total_Order
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Order DESC

--Bottom 5 Sellers by Total Order
SELECT TOP 5 Name, COUNT(DISTINCT order_id) Total_Order
FROM [Sardine _Bread_sales]
GROUP BY Name
ORDER BY Total_Order ASC