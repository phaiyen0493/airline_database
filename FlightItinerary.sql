USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[FlightItinerary]    Script Date: 11/21/2020 6:51:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FlightItinerary](
	[Flight_ID] [nchar](10) NOT NULL,
	[Itinerary_ID] [nchar](4) NOT NULL,
 CONSTRAINT [PK_FlightItinerary] PRIMARY KEY CLUSTERED 
(
	[Flight_ID] ASC,
	[Itinerary_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FlightItinerary]  WITH CHECK ADD  CONSTRAINT [FK_FlightItinerary_Flight] FOREIGN KEY([Flight_ID])
REFERENCES [dbo].[Flight] ([Flight_ID])
GO

ALTER TABLE [dbo].[FlightItinerary] CHECK CONSTRAINT [FK_FlightItinerary_Flight]
GO

ALTER TABLE [dbo].[FlightItinerary]  WITH CHECK ADD  CONSTRAINT [FK_FlightItinerary_Itinerary] FOREIGN KEY([Itinerary_ID])
REFERENCES [dbo].[Itinerary] ([Confirmation_ID])
GO

ALTER TABLE [dbo].[FlightItinerary] CHECK CONSTRAINT [FK_FlightItinerary_Itinerary]
GO


