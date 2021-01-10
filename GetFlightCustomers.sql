USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetFlightCustomers]    Script Date: 11/22/2020 2:01:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Create date: <Create Date,,>
-- Description:	This function to get the list of customers on each flight
-- =============================================
CREATE FUNCTION [dbo].[ufnGetFlightCustomers]
(
	-- Add the parameters for the function here
	@FlightID nchar(10)
)
RETURNS 
TABLE 
AS
	RETURN 
	(SELECT Customer.Passenger_ID, Customer.FirstName, Customer.LastName, Customer.DOB, Customer.Phone, FlightItinerary.Itinerary_ID, Itinerary.BookDate
	FROM Customer, FlightItinerary, Itinerary
	WHERE Itinerary.[Status] = 'active' AND FlightItinerary.Flight_ID = @FlightID AND Itinerary.Confirmation_ID = FlightItinerary.Itinerary_ID AND Itinerary.Passenger_ID = Customer.Passenger_ID
	);
GO


