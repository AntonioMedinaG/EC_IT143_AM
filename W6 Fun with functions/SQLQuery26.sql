/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s4_amg.sql
PURPOSE: To research and test a solution that finds the most common country
         in the [t_w3_schools_customers] table.
MODIFICATION LOG:
Ver   Date       Author    Description
----- ---------- --------- ------------------------------------------
1.0   06/10/2025 AMG       
RUNTIME:

NOTES:
This script uses an ad hoc query to find the most common country in the
[t_w3_schools_customers] table. The technique involves grouping by country
and ordering by count in descending order. The query selects the top result.

Reference used: https://stackoverflow.com/questions/23788893/sql-server-find-most-frequent-value
***********************************************************************************
*/

-- Q4: How can I test if this ad hoc solution works correctly?
-- A4: I will write a query to return the most common country using GROUP BY and ORDER BY COUNT(*) DESC

SELECT TOP 1 Country, COUNT(*) AS Frequency
FROM t_w3_schools_customers
GROUP BY Country
ORDER BY Frequency DESC;



