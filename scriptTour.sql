USE [master]
GO
/****** Object:  Database [QLTour]    Script Date: 03-11-2025 9:27:32 AM ******/
CREATE DATABASE [QLTour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTour', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLTour.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTour_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLTour_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLTour] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTour] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTour] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTour] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTour] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTour] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTour] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTour] SET  MULTI_USER 
GO
ALTER DATABASE [QLTour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTour] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTour] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTour] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTour', N'ON'
GO
ALTER DATABASE [QLTour] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLTour] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLTour]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[tour_id] [int] NULL,
	[total] [decimal](18, 2) NOT NULL,
	[booking_date] [datetime] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[subject] [nvarchar](200) NULL,
	[message] [nvarchar](200) NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailItinerary]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailItinerary](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ItineraryId] [int] NULL,
	[ThoiGian] [time](7) NULL,
	[HoatDong] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK__DetailIt__135C316DD49D7EE9] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[hotel_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerary]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerary](
	[ItineraryId] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[Ngay] [date] NULL,
	[ChiTietLichTrinh] [nvarchar](max) NULL,
 CONSTRAINT [PK__Itinerar__361216C6C8B33D29] PRIMARY KEY CLUSTERED 
(
	[ItineraryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItineraryImages]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItineraryImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ItineraryId] [int] NOT NULL,
	[ImagePath] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manage]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manage](
	[id_Mng] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](250) NOT NULL,
	[role] [bit] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manage] PRIMARY KEY CLUSTERED 
