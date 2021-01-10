USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Aircraft]    Script Date: 11/21/2020 6:44:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Aircraft](
	[Aircraft_ID] [int] IDENTITY(101,100) NOT NULL,
	[Aircraft_name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Year] [int] NULL,
	[Quantity] [int] NULL,
	[FirstClassSeats] [int] NULL,
	[BusinessClassSeats] [int] NULL,
	[EconomyClassSeats] [int] NULL,
	[CountryofOrigins] [nvarchar](50) NULL,
	[FreightCapacityKg] [int] NULL,
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[Aircraft_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


