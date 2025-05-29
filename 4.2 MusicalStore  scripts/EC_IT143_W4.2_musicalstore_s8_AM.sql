/******************************************************************************************
******************************
NAME: EC_IT143_W4.2_musicalstore_s8_AM.sql
PURPOSE: Execute the stored procedure dbo.sp_LoadSuppliersInstruments to load the table tbl_SuppliersInstruments.
MODIFICATION LOG:
Ver     Date        Author          Description
-----   ----------  --------------  -----------------------------------------------
1.0     05/28/2025  Antonio Medina  Execute stored procedure for Step 8 to trigger data load
RUNTIME:

NOTES:
This script calls the stored procedure created in Step 7.
It simulates how an ETL process or user would invoke the data load.
******************************
******************************************************************************************/

EXEC dbo.sp_LoadSuppliersInstruments;
