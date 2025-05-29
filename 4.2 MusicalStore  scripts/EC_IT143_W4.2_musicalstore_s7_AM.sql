/******************************************************************************************
******************************
NAME: EC_IT143_W4.2_musicalstore_s7_AM.sql
PURPOSE: Stored procedure to load data from the view vw_SuppliersInstruments into the table tbl_SuppliersInstruments.
MODIFICATION LOG:
Ver     Date        Author          Description
-----   ----------  --------------  -----------------------------------------------
1.0     05/28/2025  Antonio Medina  Created stored procedure for Step 7 to automate table loading
RUNTIME:

NOTES:
This stored procedure truncates the target table and inserts fresh data from the view.
It encapsulates the Step 6 ad hoc script for reusability and security.
******************************
******************************************************************************************/

CREATE OR ALTER PROCEDURE dbo.sp_LoadSuppliersInstruments
AS
BEGIN
    SET NOCOUNT ON;

    -- Truncate the destination table to avoid duplicate data
    TRUNCATE TABLE dbo.tbl_SuppliersInstruments;

    -- Insert fresh data from the view
    INSERT INTO dbo.tbl_SuppliersInstruments (
        supplier_id, supplier_name, city, phone, 
        instrument_id, instrument_name, type, material, price_usd
    )
    SELECT 
        supplier_id, supplier_name, city, phone, 
        instrument_id, instrument_name, type, material, price_usd
    FROM dbo.vw_SuppliersInstruments;

END;
GO
