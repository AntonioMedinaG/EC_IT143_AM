/*****************************************************************************************************************
NAME:    Top 3 Regions by Orders Query
PURPOSE: Identify the top 3 sales territories by order count and total sales

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Ethan London  1. Created SQL to find top 3 regions by order volume and sales

RUNTIME: 
Xm Xs

NOTES: 
This script retrieves the top 3 sales territories by order count.
******************************************************************************************************************/

-- Q4: Which regions had the most orders? Show me the top 3 performers with the order count and totals.
-- A4: This query returns the top 3 territories by number of orders and total sales.

SELECT TOP 3 st.Name AS Territory, COUNT(*) AS OrderCount, SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY OrderCount DESC;
