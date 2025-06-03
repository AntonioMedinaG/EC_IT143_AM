/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_Suppliers_AM
PURPOSE: Answer key questions for the Suppliers community data set.
MODIFICATION LOG:
Ver Date       Author          Description
----- ---------- ------------- ----------------------------------------
1.0  06/03/2025  Antonio Medina Built script 
NOTES:

******************************
***********************************************************************************/

/* Q1: How many suppliers are located in each city, and which cities have the highest concentration of suppliers to optimize regional management?
   Author: Antonio Medina
*/
SELECT city, COUNT(supplier_id) AS SupplierCount
FROM suppliers
GROUP BY city
ORDER BY SupplierCount DESC;

/* Q2: Which suppliers provide the widest variety of instruments, and how does their location impact delivery times and costs?
   Author: Antonio Medina
*/
SELECT s.supplier_name, s.city, COUNT(DISTINCT i.type) AS InstrumentTypeVariety
FROM suppliers s
JOIN instruments i ON s.supplier_id = i.supplier_id
GROUP BY s.supplier_name, s.city
ORDER BY InstrumentTypeVariety DESC;

/* Q3: Are suppliers located in cities with low sales performance, and how could supplier location influence inventory turnover?
   Author: Bertin Ramy
   -- Sin datos de ventas, mostramos lista simple para análisis manual.
*/
SELECT supplier_name, city
FROM suppliers
ORDER BY city;

/* Q4: What are the contact details and geographic distribution of all suppliers to facilitate communication and planning?
   Author: Antonio Medina
*/
SELECT supplier_name, city, phone_number
FROM suppliers
ORDER BY city, supplier_name;
