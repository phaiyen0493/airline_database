USE [Airline]
GO

/****** Object:  UserDefinedFunction [dbo].[ufnGetArrivalAirport]    Script Date: 11/21/2020 7:04:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This function is used to get arrival airport information based on the route ID in the available routes list
-- =============================================
CREATE FUNCTION [dbo].[ufnGetArrivalAirport]
(
	-- Parameter is route ID
	@Route_ID nchar(5)
)
RETURNS nchar(3)
AS
BEGIN
	-- Return arrival airport value
	DECLARE @ArrivalAirport nchar(3)

	-- get arrival airport from the route table
	SELECT @ArrivalAirport = [Route].ArrivalAirport
	FROM [Route]
	WHERE [Route].Route_ID = @Route_ID
	-- Return arrival airport
	RETURN @ArrivalAirport

END
GO


