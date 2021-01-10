USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetItineraryRoutes]    Script Date: 11/21/2020 7:03:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is used for to manage customer's itinerary routes and relevant information (which will be useful especially when customer have to transit)
-- =============================================
CREATE FUNCTION [dbo].[ufnGetItineraryRoutes]
(
	@Itinerary_ID nchar(4)
)
RETURNS 
TABLE
AS
	RETURN
	(SELECT
		Flight.BoardingTime, 
		Flight.Gate,
		Flight.[Zone], 
		Flight.DepartureTime, 
		Flight.DepartureAirport, 
		Flight.ArrivalTime, 
		Flight.ArrivalAirport, 
		Flight.FlightStatus, 
		Flight.Amenities

	FROM
		Flight, FlightItinerary
		--Join 3 tables Flight, Ititerary and Flight Itinerary
	WHERE
		FlightItinerary.Itinerary_ID = @Itinerary_ID AND FlightItinerary.Flight_ID = Flight.Flight_ID
	);
GO


