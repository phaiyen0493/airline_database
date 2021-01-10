USE [Airline]
GO
--Name: Yen Pham
/****** Object:  Table [dbo].[Airport]    Script Date: 11/21/2020 6:47:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airport](
	[Airport_ID] [nchar](3) NOT NULL,
	[AirportName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [nvarchar](10) NOT NULL,
	[Zip] [nvarchar](10) NOT NULL,
	[Phone] [text] NULL,
	[CheckInTime] [int] NULL,
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[Airport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


