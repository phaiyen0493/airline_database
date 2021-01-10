--Name: Yen Pham
--Description: This function is just used to call the Get6MonthTransaction function seperately
USE [Airline]
GO
SELECT *
FROM dbo.ufnGet6MonthTransactions(5)
ORDER BY BookDate asc

