/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_Instruments_AM
PURPOSE: Answer key questions for the Instruments community data set.
MODIFICATION LOG:
Ver Date       Author          Description
----- ---------- ------------- ----------------------------------------
1.0  06/03/2025  Antonio Medina Built script 
NOTES:

******************************
***********************************************************************************/

/* Q5: What is the price range and average cost of different types of instruments, and how do material types affect these prices?
   Author: Antonio Medina
*/
SELECT type, material, 
       MIN(price_usd) AS MinPrice, 
       MAX(price_usd) AS MaxPrice, 
       AVG(price_usd) AS AvgPrice
FROM instruments
GROUP BY type, material
ORDER BY type, material;

/* Q6: Which instrument types are most commonly supplied, and what materials are most used in their construction?
   Author: Antonio Medina
*/
SELECT type, material, COUNT(instrument_id) AS CountInstruments
FROM instruments
GROUP BY type, material
ORDER BY CountInstruments DESC;

/* Q7: How does the availability of certain instruments by type and material vary across suppliers, and how could this affect sales strategies?
   Author: Kouadio Jean Jaures Domin N'GUESSAN
*/
SELECT s.supplier_name, i.type, i.material, COUNT(i.instrument_id) AS InstrumentCount
FROM suppliers s
JOIN instruments i ON s.supplier_id = i.supplier_id
GROUP BY s.supplier_name, i.type, i.material
ORDER BY s.supplier_name, InstrumentCount DESC;

/* Q8: Which instruments have the highest prices, and which suppliers provide those premium instruments to help optimize procurement budgets?
   Author: Antonio Medina
*/
SELECT TOP 10 i.name AS InstrumentName, i.price_usd AS PriceUSD, s.supplier_name AS SupplierName
FROM instruments i
JOIN suppliers s ON i.supplier_id = s.supplier_id
ORDER BY i.price_usd DESC;