(
	[id_Mng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[Discount] [decimal](6, 3) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[tour_id] [int] NULL,
	[rating] [int] NULL,
	[review_text] [nvarchar](max) NULL,
 CONSTRAINT [PK__Reviews__60883D901486A816] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourDetails]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourDetails](
	[tour_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[vehicle_id] [int] NULL,
	[hotel_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[tour_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](18, 2) NOT NULL,
	[category_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 03-11-2025 9:27:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (8, 4, 6, CAST(150.00 AS Decimal(18, 2)), CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (27, 4, 5, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-11-16T00:00:00.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (30, 4, 6, CAST(150.00 AS Decimal(18, 2)), CAST(N'2024-11-16T00:00:00.000' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (31, 7, 5, CAST(150.00 AS Decimal(18, 2)), CAST(N'2024-11-26T00:00:00.000' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (32, 7, 5, CAST(150.00 AS Decimal(18, 2)), CAST(N'2024-11-26T00:00:00.000' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (42, 7, 6, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-12-04T21:09:34.097' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (65, 7, 5, CAST(30000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T00:00:00.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (66, 7, 5, CAST(15000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T20:58:08.943' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (68, 7, 5, CAST(30000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:02:42.450' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (69, 7, 5, CAST(75000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:02:48.060' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (70, 7, 5, CAST(45000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:02:53.450' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (71, 7, 6, CAST(151.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:03:59.967' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (72, 7, 5, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:21:11.660' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (73, 7, 5, CAST(3000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:21:16.990' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (74, 7, 6, CAST(75.50 AS Decimal(18, 2)), CAST(N'2023-12-06T21:21:35.990' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (75, 7, 5, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:22:49.863' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (76, 7, 5, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:23:51.853' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (77, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:33:35.747' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (78, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (80, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:38:23.290' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (81, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:38:33.150' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (82, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:41:50.593' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (83, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T21:54:03.090' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (84, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:00:00.377' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (85, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:05:43.157' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (86, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:07:33.073' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (87, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:11:06.190' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (88, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:13:18.937' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (89, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:15:51.663' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (90, 7, 5, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2023-12-06T22:19:10.153' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (91, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-03-01T00:00:00.000' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (92, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T01:15:22.543' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (93, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T01:40:31.427' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (94, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T01:43:27.157' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (95, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T20:28:09.253' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (96, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T20:33:56.733' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (97, 7, 5, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T20:50:23.700' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (98, 7, 5, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T20:52:57.267' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (99, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T20:55:20.130' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (100, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T21:06:01.890' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (101, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2023-12-07T21:26:10.833' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (102, 7, 6, CAST(75.50 AS Decimal(18, 2)), CAST(N'2023-12-08T15:42:38.667' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (103, 7, 7, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-05-27T15:07:19.883' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (104, 7, 7, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-05-27T15:07:48.970' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (105, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-03-27T00:00:00.000' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (106, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-04-27T00:00:00.000' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (108, 7, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-05-27T15:30:21.300' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (109, 11, 6, CAST(75.50 AS Decimal(18, 2)), CAST(N'2024-08-12T13:41:48.417' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (110, 11, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-08-17T22:05:07.770' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (111, 11, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-08-17T22:06:18.287' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (113, 18, 8, CAST(200000000.00 AS Decimal(18, 2)), CAST(N'2024-11-09T15:36:21.393' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (114, 18, 8, CAST(60000000.00 AS Decimal(18, 2)), CAST(N'2024-11-09T15:36:45.647' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (115, 18, 8, CAST(60000000.00 AS Decimal(18, 2)), CAST(N'2024-11-09T15:36:58.667' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (116, 18, 8, CAST(60000000.00 AS Decimal(18, 2)), CAST(N'2024-11-09T15:37:30.140' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (117, 18, 5, CAST(10000000.00 AS Decimal(18, 2)), CAST(N'2024-11-09T15:39:51.607' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (118, 6, 6, CAST(75.50 AS Decimal(18, 2)), CAST(N'2024-11-09T23:38:50.863' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (119, 6, 6, CAST(75.50 AS Decimal(18, 2)), CAST(N'2024-11-10T10:53:48.063' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (120, 6, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-10T11:30:39.653' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (121, 6, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-11T21:13:28.337' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (122, 18, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-13T08:22:39.923' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (123, 20, 5, CAST(10000000.00 AS Decimal(18, 2)), CAST(N'2024-11-13T22:18:21.673' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (124, 20, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-13T22:21:46.530' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (125, 18, 5, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:05:54.307' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (126, 20, 6, CAST(6300000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:10:29.390' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (127, 20, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:11:13.763' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (128, 20, 5, CAST(900000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:11:31.717' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (129, 18, 5, CAST(900000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:23:45.073' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (130, 18, 6, CAST(6300000.00 AS Decimal(18, 2)), CAST(N'2024-11-19T23:34:49.647' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (131, 6, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-20T09:06:31.707' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (132, 6, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-20T09:24:14.253' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (133, 6, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-20T10:19:42.480' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (134, 21, 5, CAST(900000.00 AS Decimal(18, 2)), CAST(N'2024-11-20T10:28:59.087' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (135, 20, 8, CAST(18000000.00 AS Decimal(18, 2)), CAST(N'2024-11-20T21:47:47.783' AS DateTime), N'Giao dịch bị hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (136, 18, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-11-21T23:46:56.990' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (137, 18, 5, CAST(900000.00 AS Decimal(18, 2)), CAST(N'2024-11-21T23:47:12.437' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (138, 19, 6, CAST(24500000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T12:45:20.573' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (139, 19, 6, CAST(70000000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T12:47:14.040' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (140, 19, 6, CAST(70000000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T13:55:23.440' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (141, 19, 6, CAST(9800000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T14:02:32.443' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (142, 19, 6, CAST(6230000.00 AS Decimal(18, 2)), CAST(N'2024-12-01T22:11:43.157' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (144, 19, 12, CAST(6000000.00 AS Decimal(18, 2)), CAST(N'2024-12-07T18:14:02.053' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (145, 19, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T17:16:30.627' AS DateTime), N'Đã hủy')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (146, 19, 5, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T17:21:47.450' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (147, 18, 5, CAST(890000.00 AS Decimal(18, 2)), CAST(N'2024-12-10T17:54:59.443' AS DateTime), N'Đã thanh toán')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (148, 24, 12, CAST(6000000.00 AS Decimal(18, 2)), CAST(N'2025-03-11T08:49:27.747' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (149, 24, 12, CAST(6000000.00 AS Decimal(18, 2)), CAST(N'2025-03-11T08:49:43.493' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (151, 24, 7, CAST(200.00 AS Decimal(18, 2)), CAST(N'2025-03-11T09:00:54.857' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (152, 24, 7, CAST(178.00 AS Decimal(18, 2)), CAST(N'2025-03-11T09:25:28.610' AS DateTime), N'Đang xác nhận')
INSERT [dbo].[Bookings] ([booking_id], [user_id], [tour_id], [total], [booking_date], [status]) VALUES (153, 24, 7, CAST(178.00 AS Decimal(18, 2)), CAST(N'2025-03-11T09:26:01.723' AS DateTime), N'Đang xác nhận')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (4, N'Trong nước', N'du lịch các chuyến du lịch trong nước rất vui')
INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (5, N'Quốc tế', N'trải nghiệm các chuyến du lịch tuyệt vời')
INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (6, N'Văn hóa', N'trải nghiệm các văn hóa lịch sữ  Việt Nam')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [username], [email], [subject], [message], [status]) VALUES (9, N'Quốc Thắng', N'voquocthang105@gmail.com', N'dịch vụ', N'Nhân viên thân thiện rất nhiệt tình', N'Đã xem')
INSERT [dbo].[Contact] ([contact_id], [username], [email], [subject], [message], [status]) VALUES (10, N'Hữu Thành', N'thanhdarrk@gmai.com', N'thái độ', N'Nhân viên thái độ tốt', N'Chưa xem')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailItinerary] ON 

INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1012, 1, CAST(N'09:30:00' AS Time), N'Bản Tả Van', N'Địa chỉ: xã Tả Van, Sapa, Lào Cai Từ khi dân mê du lịch đua nhau xuống bản, Tả Van cũng trở thành điểm check-in nổi tiếng hơn của thị trấn Sapa. Xuôi theo thác Bạc qua Mường Hoa, ta sẽ đến được với Tả Van. Nếu Mường Hoa vẫn còn vương vấn nét dịu dàng của hoa dại, Tả Van lại thể hiện rõ hơn sự kỳ bí của núi rừng Tây Bắc, vẻ đẹp du mục và những tục huyền của dân tộc Giáy, Dao Đỏ,... Không có một địa điểm “đinh" nào, mỗi tấc đất tại Tả Van đều tuyệt vời để khám phá và “sống ảo". Bạn có thể trèo lên một ngọn đồi gần homestay đang ở, ngắm ruộng bậc thang vàng rực trong nắng chiều, hoặc theo các em bé ra đồng chăn trâu vào sáng sớm,...')
INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1013, 1, CAST(N'12:30:00' AS Time), N'Cầu kính Rồng Mây', N'Địa chỉ: đèo Ô Quy Hồ, Sapa, Lào Cai - Lai Châu Một địa chỉ mới mẻ để ngắm trọn “tứ đại đỉnh đèo" của Tây Bắc là cầu kính Rồng Mây thuộc địa phận đèo Ô Quy Hồ - con đèo “tử thần" trứ danh xinh đẹp. Đây cũng là cây cầu kính dài nhất Đông Nam Á với sức chứa hàng trăm người cùng lúc. Không hề thua kém những cây cầu kính xứ Trung, cầu kính Rồng Mây sẽ mang đến cho tín đồ vi vu trải nghiệm “tim đập chân run" thực thụ. Để đến được cây cầu này, bạn chỉ cần đến đèo Ô Quy Hồ, mua vé và thang máy sẽ đưa bạn tiếp cận cầu kính Rồng Mây. Dưới tấm kính chịu lực cao cấp, toàn bộ thung lũng hoang dại bên dưới khe núi Ô Quy Hồ hiện ra rõ ràng, phô bày vẻ đẹp choáng ngợp của nó cũng như cảm giác mạo hiểm cực độ cho du khách.')
INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1014, 1, CAST(N'15:30:00' AS Time), N'Bản Sín Chải', N'Địa chỉ: xã San Sả Hồ nay là xã Hoàng Liên, Sapa, Lào Cai Ngoài Tả Van, Sín Chải cũng là một trong các điểm du lịch Sapa lý tưởng để cảm nhận sự bình yên, hoang sơ của miền Tây Bắc. Từ xa xưa, bản làng này đã là nơi chôn nhau cắt rốn của tộc người Mông Đen, một dân tộc thiểu số với nhiều phong tục độc đáo. Đến Sín Chải, ta chẳng cần đi đâu để tìm kiếm một tấm ảnh đẹp. Ngôi làng này được bao quanh bởi các ngọn núi chọc trời, mây mù lảng vảng cùng các cánh đồng lúa tuyệt đẹp - đủ để bạn check-in mà không phải canh góc chụp “né" người khác.')
INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1015, 2, CAST(N'09:30:00' AS Time), N' Quảng trường Lâm Viên', N'•	Địa chỉ: Đường Trần Quốc Toản, TP. Đà Lạt (gần hồ Xuân Hương) Nếu chưa có dự định đến Đà Lạt đi đâu xa, bạn có thể tới quảng trường Lâm Viên để tham quan và check in. Nơi đây có tổng diện tích hơn 72.000m2, gồm nhà hát, công viên, khu triển lãm, khu thương mại… Nổi bật là cung biểu diễn nghệ thuật hình đoá hoa dã quỳ bằng kính màu và khối nụ hoa atiso khổng lồ.')
INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1016, 2, CAST(N'12:30:00' AS Time), N'Nhà thờ Domaine De Marie Đà Lạt', N'Khi những bức hình check in với công trình màu hồng đất viral, không ít người băn khoăn đến Đà Lạt đi đâu để chụp được như vậy. Theo bản đồ Đà Lạt, nhà thờ Domaine de Marie nằm trên tuyến đường du lịch từ trung tâm thành phố đến đi núi LangBiang. Tòa nhà nổi bật với màu vôi hồng đậm giữa hoa hải tiên thơ mộng, tạo nên background “sống ảo” thú vị')
INSERT [dbo].[DetailItinerary] ([DetailId], [ItineraryId], [ThoiGian], [HoatDong], [MoTa]) VALUES (1017, 2, CAST(N'15:30:00' AS Time), N'Thác Prenn Đà Lạt', N'•	Địa chỉ: Số 20, đường cao tốc Liên Khương – Prenn, P. 3, TP. Đà Lạt Thác Prenn Đà Lạt là điểm đến lý tưởng cho những ai băn khoăn khi đến Đà Lạt đi đâu để tổ chức dã ngoại. Tới đây, bạn còn có thể thả bộ theo lối đi dưới thác, đi cáp treo hay thử sức bắn cung, bơi thuyền và cưỡi đà điểu trong khu du lịch    Đà Lạt là một thành phố trực thuộc tỉnh và tỉnh lị tỉnh Lâm Đồng, nằm trên cao nguyên Lâm Viên, ở độ cao 1.500 m so với mặt nước biển và diện tích tự nhiên: 393,29 km². Với nhiều cảnh quan đẹp, Đà Lạt là một trong những thành phố du lịch nổi tiếng nhất của Việt Nam. Trong thời Pháp thuộc, tên tiếng Latin Dat Aliis Laetitiam Aliis Temperiem có nghĩa là “cho những người này niềm vui, cho những người khác sự mát mẻ”. Đà Lạt được mệnh danh là : thành phố hoa, thành phố tình yêu, thành phố mùa xuân, thành phố sương mù.')
SET IDENTITY_INSERT [dbo].[DetailItinerary] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [description], [address]) VALUES (1, N'Hoa Hồng', N'Xịn', N'1/1/1 Da Lat')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [description], [address]) VALUES (2, N'LoveYou', N'Tận hưởng khoảng thời gian vui vẻ hạnh phúc', N'Đà Lạt Thơ Mộng')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [description], [address]) VALUES (3, N'Khách sạn 5 sao', N'Tiện ích 5 sao,dịch vụ 10 sao', N'quảng ninh city')
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Itinerary] ON 

INSERT [dbo].[Itinerary] ([ItineraryId], [tour_id], [Ngay], [ChiTietLichTrinh]) VALUES (1, 15, CAST(N'2024-12-08' AS Date), N'Sa Pa là một điểm du lịch cách trung tâm thành phố Lào Cai khoảng hơn 30 km. Nằm ở độ cao trung bình 1500 - 1800 m so với mặt nước biển, Thị Trấn Sapa luôn chìm trong làn mây huyền ảo, tạo nên một bức tranh phong cảnh đẹp đến kỳ lạ. Nơi đây, có thứ tài nguyên vô giá đó là khí hậu quanh năm trong lành ôn hòa, với nhiệt độ trung bình 15-18°C.')
INSERT [dbo].[Itinerary] ([ItineraryId], [tour_id], [Ngay], [ChiTietLichTrinh]) VALUES (2, 5, CAST(N'2023-11-16' AS Date), N'Với nhiều cảnh đẹp tự nhiên và văn hóa, con người, đặc sản độc đáo, Đà Lạt không chỉ là 1 điểm đến du lịch hấp dẫn mà còn là một nơi để bạn thả mình, thư giãn và tìm lại sự cân bằng trong cuộc sống. Hãy gạt bỏ những áp lực hàng ngày và đặt chân đến Đà Lạt và tận hưởng những trải nghiệm tuyệt vời nơi “thành phố mù sương”.')
SET IDENTITY_INSERT [dbo].[Itinerary] OFF
GO
SET IDENTITY_INSERT [dbo].[ItineraryImages] ON 

INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (1, 1, N'/itinerary-images/sapa1.png')
INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (2, 1, N'/itinerary-images/sapa2.png')
INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (3, 1, N'/itinerary-images/sapa3.png')
INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (4, 2, N'/images/itinerary/dalat1.png')
INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (5, 2, N'/images/itinerary/dalat2.png')
INSERT [dbo].[ItineraryImages] ([ImageId], [ItineraryId], [ImagePath]) VALUES (6, 2, N'/images/itinerary/dalat3.png')
SET IDENTITY_INSERT [dbo].[ItineraryImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Manage] ON 

INSERT [dbo].[Manage] ([id_Mng], [Username], [password], [role], [status]) VALUES (1, N'QuocThang', N'$2a$11$hZ0eRMUY8gyUILTg.K/WoeIi1xEcDciM/dtSr.8E0hePkHGA/MYHe', 1, N'Unlocked')
INSERT [dbo].[Manage] ([id_Mng], [Username], [password], [role], [status]) VALUES (3, N'thang2003', N'$2a$11$T.1hrrmqUPImqEIdOOn7B.ABqCpo0ZU8wMsQchDx5d3QiZPLW//yS', 0, N'Unlocked')
INSERT [dbo].[Manage] ([id_Mng], [Username], [password], [role], [status]) VALUES (4, N'Thang2003', N'$2a$11$UU3Uquqxrx0AQDcpHK2te.RmwFsogiHkLXQWBKPte.bSuJob.ogcK', 0, N'Unlocked')
INSERT [dbo].[Manage] ([id_Mng], [Username], [password], [role], [status]) VALUES (5, N'thanhdark', N'$2a$11$1SAPFxDMi50pKEzfR7i6IuGaGe1Ct3lWx4lkUWLGNUu/mw1AMh6Q6', 0, N'Locked')
INSERT [dbo].[Manage] ([id_Mng], [Username], [password], [role], [status]) VALUES (6, N'luffy', N'$2a$11$hZ0eRMUY8gyUILTg.K/WoeIi1xEcDciM/dtSr.8E0hePkHGA/MYHe', 0, N'Locked')
SET IDENTITY_INSERT [dbo].[Manage] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (1, N'hello', CAST(11.000 AS Decimal(6, 3)), CAST(N'2025-03-11T00:00:00.000' AS DateTime), CAST(N'2025-03-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (2, N'20/11', CAST(21.000 AS Decimal(6, 3)), CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(N'2024-12-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (4, N'black friday', CAST(30.000 AS Decimal(6, 3)), CAST(N'2024-11-25T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (5, N'sale sập sàng', CAST(22.000 AS Decimal(6, 3)), CAST(N'2024-11-27T00:00:00.000' AS DateTime), CAST(N'2024-12-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (6, N'sale max', CAST(35.000 AS Decimal(6, 3)), CAST(N'2024-11-25T00:00:00.000' AS DateTime), CAST(N'2024-11-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Promotions] ([PromotionId], [Code], [Discount], [StartDate], [EndDate], [IsActive]) VALUES (7, N'sale cuối tháng', CAST(15.000 AS Decimal(6, 3)), CAST(N'2024-11-27T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (1, 4, 5, 5, N'yeah')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (2, 5, 6, 4, N'nice')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (3, 6, 7, 5, N'good')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (4, 7, NULL, 1, N'5')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (5, 7, NULL, 1, N'a')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (6, 7, NULL, 99, N'ffgf')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (7, 7, NULL, 99, N'fgth')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (8, 7, 5, 1, N'nice')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (9, 7, 5, 3, N'qư')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (10, 7, 5, 1, N'ưewe')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (11, 7, 5, 4, N'ewe')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (12, 7, 6, 5, N'a')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (13, 7, 6, 4, N'awaw')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (14, 7, 5, 0, N'kk')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (15, 7, 5, 5, N'kk')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (16, 6, 5, 5, N'ok')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (17, 19, 6, 5, N'chất lượng dịch vụ 5 sao')
INSERT [dbo].[Reviews] ([review_id], [user_id], [tour_id], [rating], [review_text]) VALUES (1017, 18, 5, 4, N'dịch vụ chuyên nghiệp')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[TourDetails] ON 

INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (2, 7, 2, 1)
INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (3, 6, 1, 1)
INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (5, 8, 1, 2)
INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (6, 5, 2, 2)
INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (7, 12, 3, 3)
INSERT [dbo].[TourDetails] ([tour_detail_id], [tour_id], [vehicle_id], [hotel_id]) VALUES (8, 11, 3, 3)
SET IDENTITY_INSERT [dbo].[TourDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (5, N'Đà Lạt', N'Đà Lạt, thành phố ngàn hoa, là điểm đến lý tưởng cho những ai muốn hòa mình vào vẻ đẹp thiên nhiên và không khí trong lành. Với khí hậu mát mẻ quanh năm, Đà Lạt hấp dẫn du khách bằng những cánh đồng hoa rực rỡ, những con đường uốn lượn quanh co và những thác nước hùng vĩ. Chuyến du lịch đến Đà Lạt sẽ đưa bạn qua những điểm đến nổi tiếng như hồ Xuân Hương, thung lũng Tình Yêu, và chợ Đà Lạt đầy màu sắc. Bạn sẽ có cơ hội thưởng thức những món ăn đặc sản như bánh tráng nướng, dâu tây tươi ngon và các loại mứt đặc trưng. Đà Lạt không chỉ là nơi để khám phá mà còn là nơi để tận hưởng sự bình yên, thư giãn và tìm lại sự cân bằng trong cuộc sống.', CAST(1000000.00 AS Decimal(18, 2)), 4, 20, CAST(N'2025-12-03T00:00:00.000' AS DateTime), CAST(N'2025-03-17T00:00:00.000' AS DateTime), N'/tours/dl.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (6, N'Nha Trang', N'Nha Trang, thành phố biển xinh đẹp, là điểm đến không thể bỏ qua cho những ai yêu thích biển xanh, cát trắng và nắng vàng. Với bờ biển dài và các hòn đảo tuyệt đẹp, Nha Trang hấp dẫn du khách bởi vẻ đẹp hoang sơ và khí hậu ấm áp quanh năm. Chuyến du lịch đến Nha Trang sẽ đưa bạn qua những địa danh nổi tiếng như Vinpearl Land, Tháp Bà Ponagar, và Đảo Hòn Mun. Bạn sẽ có cơ hội tham gia các hoạt động thú vị như lặn biển ngắm san hô, tham quan viện Hải Dương Học và thưởng thức hải sản tươi ngon. Nha Trang không chỉ là nơi để khám phá mà còn là nơi để tận hưởng những giây phút thư giãn, hòa mình vào thiên nhiên và tận hưởng cuộc sống yên bình bên biển cả.', CAST(7000000.00 AS Decimal(18, 2)), 4, 15, CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-03T00:00:00.000' AS DateTime), N'/tours/nha trang.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (7, N'Hội An', N'Hội An, thành phố cổ kính và quyến rũ, là điểm đến lý tưởng cho những ai muốn tìm về vẻ đẹp xưa cũ và khám phá văn hóa truyền thống của Việt Nam. Với những con phố nhỏ lát gạch, những ngôi nhà cổ kính và những chiếc đèn lồng lung linh, Hội An mang đến cho du khách cảm giác như lạc vào một thế giới cổ tích. Chuyến du lịch đến Hội An sẽ đưa bạn qua những điểm đến nổi tiếng như Chùa Cầu Nhật Bản, Nhà cổ Tấn Ký và Bảo tàng Gốm sứ Mậu Dịch. Bạn sẽ có cơ hội thưởng thức những món ăn đặc sản như cao lầu, mì Quảng và bánh bao bánh vạc. Hội An không chỉ là nơi để khám phá lịch sử và văn hóa mà còn là nơi để tận hưởng những khoảnh khắc yên bình, ngắm nhìn hoàng hôn bên dòng sông Hoài thơ mộng và thư giãn trong không gian thanh bình của phố cổ.', CAST(200.00 AS Decimal(18, 2)), 4, 10, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'/tours/ha.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (8, N'Huế', N'Huế là thành phố tỉnh lỵ của tỉnh Thừa Thiên Huế, Việt Nam. Huế từng là kinh đô của Việt Nam dưới triều Tây Sơn và triều Nguyễn. Hiện nay, thành phố là một trong những trung tâm về văn hóa – du lịch, y tế chuyên sâu, giáo dục đào tạo, khoa học công nghệ của Miền Trung - Tây Nguyên và cả nước', CAST(20000000.00 AS Decimal(18, 2)), 6, 10, CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(N'2024-11-07T00:00:00.000' AS DateTime), N'/tours/huế.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (11, N'Đà Nẵng', N'Nhắc đến Đà Nẵng nhiều người sẽ thường nghĩ ngay đến “thành phố đáng sống nhất Việt Nam” nhờ cảnh sắc, khí hậu ôn hòa, rất thích hợp để nghỉ dưỡng. Chính bởi vậy, du lịch Đà Nẵng luôn là sự lựa chọn hàng đầu của rất nhiều du khách đến để khám phá vùng đất này.  Đà Nẵng có vị trí cách TP.HCM khoảng 961 km về phía Nam và tiếp giáp với cố đô Huế. Không chỉ là địa điểm du lịch nổi tiếng, Đà Nẵng còn là trục giao thông Bắc – Nam, là cửa ngõ quan trọng lưu thông tới các tỉnh Bắc - Nam và miền Trung. ', CAST(4500000.00 AS Decimal(18, 2)), 5, 15, CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(N'2024-11-20T00:00:00.000' AS DateTime), N'/tours/đà nẵng.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (12, N'Quảng Ninh', N'Quảng Ninh thuộc vùng Đông Bắc Việt Nam. Nơi đây hấp dẫn bởi vẻ đẹp kỳ thú của núi non, sông nước và biển đảo. Nổi bật hơn cả chính là vịnh Hạ Long - Di sản thiên nhiên thế giới được UNESCO công nhận. Đến với Hạ Long, du khách sẽ có cơ hội chiêm ngưỡng bức tranh non nước vô cùng ngoạn mục được tạo thành bởi 1.900 hòn đá vôi khác nhau cùng nhiều hang động kỳ bí.

Chưa dừng lại ở đó, Quảng Ninh còn là mảnh đất sở hữu 2 công viên giải trí lớn nhất khu vực Đông Nam Á là Typhoon Water Park và Dragon Park. Tại hai công viên này, có rất nhiều những trải nghiệm thú vị đang chờ đợi du khách như tàu lượn siêu tốc 1,1km dài nhất Châu Á và hơn 12 trò chơi dưới nước dành cho mọi lứa tuổi.', CAST(6000000.00 AS Decimal(18, 2)), 4, 20, CAST(N'2024-11-24T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), N'/tours/quảng ninh.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (14, N'Hà Nội', N'Hà Nội có lịch sử lâu đời cùng văn hóa truyền thống đậm đà bản sắc của dân tộc Việt Nam, là địa điểm du lịch vô cùng quyến rũ. Mảnh đất Thủ đô là nơi có nhiều di tích nhất tại Việt Nam, với 3840 di tích và 1164 di tích cấp quốc gia. Hà Nội còn sở hữu rất nhiều “danh hiệu UNESCO” như: ca trù, tín ngưỡng thờ Mẫu, bia tiến sĩ Văn Miếu Thăng Long, kéo co… Đặc biệt, thành phố Hà Nội nằm trong trọng tâm của tam giác du lịch nổi tiếng Ninh Bình - Quảng Ninh - Lào Cai. Tại Hà Nội, bạn có thể dễ dàng di chuyển đến rất nhiều địa phương khác. Du lịch Hà Nội có đa dạng hình thức, điểm đến và hoạt động như: du lịch tâm linh - lịch sử; du lịch nghỉ dưỡng; du lịch hội thảo, MICE; du lịch văn hóa, lễ hội, từ đó mang đến nhiều trải nghiệm thú vị cho du khách. Đến Thủ đô, bạn sẽ được khám phá nhiều địa danh nổi tiếng như: Lăng Chủ tịch Hồ Chí Minh, Văn Miếu - Quốc Tử Giám cùng với đó là trải nghiệm nhiều lễ hội văn hóa đặc sắc như: hội chùa Hương, hội Chèm... Với lịch sử “nghìn năm văn hiến”, Thủ đô luôn thu hút khách du lịch trong và ngoài nước với màu sắc đặc trưng, với nét văn hóa đậm đà bản sắc cùng một lối sống riêng không thể lẫn với bất kỳ nơi nào khác.', CAST(50000000.00 AS Decimal(18, 2)), 6, 32, CAST(N'2024-11-25T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), N'/tours/hà nội.jpg')
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [price], [category_id], [quantity], [start_date], [end_date], [img]) VALUES (15, N'Sapa', N'Hiếm có một chuyến đi nào về Tây Bắc mà người ta có thể bỏ qua Sapa. Thành thị nằm giữa muôn trùng mây núi này vẫn giữ được nhiều công trình tuyệt đẹp, không thinh lặng mát mả và các bản làng dân tộc độc đáo dù người ta có nói, à, Sapa đã “đô thị hoá" quá rồi. Vậy, nếu bạn cũng là một người yêu mến chốn này hoặc, chỉ muốn tham quan các địa điểm du lịch Sapa, hãy theo dõi bài viết dưới đây để tìm được nơi “sống ảo" tuyệt nhất trong hàng dặm phố núi này nhé!', CAST(30000000.00 AS Decimal(18, 2)), 4, 20, CAST(N'2024-12-08T00:00:00.000' AS DateTime), CAST(N'2024-12-10T00:00:00.000' AS DateTime), N'/tours/sapa.jpg')
SET IDENTITY_INSERT [dbo].[Tours] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (4, N'john_doe', N'123', N'a', N'1234567890', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (5, N'admin_user', N'1', N'admin@gmail.com', N'0987654321', CAST(N'1999-02-09' AS Date), N'Tây Ninh
')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (6, N'thanh2003', N'1234', N'e@gmail.com', N'0909392917', CAST(N'2003-09-09' AS Date), N'3/2 Đà Lạt')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (7, N'a', N'1', N'haitran9969@gmail.com', N'0101', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (11, N'Đen Vâu', N'1', N'khach@gmail.com', N'0909382917', CAST(N'2000-02-01' AS Date), N'thành phố huế')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (13, N'nqt1998tez', N'123456', N'admin12@gmail.com', N'0909382919', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (18, N'8052_Võ Quốc Thắng', N'GoogleLogin', N'voquocthang107@gmail.com', N'0123456789', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (19, N'thang2003', N'$2a$11$khdsOrPBak.ZFOmEam39peKXJ7PmEMf8VqDRIxgURZplM.Eap7Vdm', N'voquocthang105@gmail.com', N'0988672892', CAST(N'2000-01-14' AS Date), N'hahahaha')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (20, N'lam vo', N'GoogleLogin', N'quocthang20031@gmail.com', N'0123456789', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (21, N'thắng', N'123', N'voquocthang103@gmail.com', N'0909382999', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (22, N'Quốc Thắng', N'$2a$11$GmQcVV2kkU7Fli6HKPeGJ.cVdFLASR96BJkc3InIu8gM6hed9p.7y', N'voquocthang102@gmail.com', N'0988672892', CAST(N'2003-02-11' AS Date), N'nhà bè quận 7')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (23, N'tống hữu lượng', N'$2a$11$i/RRwBqfrawZUQskKKby8eIR2WGdFZ1UI1JNxKeYWM.ls50B1Diq.', N'huuluong@gmail.com', N'0377787792', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [DateOfBirth], [Address]) VALUES (24, N'abc', N'$2a$11$hZ0eRMUY8gyUILTg.K/WoeIi1xEcDciM/dtSr.8E0hePkHGA/MYHe', N'dothanhnhan20k@gmail.com', N'0364877521', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([vehicle_id], [vehicle_name], [description]) VALUES (1, N'Máy bay', N'Tiết kiệm thời gian')
INSERT [dbo].[Vehicles] ([vehicle_id], [vehicle_name], [description]) VALUES (2, N'Xe vườn nằm', N'em ái thoải mái')
INSERT [dbo].[Vehicles] ([vehicle_id], [vehicle_name], [description]) VALUES (3, N'Xe vinfast vf9', N'Xe điện thân thiện với môi trường')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[DetailItinerary]  WITH CHECK ADD  CONSTRAINT [FK_DetailItinerary_Itinerary] FOREIGN KEY([ItineraryId])
REFERENCES [dbo].[Itinerary] ([ItineraryId])
GO
ALTER TABLE [dbo].[DetailItinerary] CHECK CONSTRAINT [FK_DetailItinerary_Itinerary]
GO
ALTER TABLE [dbo].[Itinerary]  WITH CHECK ADD  CONSTRAINT [FK_Itinerary_Tours] FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Itinerary] CHECK CONSTRAINT [FK_Itinerary_Tours]
GO
ALTER TABLE [dbo].[ItineraryImages]  WITH CHECK ADD  CONSTRAINT [FK_ItineraryImages_Itinerary] FOREIGN KEY([ItineraryId])
REFERENCES [dbo].[Itinerary] ([ItineraryId])
GO
ALTER TABLE [dbo].[ItineraryImages] CHECK CONSTRAINT [FK_ItineraryImages_Itinerary]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__tour_id__5070F446] FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__tour_id__5070F446]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__user_id__5165187F] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__user_id__5165187F]
GO
ALTER TABLE [dbo].[TourDetails]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotels] ([hotel_id])
GO
ALTER TABLE [dbo].[TourDetails]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[TourDetails]  WITH CHECK ADD FOREIGN KEY([vehicle_id])
REFERENCES [dbo].[Vehicles] ([vehicle_id])
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [QLTour] SET  READ_WRITE 
GO
