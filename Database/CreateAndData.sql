USE master
GO

DROP DATABASE IF EXISTS [ChateuAubergeHotelManagementSystem]
GO

-- Add new database
CREATE DATABASE [ChateuAubergeHotelManagementSystem]
GO 

USE [ChateuAubergeHotelManagementSystem]
GO
ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FKRoom775854]
GO
ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FKRoom693906]
GO
ALTER TABLE [dbo].[Reservation] DROP CONSTRAINT [FKReservatio874071]
GO
ALTER TABLE [dbo].[Reservation] DROP CONSTRAINT [FKReservatio668265]
GO
ALTER TABLE [dbo].[Reservation] DROP CONSTRAINT [FKReservatio210773]
GO
ALTER TABLE [dbo].[Guest] DROP CONSTRAINT [FKGuest97151]
GO
ALTER TABLE [dbo].[Guest] DROP CONSTRAINT [FKGuest945982]
GO
ALTER TABLE [dbo].[Clerk] DROP CONSTRAINT [FKClerk983735]
GO
ALTER TABLE [dbo].[Clerk] DROP CONSTRAINT [FKClerk59398]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoomType]') AND type in (N'U'))
DROP TABLE [dbo].[RoomType]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
DROP TABLE [dbo].[Room]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservation]') AND type in (N'U'))
DROP TABLE [dbo].[Reservation]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Province]') AND type in (N'U'))
DROP TABLE [dbo].[Province]
GO
/****** Object:  Table [dbo].[GuestFee]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GuestFee]') AND type in (N'U'))
DROP TABLE [dbo].[GuestFee]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guest]') AND type in (N'U'))
DROP TABLE [dbo].[Guest]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Clerk]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clerk]') AND type in (N'U'))
DROP TABLE [dbo].[Clerk]
GO
/****** Object:  Table [dbo].[BedType]    Script Date: 2020-12-01 6:50:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BedType]') AND type in (N'U'))
DROP TABLE [dbo].[BedType]
GO
/****** Object:  Table [dbo].[BedType]    Script Date: 2020-12-01 6:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BedType](
	[BedID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clerk]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clerk](
	[ClerkId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[MiddleName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[StreetAddress] [nvarchar](100) NOT NULL,
	[Municipality] [nvarchar](50) NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[PostalCode] [char](10) NOT NULL,
	[PhoneNumber] [char](20) NOT NULL,
	[SIN] [char](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClerkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[StreetAddress1] [nvarchar](150) NOT NULL,
	[Municipality] [nvarchar](100) NOT NULL,
	[ProvinceId] [int] NULL,
	[CountryId] [int] NOT NULL,
	[PostalCode] [char](20) NOT NULL,
	[HomePhoneNum] [char](25) NULL,
	[MobilePhoneNum] [char](25) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestFee]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestFee](
	[GuestType] [nvarchar](25) NULL,
	[GuestRate] [decimal](19, 0) NOT NULL,
	[EffectiveDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [nvarchar](50) NOT NULL,
	[Abbreviation] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ConfirmationNumber] [varchar](20) NOT NULL,
	[CheckInDate] [datetime2](7) NOT NULL,
	[CheckOutDate] [datetime2](7) NOT NULL,
	[NumAdults] [int] NOT NULL,
	[NumChildren] [int] NULL,
	[GuestID] [int] NOT NULL,
	[RoomId] [char](10) NOT NULL,
	[ClerkId] [int] NOT NULL,
	[BaseFee] [decimal](19, 0) NULL,
	[AdultRate] [decimal](19, 0) NULL,
	[ChildRate] [decimal](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfirmationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNumber] [char](10) NOT NULL,
	[RoomName] [varchar](100) NOT NULL,
	[MaxOccupancy] [int] NOT NULL,
	[NumBeds] [int] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[BaseRate] [decimal](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 2020-12-01 6:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BedType] ON 

INSERT [dbo].[BedType] ([BedID], [Description]) VALUES (1, N'2 Queen')
INSERT [dbo].[BedType] ([BedID], [Description]) VALUES (2, N'2 Queen with sofa bed')
INSERT [dbo].[BedType] ([BedID], [Description]) VALUES (3, N'1 King')
INSERT [dbo].[BedType] ([BedID], [Description]) VALUES (4, N'1 King with sofa bed')
SET IDENTITY_INSERT [dbo].[BedType] OFF
GO
SET IDENTITY_INSERT [dbo].[Clerk] ON 

INSERT [dbo].[Clerk] ([ClerkId], [FirstName], [MiddleName], [LastName], [UserName], [Password], [StreetAddress], [Municipality], [ProvinceId], [CountryId], [PostalCode], [PhoneNumber], [SIN]) VALUES (2, N'John', NULL, N'Jones', N'jjones', N'jones123', N'698 Mountain Road', N'Moncton', 4, 1, N'E2K 3H5   ', N'5063698963          ', N'999-123-963    ')
SET IDENTITY_INSERT [dbo].[Clerk] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'Canada')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'United States')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'Philippines')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'Japan')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (5, N'South Korea')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (1, N'Jane', NULL, N'Adams', N'123 Main St', N'Saint John', 4, 1, N'2L6 1M4             ', N'5069631234               ', NULL, NULL, CAST(N'1971-07-14T22:57:52.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (2, N'Sam', NULL, N'Smith', N'89 Bonavista St', N'Moncton', 1, 1, N'E1G 7H9             ', NULL, N'6093691234               ', N'sam@ymail.com', CAST(N'1998-02-03T22:59:40.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (3, N'Jason', NULL, N'Bourne', N'64 George St', N'MyTown', 2, 1, N'E1G 2H4             ', N'5067894561               ', NULL, NULL, CAST(N'1997-01-06T23:02:04.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (4, N'Jane', NULL, N'Smith', N'123 Main St', N'Moncton', 1, 1, N'E1G 2H4             ', N'5068996543               ', N'5062361234               ', N'jane@gmail.com', CAST(N'1996-10-03T23:04:42.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (5, N'Candice', NULL, N'Zane', N'45 Jane St', N'Halifax', 4, 1, N'S5G 2N5             ', N'9121234567               ', NULL, N'czane@ymail.com', CAST(N'1984-02-07T23:07:09.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (7, N'Emma', NULL, N'Jackson', N'153 Main St', N'JacksonVille', 7, 1, N'E1G 2H4             ', N'5068993328               ', NULL, NULL, CAST(N'1952-07-17T16:53:01.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (8, N'Anne', NULL, N'Osbourne', N'123 Main Street', N'Moncton', 1, 1, N'E1G 2H4             ', N'5061231234               ', NULL, N'anneos@gmail.com', CAST(N'1986-02-11T22:17:27.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (9, N'Gio', NULL, N'Royale', N'123 Highness Court', N'Moncton', 1, 1, N'E1G 2H4             ', N'5031234567               ', NULL, NULL, CAST(N'1962-07-05T23:26:42.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (10, N'Alex', NULL, N'Jamino', N'123 Albert St', N'Saint John', 1, 1, N'E1G 2G4             ', N'5061234567               ', NULL, NULL, CAST(N'1970-03-18T23:34:28.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (12, N'Jamir', NULL, N'Nondro', N'123 Main St', N'Hollywood', 18, 2, N'123456              ', N'9461231234               ', NULL, NULL, CAST(N'1995-05-15T12:07:50.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (14, N'Susy', NULL, N'Noah', N'2 Chome-14-5 Kabukicho, Shinjuku City', N'Tokyo', NULL, 4, N'160-0021            ', N'1351552666               ', NULL, NULL, CAST(N'1956-02-08T20:35:10.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (16, N'Susannie', NULL, N'Tiempo', N'asdasdsa', N'asdasdasd', 1, 1, N'E1G 2H4             ', N'5068993328               ', NULL, NULL, CAST(N'1981-03-05T16:47:35.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (18, N'Susannie', NULL, N'Tiempo', N'42 Bonavista', N'Moncton', 1, 1, N'E1G 2H4             ', N'5068993328               ', NULL, NULL, CAST(N'1988-02-16T17:19:00.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (19, N'Jamie', NULL, N'Fox', N'23 Twin Oaks', N'Saint John', 1, 1, N'E1H 5H4             ', N'5068961236               ', NULL, NULL, CAST(N'1972-01-04T14:35:49.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (20, N'dsadsa', NULL, N'sadsad', N'asdasdas', N'sadasd', NULL, 4, N'123224              ', N'5068967896               ', NULL, N'amy@gmailc.com', CAST(N'1989-02-01T14:45:51.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (21, N'sdasd', N'asdasd', N'asdasd', N'sadasd', N'asdasdas', 1, 1, N'E1G 2H4             ', N'5068993328               ', NULL, NULL, CAST(N'1990-02-01T14:51:24.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (22, N'xzczxc', N'zxcxzc', N'xzczxc', N'zxczxc', N'zxcxzc', 1, 1, N'E1G 2H4             ', N'5068993328               ', NULL, NULL, CAST(N'1979-02-06T14:55:10.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (23, N'Amy', NULL, N'Ko', N'2 Chome-14-5 Kabukicho, Shinjuku City', N'Tokyo', NULL, 4, N'160-0021            ', N'5155266612               ', NULL, N'amy@gmail.com', CAST(N'1978-02-08T14:57:33.0000000' AS DateTime2))
INSERT [dbo].[Guest] ([GuestID], [FirstName], [MiddleName], [LastName], [StreetAddress1], [Municipality], [ProvinceId], [CountryId], [PostalCode], [HomePhoneNum], [MobilePhoneNum], [EmailAddress], [DateOfBirth]) VALUES (24, N'Amy', NULL, N'Ko', N'2 Chome-14-5 Kabukicho', N'Shinjuku City', NULL, 4, N'160-0021            ', N'5155266612               ', NULL, N'amy@gmail.com', CAST(N'1976-02-10T15:07:53.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Adults', CAST(15 AS Decimal(19, 0)), CAST(N'2020-10-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Child', CAST(10 AS Decimal(19, 0)), CAST(N'2020-10-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Adults', CAST(30 AS Decimal(19, 0)), CAST(N'2021-12-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Child', CAST(10 AS Decimal(19, 0)), CAST(N'2021-12-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Adults', CAST(10 AS Decimal(19, 0)), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[GuestFee] ([GuestType], [GuestRate], [EffectiveDate]) VALUES (N'Child', CAST(5 AS Decimal(19, 0)), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (1, N'New Brunswick', N'NB   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (2, N'Newfoundland and Labrador', N'NL   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (3, N'Prince Edward Island', N'PE   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (4, N'Nova Scotia', N'NS   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (5, N'Quebec', N'QC   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (6, N'Ontario', N'ON   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (7, N'Manitoba', N'MB   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (8, N'Saskatchewan', N'SK   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (9, N'Alberta', N'AB   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (10, N'British Columbia', N'BC   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (11, N'Yukon', N'YT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (12, N'Northwest Territories', N'NT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (13, N'Nunavut', N'NU   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (14, N'Alabama', N'AL   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (15, N'Alaska', N'AK   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (16, N'Arizona', N'AZ   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (17, N'Arkansas', N'AR   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (18, N'California', N'CA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (19, N'Colorado', N'CO   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (20, N'Connecticut', N'CT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (21, N'Delaware', N'DE   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (22, N'Florida', N'FL   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (23, N'Georgia', N'GA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (24, N'Hawaii', N'HI   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (25, N'Idaho', N'ID   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (26, N'Illinois', N'IL   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (27, N'Indiana', N'IN   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (28, N'Iowa', N'IA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (29, N'Kansas', N'KS   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (30, N'Kentucky', N'KY   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (31, N'Louisiana', N'LA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (32, N'Maine', N'ME   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (33, N'Maryland', N'MD   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (34, N'Massachusetts', N'MA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (35, N'Michigan', N'MI   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (36, N'Minnesota', N'MN   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (37, N'Mississippi', N'MS   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (38, N'Missouri', N'MO   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (39, N'Montana', N'MT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (40, N'Nebraska', N'NE   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (41, N'Nevada', N'NV   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (42, N'New Hampshire', N'NH   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (43, N'New Jersey', N'NJ   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (44, N'New Mexico', N'NM   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (45, N'New York', N'NY   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (46, N'North Carolina', N'NC   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (47, N'North Dakota', N'ND   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (48, N'Ohio', N'OH   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (49, N'Oklahoma', N'OK   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (50, N'Oregon', N'OR   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (51, N'Pennsylvania', N'PA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (52, N'Rhode Island', N'RI   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (53, N'South Carolina', N'SC   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (54, N'South Dakota', N'SD   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (55, N'Tennessee', N'TN   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (56, N'Texas', N'TX   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (57, N'Utah', N'UT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (58, N'Vermont', N'VT   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (59, N'Virginia', N'VA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (60, N'Washington', N'WA   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (61, N'West Virginia', N'WV   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (62, N'Wisconsin', N'WI   ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Abbreviation]) VALUES (63, N'Wyoming', N'WY   ')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJAJ19864733', CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-27T00:00:00.0000000' AS DateTime2), 1, 1, 10, N'204       ', 2, CAST(179 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJAK19203302', CAST(N'2020-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-03T00:00:00.0000000' AS DateTime2), 1, 1, 24, N'102       ', 2, CAST(169 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJAO19617156', CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-26T00:00:00.0000000' AS DateTime2), 1, 0, 8, N'301       ', 2, CAST(399 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJCZ13044607', CAST(N'2021-01-28T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-29T00:00:00.0000000' AS DateTime2), 0, 0, 5, N'104       ', 2, CAST(159 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJEJ18490511', CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-26T00:00:00.0000000' AS DateTime2), 0, 0, 7, N'101       ', 2, CAST(135 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJGR18231584', CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-27T00:00:00.0000000' AS DateTime2), 2, 1, 9, N'302       ', 2, CAST(429 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJJA14344985', CAST(N'2020-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-25T00:00:00.0000000' AS DateTime2), 0, 0, 1, N'102       ', 2, CAST(169 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJJB15415061', CAST(N'2020-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-24T00:00:00.0000000' AS DateTime2), 0, 0, 3, N'201       ', 2, CAST(219 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJJF12156283', CAST(N'2020-12-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-11T00:00:00.0000000' AS DateTime2), 1, 0, 19, N'102       ', 2, CAST(169 AS Decimal(19, 0)), CAST(30 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
INSERT [dbo].[Reservation] ([ConfirmationNumber], [CheckInDate], [CheckOutDate], [NumAdults], [NumChildren], [GuestID], [RoomId], [ClerkId], [BaseFee], [AdultRate], [ChildRate]) VALUES (N'JJJN10095290', CAST(N'2020-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-29T00:00:00.0000000' AS DateTime2), 1, 3, 12, N'101       ', 2, CAST(135 AS Decimal(19, 0)), CAST(15 AS Decimal(19, 0)), CAST(10 AS Decimal(19, 0)))
GO
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'101       ', N'Copper Beach', 5, 1, 3, CAST(135 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'102       ', N'The Cumberland', 4, 4, 2, CAST(169 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'103       ', N'Whitetail', 3, 2, 2, CAST(159 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'104       ', N'Pronghorn', 3, 3, 2, CAST(159 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'105       ', N'The Elms', 5, 1, 3, CAST(135 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'201       ', N'The Elk', 6, 2, 4, CAST(219 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'202       ', N'Countess Crystal', 5, 1, 5, CAST(189 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'203       ', N'The Blackstone', 4, 4, 6, CAST(189 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'204       ', N'Alejandra', 5, 1, 6, CAST(179 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'301       ', N'The Trumpster', 2, 3, 7, CAST(399 AS Decimal(19, 0)))
INSERT [dbo].[Room] ([RoomNumber], [RoomName], [MaxOccupancy], [NumBeds], [RoomTypeID], [BaseRate]) VALUES (N'302       ', N'The Windsor Room', 4, 4, 8, CAST(429 AS Decimal(19, 0)))
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (1, N'Standard Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (2, N'Superior Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (3, N'Park View Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (4, N'Standard Plus Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (5, N'Ocean View Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (6, N'Premiere Park View Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (7, N'Presidential Suite')
INSERT [dbo].[RoomType] ([RoomTypeID], [Description]) VALUES (8, N'Royal Suite')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
ALTER TABLE [dbo].[Clerk]  WITH CHECK ADD  CONSTRAINT [FKClerk59398] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([ProvinceId])
GO
ALTER TABLE [dbo].[Clerk] CHECK CONSTRAINT [FKClerk59398]
GO
ALTER TABLE [dbo].[Clerk]  WITH CHECK ADD  CONSTRAINT [FKClerk983735] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Clerk] CHECK CONSTRAINT [FKClerk983735]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FKGuest945982] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FKGuest945982]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FKGuest97151] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([ProvinceId])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FKGuest97151]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FKReservatio210773] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FKReservatio210773]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FKReservatio668265] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FKReservatio668265]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FKReservatio874071] FOREIGN KEY([ClerkId])
REFERENCES [dbo].[Clerk] ([ClerkId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FKReservatio874071]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FKRoom693906] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FKRoom693906]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FKRoom775854] FOREIGN KEY([NumBeds])
REFERENCES [dbo].[BedType] ([BedID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FKRoom775854]
GO
