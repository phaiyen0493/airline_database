USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetStopNumber]    Script Date: 11/21/2020 7:07:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- Name: Yen Pham
-- Description: This function is used to get the number of stops each itinerary has

CREATE FUNCTION [dbo].[ufnGetStopNumber]
(
	-- Add the confirmation ID parameter for the function here
	@ConfirmationID nchar(4)
)
RETURNS int
AS
BEGIN
	-- Declare the number of stop data type
	DECLARE @NumberofStops int

	-- Count the number of flight each itinerary has, number of stop = number of flights in an itinerary - 1
	SELECT @NumberofStops = COUNT(FlightItinerary.Itinerary_ID) - 1
	FROM FlightItinerary
	WHERE FlightItinerary.Itinerary_ID = @ConfirmationID
	-- Return the number of stop/ transit
	RETURN @NumberofStops

END
GO


