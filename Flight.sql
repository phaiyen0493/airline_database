USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Flight]    Script Date: 11/21/2020 6:51:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Flight](
	[Flight_ID] [nchar](10) NOT NULL,
	[Route_ID] [nchar](5) NULL,
	[BoardingTime]  AS ([dbo].[ufnGetBoardingTime]([DepartureTime],[Route_ID])),
	[Gate] [nchar](3) NULL,
	[Zone] [int] NULL,
	[DepartureTime] [datetime] NULL,
	[DepartureAirport]  AS ([dbo].[ufnGetDepartureAirport]([Route_ID])),
	[ArrivalTime]  AS ([dbo].[ufnGetArrivalTime]([DepartureTime],[Route_ID])),
	[ArrivalAirport]  AS ([dbo].[ufnGetArrivalAirport]([Route_ID])),
	[Aircraft_ID] [int] NULL,
	[FlightStatus] [varchar](10) NOT NULL,
	[Amenities] [nvarchar](50) NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[Flight_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Plane] FOREIGN KEY([Aircraft_ID])
REFERENCES [dbo].[Aircraft] ([Aircraft_ID])
GO

ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Plane]
GO


