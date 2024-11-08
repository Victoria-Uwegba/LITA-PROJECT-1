SELECT * FROM [dbo].[LITA sales analysis ]

---retrieve the total sales for each product category.----
SELECT Product, SUM(Total_Sales) AS TotalSales
FROM [dbo].[LITA sales analysis ]
GROUP BY Product;


---find the number of sales transactions in each region.----
SELECT Region, COUNT(OrderID) AS TransactionCount
FROM [dbo].[LITA sales analysis ]
GROUP BY Region;

---find the highest-selling product by total sales value.----
SELECT top 1 Product, SUM(Total_Sales) AS TotalSales
FROM [dbo].[LITA sales analysis ]
GROUP BY Product
ORDER BY TotalSales DESC

----calculate total revenue per product---
SELECT  Product, SUM(Total_Sales) AS TotalRevenue
FROM [dbo].[LITA sales analysis ]
GROUP BY Product
ORDER BY TotalRevenue DESC

---calculate monthly sales totals for the current year.----
SELECT 
    MONTH(Order_Date) AS month,
	SUM(Total_Sales) AS total_sales
    FROM 
    [dbo].[LITA sales analysis ]
WHERE 
Order_Date between '2024-01-01' AND '2024-12-31'
GROUP BY 
    Order_Date
ORDER BY 
    month;

	----find the top 5 customers by total purchase amount.---
	SELECT TOP 5
    Customer_Id, 
    SUM(Total_Sales) AS total_purchase
FROM 
    [dbo].[LITA sales analysis ]
GROUP BY 
    Customer_Id
ORDER BY 
    total_purchase DESC;

	----calculate the percentage of total sales contributed by each region.---
	SELECT 
    region,
    SUM(Total_Sales) AS totalsales,
    ROUND((SUM(Total_Sales) * 100 / (SELECT SUM(Total_Sales) FROM [dbo].[LITA sales analysis ] )), 2) AS percentage_of_total_sales
FROM 
    [dbo].[LITA sales analysis ]
GROUP BY 
    region
ORDER BY 
    totalsales DESC;

	---identify products with no sales in the last quarter.---
SELECT DISTINCT Product
FROM [dbo].[LITA sales analysis ]
WHERE Order_Date between '2024-07-01' and '2024-08-31' 
