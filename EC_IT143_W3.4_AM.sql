
/*****************************************************************************************************************
NAME:    Least Expensive Items Query
PURPOSE: Find the 5 least expensive items in the database

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Jonah Green   1. Created SQL to get the 5 least expensive items

RUNTIME: 
Xm Xs

NOTES: 
This script retrieves the five least expensive items from the Production.Product table, sorted by list price.
******************************************************************************************************************/

-- Q1: What are our 5 least expensive items?
-- A1: This query retrieves the 5 products with the lowest list price.

SELECT TOP 5 Name, ListPrice
FROM Production.Product
WHERE ListPrice > 0
ORDER BY ListPrice ASC;



/*****************************************************************************************************************
NAME:    Unique Job Titles Query
PURPOSE: List all unique job titles from employee records

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Cesar Mariano Lopez Posadas 1. Created SQL to list unique job titles

RUNTIME: 
Xm Xs

NOTES: 
This script retrieves all distinct job titles from HumanResources.Employee.
******************************************************************************************************************/

-- Q2: List all unique job titles present in our employee records.
-- A2: This query returns a list of distinct job titles from the employee table.

SELECT DISTINCT JobTitle
FROM HumanResources.Employee;




/*****************************************************************************************************************
NAME:    Sales Performance by Territory Query
PURPOSE: Analyze sales performance across territories

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Luke Ephraim Gohnert 1. Created SQL to analyze territory performance

RUNTIME: 
Xm Xs

NOTES: 
This script compares total sales by sales territory.
******************************************************************************************************************/

-- Q3: Are there any noticeable differences in sales performance between the different sales territories?
-- A3: This query returns total sales amount per sales territory.

SELECT st.Name AS Territory, SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalSales DESC;


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



/*****************************************************************************************************************
NAME:    Online Orders January 2013 Query
PURPOSE: Review online orders from January 2013

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Antonio Medina 1. Created SQL to review online orders in Jan 2013

RUNTIME: 
Xm Xs

NOTES: 
This script retrieves count and total value of online orders in January 2013.
******************************************************************************************************************/

-- Q5: I want to review orders from January 2013. How many were online orders? Show the total and the value.
-- A5: This query counts online orders in Jan 2013 and shows the total amount.

SELECT COUNT(*) AS OnlineOrderCount, SUM(TotalDue) AS TotalOnlineSales
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 1
  AND OrderDate >= '2013-01-01'
  AND OrderDate < '2013-02-01';




/*****************************************************************************************************************
NAME:    Least Selling Accessories 2011 Query
PURPOSE: Identify accessories with the lowest sales in 2011

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Ethan London  1. Created SQL to find least selling accessories in 2011

RUNTIME: 
Xm Xs

NOTES: 
This script retrieves accessories with the lowest total sales in 2011 including name, price, and total sales amount.
******************************************************************************************************************/

-- Q6: Which accessories sold the least in 2011? Show the product name, price, and total sales.
-- A6: This query finds the accessories with the lowest total sales for the year 2011.

SELECT p.Name, p.ListPrice, SUM(sd.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sd
JOIN Sales.SalesOrderHeader sh ON sd.SalesOrderID = sh.SalesOrderID
JOIN Production.Product p ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Accessories'
  AND YEAR(sh.OrderDate) = 2011
GROUP BY p.Name, p.ListPrice
ORDER BY TotalSales ASC;




/*****************************************************************************************************************
NAME:    Column Names for Person.Person Table
PURPOSE: Retrieve the column names in Person.Person

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Antonio Medina 1. Created SQL to get column names of Person.Person

RUNTIME: 
Xm Xs

NOTES: 
This script lists all column names from the Person.Person table.
******************************************************************************************************************/

-- Q7: What are the column names in the Person.Person table?
-- A7: This query returns the column names of Person.Person.

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Person'
  AND TABLE_NAME = 'Person';



/*****************************************************************************************************************
NAME:    Product Pricing Metadata
PURPOSE: Retrieve data types and constraints for product pricing

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2025   Luke Ephraim Gohnert 1. Created SQL to get metadata on product pricing

RUNTIME: 
Xm Xs

NOTES: 
This script returns the data types and constraints for product pricing columns.
******************************************************************************************************************/

-- Q8: What are the data types and constraints used for storing product pricing information in the database?
-- A8: This query returns the column data type and constraint info for pricing columns in Production.Product.

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product'
  AND TABLE_SCHEMA = 'Production'
  AND COLUMN_NAME IN ('StandardCost', 'ListPrice');