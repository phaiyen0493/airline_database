USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/21/2020 6:53:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ticket](
	[Ticket_ID] [nchar](4) NOT NULL,
	[Passenger_ID] [int] NOT NULL,
	[Flight_ID] [nchar](10) NULL,
	[NumberofCarryOn] [int] NOT NULL,
	[NumberofCheckedBag] [int] NOT NULL,
	[FareID] [nchar](3) NOT NULL,
	[Seat_Number] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Fare] FOREIGN KEY([FareID])
REFERENCES [dbo].[Fare] ([Fare_ID])
GO

ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Fare]
GO

ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Flight] FOREIGN KEY([Flight_ID])
REFERENCES [dbo].[Flight] ([Flight_ID])
GO

ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Flight]
GO

ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Passenger] FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Customer] ([Passenger_ID])
GO

ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Passenger]
GO


