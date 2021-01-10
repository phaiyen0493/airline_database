USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Itinerary]    Script Date: 11/21/2020 6:52:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Itinerary](
	[Confirmation_ID] [nchar](4) NOT NULL,
	[BookDate] [datetime] NOT NULL,
	[Paid] [money] NOT NULL,
	[Passenger_ID] [int] NOT NULL,
	[Status] [nchar](10) NULL,
	[NumberofStops]  AS ([dbo].[ufnGetStopNumber]([Confirmation_ID])),
	[TotalHours]  AS ([dbo].[ufnGetItineraryTotalHours]([Confirmation_ID])),
 CONSTRAINT [PK_Itinerary] PRIMARY KEY CLUSTERED 
(
	[Confirmation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Itinerary]  WITH CHECK ADD  CONSTRAINT [FK_Itinerary_Passenger] FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Customer] ([Passenger_ID])
GO

ALTER TABLE [dbo].[Itinerary] CHECK CONSTRAINT [FK_Itinerary_Passenger]
GO


