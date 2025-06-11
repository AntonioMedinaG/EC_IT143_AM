/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s5_amg.sql
PURPOSE: To create a scalar function that returns the most common country
         in the [t_w3_schools_customers] table.
MODIFICATION LOG:
Ver   Date       Author    Description
----- ---------- --------- ------------------------------------------
1.0   06/10/2025 AMG       Created scalar UDF to return top country
RUNTIME:

NOTES:
This function returns the most frequent Country found in the 
[t_w3_schools_customers] table. It uses a subquery with TOP 1 
and ORDER BY COUNT(*) DESC to determine the most common country.
***********************************************************************************
*/

-- Q5: How do I create a function that returns the most frequent country?
-- A5: I’ll wrap the TOP 1 query inside a scalar UDF using RETURNS VARCHAR(255)

CREATE FUNCTION dbo.fn_most_common_country()
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @TopCountry VARCHAR(255);

    SELECT TOP 1 @TopCountry = Country
    FROM t_w3_schools_customers
    GROUP BY Country
    ORDER BY COUNT(*) DESC;

    RETURN @TopCountry;
END;
