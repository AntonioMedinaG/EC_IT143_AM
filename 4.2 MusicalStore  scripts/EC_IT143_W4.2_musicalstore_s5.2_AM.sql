/*******************************************************************************************
*******************************
NAME: EC_IT143_W4.2_musicalstore_s5.2_AM.sql
PURPOSE: Refine the dbo.tbl_SuppliersInstruments table by adding primary key, constraints and refining data types
MODIFICATION LOG:
Ver     Date        Author      Description
-----   ----------  ----------  --------------------------------------------------------------
1.0     05/28/2025  Antonio Medina        Initial refinement - Add PK and constraints
RUNTIME:

NOTES:
This script drops the existing table if needed and recreates it with a proper schema.
Adding primary key on supplier_id and instrument_id combination assuming each supplier supplies an instrument uniquely.
Modify data types as necessary.
*******************************
*******************************************************************************************/


-- Drop the table if it exists to recreate it
IF OBJECT_ID('dbo.tbl_SuppliersInstruments', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_SuppliersInstruments;
GO

-- Create the table with refined schema and an artificial primary key
CREATE TABLE dbo.tbl_SuppliersInstruments (
    ID INT IDENTITY(1,1) PRIMARY KEY,           
    supplier_id INT NOT NULL,
    supplier_name NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NULL,
    phone NVARCHAR(20) NULL,
    instrument_id INT NOT NULL,
    instrument_name NVARCHAR(100) NULL,
    type NVARCHAR(50) NULL,
    material NVARCHAR(50) NULL,
    price_usd DECIMAL(10,2) NULL
);
GO
