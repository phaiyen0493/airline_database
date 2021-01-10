-- Name: Yen Pham
-- Description: This function is used to get ititerary routes for each confirmation ID, so that the customer will know the routing information for their itinerary
USE [Airline]
GO
SELECT *
FROM dbo.ufnGetItineraryRoutes('BDGX')
ORDER BY DepartureTime asc
