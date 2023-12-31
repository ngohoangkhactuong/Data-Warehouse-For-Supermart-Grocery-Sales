CREATE DATABASE SalesRetailDW
GO
USE [SalesRetailDW]
GO
/****** Object:  Table [dbo].[DimCategory]    Script Date: 5/13/2023 11:41:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[Category] [nvarchar](255) NULL,
	[Sub Category] [nvarchar](255) NULL,
	[CategoryKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/13/2023 11:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[Customer Name] [nvarchar](255) NULL,
	[CustomerKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/13/2023 11:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[DateKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 5/13/2023 11:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[Region] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[LocationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 5/13/2023 11:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[OrderKey] [int] PRIMARY KEY NOT NULL,
	[Order ID] [nvarchar](255) NULL,
	[Sales] [float] NULL,
	[Discount] [float] NULL,
	[Profit] [float] NULL,
	[LocationKey] [int] NOT NULL,
	[CategoryKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CategoryKey])
REFERENCES [dbo].[DimCategory] ([CategoryKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
