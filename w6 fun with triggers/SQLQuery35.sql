/******************************************************************************
NAME: EC_IT143_6.3_fwt_s5_AM.sql
PURPOSE: Test if the AFTER UPDATE trigger updates 'LastModified' correctly
MODIFICATION LOG:
Ver   Date       Author     Description
----- ---------- ---------- ---------------------------------------------
1.0   06/10/2025 AM    Created test script for UPDATE trigger
RUNTIME:

NOTES:
This script updates a record in 't_w3_schools_customers' and then checks
if the 'LastModified' column was updated as expected.
******************************************************************************/  
-- Q1: How can I confirm the trigger works?
-- A1: I will update a record and check the value of 'LastModified'.

-- Step 1: Show current value before update
SELECT TOP 1 CustomerID, CustomerName, LastModified
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;

-- Step 2: Update the customer name (ensure we do not exceed column size)
-- Assumes CustomerName has enough space, or trims to fit
UPDATE dbo.t_w3_schools_customers
SET CustomerName = 
    LEFT(CustomerName, LEN(CustomerName) - LEN(' (Updated)')) + ' (Updated)'
WHERE CustomerID = (
    SELECT TOP 1 CustomerID
    FROM dbo.t_w3_schools_customers
    ORDER BY CustomerID
);

-- Step 3: Show the same record after update
SELECT TOP 1 CustomerID, CustomerName, LastModified
FROM dbo.t_w3_schools_customers
ORDER BY CustomerID;




