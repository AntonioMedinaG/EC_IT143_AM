/*
***********************************************************************************
NAME: EC_IT143_6.3_fwf_s6_amg.sql
PURPOSE: Compare the result of the scalar UDF with the original ad hoc query.
MODIFICATION LOG:
Ver   Date       Author    Description
----- ---------- --------- ------------------------------------------
1.0   06/10/2025 AMG       Compared UDF result with ad hoc query result
RUNTIME:

NOTES:
This script displays the results side-by-side for verification purposes.
***********************************************************************************
*/

-- Q6: Does the scalar function return the same value as the ad hoc query?
-- A6: Let’s display both results together and compare.

-- Ad hoc query result
SELECT TOP 1 Country AS AdHocResult
FROM t_w3_schools_customers
GROUP BY Country
ORDER BY COUNT(*) DESC;

-- Scalar function result
SELECT dbo.fn_most_common_country() AS UDFResult;
