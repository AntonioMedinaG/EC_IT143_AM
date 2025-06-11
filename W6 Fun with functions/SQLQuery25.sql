--EC_IT143_6.3_fwf_s3_amg.sql--

SELECT Country, COUNT(*) AS Total_Customers
FROM t_w3_schools_customers
GROUP BY Country
ORDER BY Total_Customers DESC;
