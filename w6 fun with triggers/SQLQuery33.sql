-- Q1: How can I track when a record was last modified?
-- A1: I think I can use a trigger that updates a "LastModified" column every time a record is updated. 
-- The next step is to test if a trigger can automatically insert the current date and time when a change happens.

-- Research:
-- Based on these sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql
-- https://www.sqlservertutorial.net/sql-server-triggers/sql-server-after-update-trigger/
-- https://www.mssqltips.com/sqlservertip/3060/a-simple-sql-server-trigger-example/


