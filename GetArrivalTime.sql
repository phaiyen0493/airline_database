USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetArrivalTime]    Script Date: 11/21/2020 7:05:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is used to get arrival time of the flight based on the route and the departure time
-- =============================================
CREATE FUNCTION [dbo].[ufnGetArrivalTime]
(
	-- Parameters are departime time and route id
	@DepartureTime datetime, @Route_ID nchar(5)
)
RETURNS datetime
AS
BEGIN
	-- Declare the return variable
	DECLARE @ArrivalTime datetime

	-- Arrival time = Departure time + time it takes for the route to travel
	SELECT @ArrivalTime = DATEADD(Minute, [Route].Duration, @DepartureTime)
	FROM Route
	WHERE [Route].Route_ID = @Route_ID
	-- Return arrival time
	RETURN @ArrivalTime

END
GO


