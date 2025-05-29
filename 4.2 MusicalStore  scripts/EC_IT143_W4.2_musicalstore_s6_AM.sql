/******************************************************************************************
NAME: EC_IT143_W4.2_musicalstore_s6_AM.sql
PURPOSE: Load data into the table tbl_SuppliersInstruments from the view vw_SuppliersInstruments using TRUNCATE and INSERT.
MODIFICATION LOG:
Ver     Date        Author          Description
-----   ----------  --------------  -----------------------------------------------
1.0     05/28/2025  Antonio Medina  Loaded table from view as part of Step 6
******************************************************************************************/

-- Remove all existing rows from the target table to avoid duplicates
TRUNCATE TABLE dbo.tbl_SuppliersInstruments;

-- Insert fresh data from the view into the table
INSERT INTO dbo.tbl_SuppliersInstruments (
    supplier_id, supplier_name, city, phone, 
    instrument_id, instrument_name, type, material, price_usd
)
SELECT 
    supplier_id, supplier_name, city, phone, 
    instrument_id, instrument_name, type, material, price_usd
FROM dbo.vw_SuppliersInstruments;
