USE [master]
GO
/****** Object:  Database [dbMyOnlineShopping]    Script Date: 9/11/2020 1:04:40 PM ******/
CREATE DATABASE [dbMyOnlineShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbMyOnlineShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbMyOnlineShopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbMyOnlineShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbMyOnlineShopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbMyOnlineShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbMyOnlineShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbMyOnlineShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbMyOnlineShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET RECOVERY FULL 
GO
ALTER DATABASE [dbMyOnlineShopping] SET  MULTI_USER 
GO
ALTER DATABASE [dbMyOnlineShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbMyOnlineShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbMyOnlineShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbMyOnlineShopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbMyOnlineShopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbMyOnlineShopping] SET QUERY_STORE = OFF
GO
USE [dbMyOnlineShopping]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[Password] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](500) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProductImage] [varchar](max) NULL,
	[IsFeatured] [bit] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Tbl_Prod__B40CC6CD2994B700] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[Address] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Country] [varchar](500) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [int] NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SlideImage]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SlideImage](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[SlideTitle] [varchar](500) NULL,
	[SlideImage] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 

INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1, N'Local Dish', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (2, N'Main Dish', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (3, N'Swallows', 1, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 

INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (4, N'Basmati Rice', 2, 1, 0, CAST(N'2020-08-26T19:00:40.000' AS DateTime), CAST(N'2020-08-27T19:56:35.437' AS DateTime), N'Basmati Rice.jpg', 0, 5, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (5, N'Coconut Rice and Chicken', 2, 1, 0, CAST(N'2020-08-27T07:04:01.000' AS DateTime), CAST(N'2020-08-27T21:37:59.333' AS DateTime), N'Coconot Rice and Peppered.jpg', 0, 12, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (6, N'Coconut Rice', 2, 1, 0, CAST(N'2020-09-29T00:00:00.000' AS DateTime), CAST(N'2020-08-27T20:56:07.727' AS DateTime), N'Coconut Rice.jpg', 0, 20, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (7, N'Fried Rice and Grilled Chiken', 2, 1, 0, CAST(N'2020-08-27T08:01:54.540' AS DateTime), NULL, N'Fried Rice and Grilled chickem.jpg', 0, 20, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (8, N'Banga Rice', 2, 1, NULL, CAST(N'2020-08-27T19:55:46.133' AS DateTime), NULL, N'Banga Rice.jpg', 1, 20, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (9, N'Fried Rice and Peppered Chicken', 2, 1, 0, NULL, CAST(N'2020-08-27T20:57:09.057' AS DateTime), N'Fried Rice and Peppered.jpg', 1, 30, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (10, N'Fried rice', 2, 1, NULL, CAST(N'2020-08-27T20:57:56.550' AS DateTime), NULL, N'Fried Rice.jpg', 0, 20, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (11, N'Goat meat Peppersoup', 2, 1, NULL, CAST(N'2020-08-27T20:58:25.747' AS DateTime), NULL, N'Goat meat peppersoup.jpg', 0, 23, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (12, N'Jambalaya', 2, 1, NULL, CAST(N'2020-08-27T20:58:57.877' AS DateTime), NULL, N'Jambalaya Rice.jpg', 0, 49, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (13, N'Jollof Rice and Peppered Chicken', 2, 1, NULL, CAST(N'2020-08-27T20:59:36.170' AS DateTime), NULL, N'Jollof Rice and Peppered.jpg', 0, 50, CAST(2200 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (14, N'Jollof Rice', 2, 1, NULL, CAST(N'2020-08-27T21:00:09.503' AS DateTime), NULL, N'Jollof Rice.jpg', 1, 50, CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (15, N'Ofada Rice and Sauce', 2, 1, NULL, CAST(N'2020-08-27T21:00:37.577' AS DateTime), NULL, N'Ofada-rice-and-Sauce.png', 0, 33, CAST(2200 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (16, N'Rice and Beans', 2, 1, NULL, CAST(N'2020-08-27T21:01:06.473' AS DateTime), NULL, N'Rice and Beans.jpg', 0, 60, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (17, N'Village Rice', 2, 0, NULL, CAST(N'2020-08-27T21:01:29.703' AS DateTime), NULL, N'Village Rice.jpg', 0, 30, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (18, N'Afang', 1, 1, NULL, CAST(N'2020-08-27T21:02:35.677' AS DateTime), NULL, N'Afang.jpg', 0, 40, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (19, N'Amala', 1, 1, NULL, CAST(N'2020-08-27T21:03:08.520' AS DateTime), NULL, N'Amala.png', 0, 45, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (20, N'Banga Soup', 1, 1, 0, CAST(N'2020-08-27T21:03:25.000' AS DateTime), CAST(N'2020-08-27T21:11:05.543' AS DateTime), N'Banga Soup.jpg', 0, 34, CAST(450 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (22, N'EdikaIkong', 1, 1, NULL, CAST(N'2020-08-27T21:09:14.917' AS DateTime), NULL, N'Edikaikong.jpg', 0, 34, CAST(450 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (23, N'Efo Riro', 1, 1, NULL, CAST(N'2020-08-27T21:09:48.333' AS DateTime), NULL, N'Egusi.jpg', 0, 45, CAST(920 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (24, N'Ewedu', 1, 1, NULL, CAST(N'2020-08-27T21:11:35.953' AS DateTime), NULL, N'Ewedu.png', 0, 34, CAST(290 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (25, N'Mixed Okro', 1, 0, NULL, CAST(N'2020-08-27T21:12:01.517' AS DateTime), NULL, N'Mixed-okro.jpg', 0, 23, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (26, N'Ofada Sauce', 1, 1, NULL, CAST(N'2020-08-27T21:12:37.140' AS DateTime), NULL, N'ofada-sauce.jpg', 0, 3, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (27, N'Plain Beans (Ewa)', 1, 0, NULL, CAST(N'2020-08-27T21:13:07.643' AS DateTime), NULL, N'Plain-beans.png', 0, 34, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (28, N'Pounded Yam', 1, 0, NULL, CAST(N'2020-08-27T21:13:31.373' AS DateTime), NULL, N'Pounded Yam.jpg', 0, 33, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (29, N'Sea food okro', 1, 0, NULL, CAST(N'2020-08-27T21:13:52.470' AS DateTime), NULL, N'sea-food-okro.jpg', 0, 30, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (30, N'Semo', 1, 0, NULL, CAST(N'2020-08-27T21:14:21.343' AS DateTime), NULL, N'Semo.jpg', 0, 30, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (31, N'Yam Porrige Asaro', 1, 0, NULL, CAST(N'2020-08-27T21:14:55.537' AS DateTime), NULL, N'Yam-porridge.jpg', 0, 0, CAST(2200 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (32, N'Boiled Yam', 2, 0, 0, CAST(N'2020-08-28T09:09:11.000' AS DateTime), CAST(N'2020-08-28T09:10:33.227' AS DateTime), N'Boiled Yam and Egg.jpg', 0, 20, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (33, N'CrayFish', 1, 1, NULL, CAST(N'2020-08-30T15:30:55.030' AS DateTime), NULL, N'Fried TiTus.jpg', 1, 20, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price]) VALUES (34, N'Pap', 2, 1, 0, CAST(N'2020-09-02T04:10:55.000' AS DateTime), CAST(N'2020-09-02T04:11:44.987' AS DateTime), N'Pap.jpg', 1, 46, CAST(784 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Cate__8517B2E005001CFD]    Script Date: 9/11/2020 1:04:40 PM ******/
ALTER TABLE [dbo].[Tbl_Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7449F39994E8F5D1]    Script Date: 9/11/2020 1:04:40 PM ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7ED91ACE4CFC94C8]    Script Date: 9/11/2020 1:04:40 PM ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Prod__DD5A978A8BD929B6]    Script Date: 9/11/2020 1:04:40 PM ******/
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [UQ__Tbl_Prod__DD5A978A8BD929B6] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Role__8A2B616030F5E01C]    Script Date: 9/11/2020 1:04:40 PM ******/
ALTER TABLE [dbo].[Tbl_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Cart__CartSt__36B12243] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_Cart] CHECK CONSTRAINT [FK__Tbl_Cart__CartSt__36B12243]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Produ__Quant__286302EC] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK__Tbl_Produ__Quant__286302EC]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
/****** Object:  StoredProcedure [dbo].[GetBySearch]    Script Date: 9/11/2020 1:04:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBySearch]
	@search nvarchar(max)=null 
AS
BEGIN

	SELECT *from [dbo].[Tbl_Product] P
	left join [dbo].[Tbl_Category] C on p.CategoryId = c.CategoryId
	where
	P.ProductName LIKE CASE WHEN @search is not null then '%'+@search+'%' else P.ProductName end
	OR
	C.CategoryName LIKE CASE WHEN @search is not null then '%'+@search+'%' else C.CategoryName end
END
GO
USE [master]
GO
ALTER DATABASE [dbMyOnlineShopping] SET  READ_WRITE 
GO
