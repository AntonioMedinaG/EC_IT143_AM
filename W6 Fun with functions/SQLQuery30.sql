/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s8_amg.sql
PURPOSE: Begin next step of analysis based on most common customer country.
MODIFICATION LOG:
Ver   Date       Author    Description
----- ---------- --------- ------------------------------------------
1.0   06/10/2025 AMG       Started next question exploring most common country
RUNTIME:

NOTES:

***********************************************************************************
*/

-- Q8: Who is the most common contact in the most common country?
-- A8: Since we know which country appears most frequently, I'm now curious to see who appears most often as a contact within that country. This might help identify popular clients or repeated data entries.
SELECT ContactName
FROM t_w3_schools_customers
WHERE Country = 'Germany'; -- Replace 'Germany' with the actual most common country result

