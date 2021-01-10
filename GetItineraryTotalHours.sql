USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetItineraryTotalHours]    Script Date: 11/21/2020 7:06:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is used to keep track of the total time for travel (flight time + transit time), which is useful when customer have transit
-- =============================================
CREATE FUNCTION [dbo].[ufnGetItineraryTotalHours] 
(
	-- Add the parameters for the function here
	@ItineraryID nchar(4)
)
RETURNS Time(7)
AS
BEGIN
	-- Return variable is the total hours for travelling
	DECLARE @Result Time(7), @StartTime Time, @EndTime Time

	-- Total hours = arrival time of the last flight - departure time of the first flight
	SELECT @StartTime= Min(DepartureTime) FROM dbo.ufnGetItineraryRoutes(@ItineraryID);
	SELECT @EndTime = Max(ArrivalTime) FROM dbo.ufnGetItineraryRoutes(@ItineraryID);
	SELECT @Result = DATEADD(MINUTE, DATEDIFF(Minute,@StartTime,@EndTime), '00:00');

	-- Return the result (total hours) here
	RETURN @Result

END
GO


