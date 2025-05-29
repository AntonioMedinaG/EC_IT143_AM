/*******************************************************************************************
*******************************
NAME: EC_IT143_W4.2_musicalstore_s4_AM.sql
PURPOSE: Create a view that shows suppliers and their associated instruments,
         including supplier location and instrument details.
MODIFICATION LOG:
Ver     Date        Author        Description
-----   ----------  ------------  ---------------------------------------------------------
1.0     05/28/2025  Antonio Medina     Initial creation - View for suppliers and instruments details
RUNTIME:

NOTES:
This view consolidates supplier information with the instruments they provide,
allowing easier querying for inventory and supplier analysis.
It uses LEFT JOIN to include suppliers without instruments as well.
*******************************
*******************************************************************************************/
CREATE OR ALTER VIEW dbo.vw_SuppliersInstruments AS
SELECT 
    s.supplier_id,
    s.supplier_name,
    s.city,
    s.phone,
    i.instrument_id,
    i.name AS instrument_name,
    i.type,
    i.material,
    i.price_usd
FROM dbo.vw_Suppliers s
LEFT JOIN dbo.vw_Instruments i
    ON s.instrument_id = i.instrument_id;

