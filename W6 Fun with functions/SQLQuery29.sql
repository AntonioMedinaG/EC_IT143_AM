/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s7_amg.sql
PURPOSE: Return 0 results if the scalar function works as expected.
MODIFICATION LOG:
Ver   Date       Author    Description
----- ---------- --------- ------------------------------------------
1.0   06/10/2025 AMG       Built negative test to validate UDF result
RUNTIME:

NOTES:
This script returns 0 rows only if the UDF result matches the actual most common country.
***********************************************************************************
*/

-- Q7: Does this test confirm the function’s correctness?
-- A7: If this query returns 0 rows, then yes, the function is working correctly.

;WITH ActualTopCountry AS (
    SELECT TOP 1 Country
    FROM t_w3_schools_customers
    GROUP BY Country
    ORDER BY COUNT(*) DESC
)
SELECT *
FROM ActualTopCountry
WHERE Country <> dbo.fn_most_common_country();
