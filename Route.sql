USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Route]    Script Date: 11/21/2020 6:52:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Route](
	[Route_ID] [int] IDENTITY(10,5) NOT NULL,
	[DepartureAirport] [nchar](3) NOT NULL,
	[ArrivalAirport] [nchar](3) NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[Route_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_ArrAirport] FOREIGN KEY([ArrivalAirport])
REFERENCES [dbo].[Airport] ([Airport_ID])
GO

ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_ArrAirport]
GO

ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_DeptAirport] FOREIGN KEY([DepartureAirport])
REFERENCES [dbo].[Airport] ([Airport_ID])
GO

ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_DeptAirport]
GO


