/*******************************************************************************************
*******************************
NAME: EC_IT143_W4.2_musicalstore_s5.1_AM.sql
PURPOSE: Create a new table dbo.tbl_SuppliersInstruments by selecting all data from the view dbo.vw_SuppliersInstruments
MODIFICATION LOG:
Ver     Date        Author      Description
-----   ----------  ----------  --------------------------------------------------------------
1.0     05/28/2025  Antonio Medina    Initial creation - Table created from view using SELECT INTO
RUNTIME:

NOTES:
This script creates a physical table based on the virtual data from the view.
Use this when you want to persist the data snapshot for faster querying or further processing.
*******************************
*******************************************************************************************/

SELECT *
INTO dbo.tbl_SuppliersInstruments
FROM dbo.vw_SuppliersInstruments;
