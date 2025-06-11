/******************************************************************************
NAME: EC_IT143_6.3_fwf_s6_AM.sql
PURPOSE: Start a new round with a simple question about tracking the user who modified data
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   06/10/2025 AM    Started round 2 with a new question and test
RUNTIME:

NOTES:
This script explores how to record the username of the person who last updated a record.
******************************************************************************/

-- Q1: How can I save the name of the user who last changed a record?
-- A1: I will try using the SYSTEM_USER function in a trigger to store the username.

-- Step 1: Add a new column to store the user name (if it doesn't exist)
ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedBy NVARCHAR(100) NULL;

-- Step 2: Create or update the trigger to store the user name
DROP TRIGGER IF EXISTS trg_UpdateModifiedFields;
GO

CREATE TRIGGER trg_UpdateModifiedFields
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
