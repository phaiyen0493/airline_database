USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnClassifyCustomer]    Script Date: 11/21/2020 7:04:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This functon is used to calculate the total ammount of customer's spending in the past 6 months and decide if they are qualified for Elite Membership
-- =============================================
CREATE FUNCTION [dbo].[ufnClassifyCustomer]
(
	-- Add the parameter for the function
	@CustomerID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable
	DECLARE @EliteClassify bit, @Total6MonthAmmount money

	-- Calculate the total customer's spending in 6 months
	SELECT @Total6MonthAmmount = SUM(Paid) from dbo.ufnGet6MonthTransactions(@CustomerID)
	-- Set condition, if customer spent over $1000 in the past 6 months, return true
	SELECT @EliteClassify = IIF(@Total6MonthAmmount >= 1000, 1, 0)
	-- Return the result of the function
	RETURN @EliteClassify

END
GO


