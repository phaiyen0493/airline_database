USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetDepartureAirport]    Script Date: 11/21/2020 7:06:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is to get departure airport based on the route ID
-- =============================================
CREATE FUNCTION [dbo].[ufnGetDepartureAirport]
(
	-- Add the Route ID parameter for the function
	@Route_ID nchar(5)
)
RETURNS nchar(3)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @DepartureAirport nchar(3)

	-- Join two table Route and table Flight based on the Route_Id, select departure airport
	SELECT @DepartureAirport = [Route].DepartureAirport
	FROM [Route]
	WHERE [Route].Route_ID = @Route_ID
	-- Return departure airport
	RETURN @DepartureAirport

END
GO


