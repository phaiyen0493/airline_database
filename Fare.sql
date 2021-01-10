USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Fare]    Script Date: 11/21/2020 6:48:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fare](
	[Fare_ID] [nchar](3) NOT NULL,
	[FareType] [nvarchar](50) NOT NULL,
	[Services] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Fare] PRIMARY KEY CLUSTERED 
(
	[Fare_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


