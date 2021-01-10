USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetBoardingTime]    Script Date: 11/21/2020 7:05:49 PM ******/
--Name: Yen Pham
-- Description: This function is to decide the boarding time based on input departure time and the airport
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufnGetBoardingTime]
( @DepartureTime DateTime, @RouteID nchar(5) )
RETURNS DateTime
AS
BEGIN
	-- Declare boarding time data type date time
	DECLARE @BoardingTime DateTime;
	-- Boarding time = Departure time - minimum required airport check in time
	SELECT @BoardingTime = DateAdd(Minute, (0 - Airport.CheckInTime), @DepartureTime)
		FROM  Airport, [Route]
		WHERE [Route].Route_ID = @RouteID AND Airport.Airport_ID = [Route].DepartureAirport;

	-- Return boarding time
	RETURN @BoardingTime;
	
END;
GO


