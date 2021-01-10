USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetCustomerTransactions]    Script Date: 11/21/2020 7:03:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is to get customer's list of transactions since the beginning 
-- =============================================
CREATE FUNCTION [dbo].[ufnGetCustomerTransactions]
(
	-- Add the parameters for the function
	@Passenger_ID int
)
RETURNS 
TABLE 
AS
	-- Return transaction history that have been completed for each customer
	RETURN
	(SELECT Itinerary.Confirmation_ID, Itinerary.BookDate, Itinerary.Paid, Itinerary.Passenger_ID
	FROM Itinerary
	WHERE Itinerary.Passenger_ID = @Passenger_ID
	);
GO


