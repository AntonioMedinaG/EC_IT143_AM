-- EC_IT143_W4.2_musicalstore_s3_AM.sql
-- Step 3: Ad hoc query showing instruments provided by each supplier.

SELECT 
    s.supplier_id,
    s.supplier_name,
    s.city,
    i.instrument_id,
    i.name AS instrument_name,
    i.type,
    i.price_usd
FROM dbo.vw_Suppliers s
LEFT JOIN dbo.vw_Instruments i
    ON s.instrument_id = i.instrument_id
ORDER BY s.supplier_name, i.name;
