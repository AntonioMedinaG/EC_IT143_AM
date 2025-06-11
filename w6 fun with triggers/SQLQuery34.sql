/******************************************************************************
NAME: EC_IT143_6.3_fwt_s4_AM.sql
PURPOSE: Trigger to update 'LastModified' on t_w3_schools_customers table
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- --------------------------------------------------
1.0   06/10/2025 AM    Created trigger trg_UpdateLastModified
RUNTIME:

NOTES:
This trigger updates the 'LastModified' column in t_w3_schools_customers 
whenever a record is updated.
******************************************************************************/
-- Q1: How can I track when a record was last modified?
-- A1: I can use a trigger to update the 'LastModified' column automatically.

-- Step: Drop existing trigger if already created
IF OBJECT_ID('trg_UpdateLastModified', 'TR') IS NOT NULL
    DROP TRIGGER trg_UpdateLastModified;
GO

-- Step: Create the AFTER UPDATE trigger
CREATE TRIGGER trg_UpdateLastModified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastModified = GETDATE()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID; 
END;
GO

-- (Opcional) Verifica resultados
SELECT * FROM dbo.t_w3_schools_customers;









