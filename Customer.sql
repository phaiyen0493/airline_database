USE [Airline]
GO
-- Name: Yen Pham
/****** Object:  Table [dbo].[Customer]    Script Date: 11/21/2020 6:48:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[Passenger_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [nvarchar](10) NULL,
	[Zip] [nvarchar](10) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Senior]  AS (case when datediff(year,[DOB],getdate())>=(65) then 'True' else 'False' end),
	[EliteMember]  AS ([dbo].[ufnClassifyCustomer]([Passenger_ID])),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Passenger_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


