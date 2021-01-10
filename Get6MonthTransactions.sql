USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGet6MonthTransactions]    Script Date: 11/21/2020 7:02:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is used to get the list of customer's transactions in the past 6 months
-- =============================================
CREATE FUNCTION [dbo].[ufnGet6MonthTransactions]
(
	-- Parameter is customer ID
	@Passenger_ID int
)
RETURNS 
TABLE 
AS
	--Return table of successful transaction paid in the past 6 months
	RETURN
	(SELECT Itinerary.Confirmation_ID, Itinerary.BookDate, Itinerary.Paid, Itinerary.Passenger_ID
	FROM Itinerary
	WHERE Itinerary.Passenger_ID = @Passenger_ID AND Itinerary.[Status] = 'active' AND Itinerary.BookDate > DATEADD(Month, -6, getdate() )
	);
GO


