-- Step 1: Simple question - How many suppliers are in the database?
                           --How many instruments are in the database?

SELECT 
    (SELECT COUNT(*) FROM dbo.vw_Suppliers) AS TotalSuppliers,
    (SELECT COUNT(*) FROM dbo.vw_Instruments) AS TotalInstruments;

