-- Name: Yen Pham
-- Description: This function is used to call the GetCustomerTransactions 

USE [Airline]
GO
SELECT *
FROM dbo.ufnGetCustomerTransactions(3)
ORDER BY BookDate asc


