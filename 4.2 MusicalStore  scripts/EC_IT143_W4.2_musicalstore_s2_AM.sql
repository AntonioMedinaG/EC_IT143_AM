-- Step 2: Begin creating an answer.
-- We now know the total number of suppliers and instruments in the database.
-- The next logical step is to explore details from both tables:
-- - For Suppliers: their city and phone number to understand supplier distribution.
-- - For Instruments: their name, type, material, and price to understand inventory.


-- Listing supplier details:
SELECT 
    supplier_id,
    supplier_name,
    city,
    phone
FROM dbo.vw_Suppliers;

-- Listing instrument details:
SELECT
    instrument_id,
    name,
    type,
    material,
    price_usd
FROM dbo.vw_Instruments;
