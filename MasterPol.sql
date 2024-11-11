USE [master]
GO
/****** Object:  Database [MasterPol]    Script Date: 11.11.2024 15:34:21 ******/
CREATE DATABASE [MasterPol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterPol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterPol.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterPol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterPol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterPol] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterPol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterPol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterPol] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterPol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterPol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterPol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterPol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterPol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterPol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterPol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterPol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterPol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterPol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterPol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterPol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterPol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterPol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterPol] SET  MULTI_USER 
GO
ALTER DATABASE [MasterPol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterPol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterPol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterPol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterPol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterPol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterPol] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterPol] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterPol]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[Id] [int] NOT NULL,
	[IndexCountry] [int] NOT NULL,
	[Region] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[Street] [int] NOT NULL,
	[HouseNum] [int] NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryIndex]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryIndex](
	[Id] [int] NOT NULL,
	[NameCountry] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CountryIndex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countrys]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrys](
	[Id] [int] NOT NULL,
	[NameCountry] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countrys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectorName]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectorName](
	[id] [int] NOT NULL,
	[NameDir] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DirectorName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] NOT NULL,
	[Procent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizeName]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizeName](
	[Id] [int] NOT NULL,
	[NameOrg] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrganizeName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [int] NOT NULL,
	[Partner] [int] NOT NULL,
	[Name] [int] NOT NULL,
	[Director] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Adress] [int] NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[Rate] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[Id] [int] NOT NULL,
	[Production] [int] NOT NULL,
	[ProductionDisrption] [nvarchar](50) NOT NULL,
	[PartnerName] [int] NOT NULL,
	[CountProduct] [int] NOT NULL,
	[DateSell] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnetName]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnetName](
	[Id] [int] NOT NULL,
	[NamePartner] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnetName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[TypeProduct] [int] NOT NULL,
	[ProductsDiscription] [nvarchar](100) NOT NULL,
	[Article] [nvarchar](50) NOT NULL,
	[MinPrice] [float] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] NOT NULL,
	[NameRegion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strets]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strets](
	[Id] [int] NOT NULL,
	[NameStreet] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Strets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 11.11.2024 15:34:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Koeff] [float] NOT NULL,
 CONSTRAINT [PK_TypeProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Adress] ([Id], [IndexCountry], [Region], [Country], [Street], [HouseNum]) VALUES (1, 5, 3, 5, 1, 15)
INSERT [dbo].[Adress] ([Id], [IndexCountry], [Region], [Country], [Street], [HouseNum]) VALUES (2, 2, 1, 3, 5, 18)
INSERT [dbo].[Adress] ([Id], [IndexCountry], [Region], [Country], [Street], [HouseNum]) VALUES (3, 3, 4, 1, 2, 21)
INSERT [dbo].[Adress] ([Id], [IndexCountry], [Region], [Country], [Street], [HouseNum]) VALUES (4, 1, 5, 2, 4, 51)
INSERT [dbo].[Adress] ([Id], [IndexCountry], [Region], [Country], [Street], [HouseNum]) VALUES (5, 4, 2, 4, 3, 122)
GO
INSERT [dbo].[CountryIndex] ([Id], [NameCountry]) VALUES (1, N'143960')
INSERT [dbo].[CountryIndex] ([Id], [NameCountry]) VALUES (2, N'164500')
INSERT [dbo].[CountryIndex] ([Id], [NameCountry]) VALUES (3, N'188910')
INSERT [dbo].[CountryIndex] ([Id], [NameCountry]) VALUES (4, N'309500')
INSERT [dbo].[CountryIndex] ([Id], [NameCountry]) VALUES (5, N'652050')
GO
INSERT [dbo].[Countrys] ([Id], [NameCountry]) VALUES (1, N'Приморск')
INSERT [dbo].[Countrys] ([Id], [NameCountry]) VALUES (2, N'Реутов')
INSERT [dbo].[Countrys] ([Id], [NameCountry]) VALUES (3, N'Северодвинск')
INSERT [dbo].[Countrys] ([Id], [NameCountry]) VALUES (4, N'СтарыйОскол')
INSERT [dbo].[Countrys] ([Id], [NameCountry]) VALUES (5, N'Юрга')
GO
INSERT [dbo].[DirectorName] ([id], [NameDir]) VALUES (1, N'Воробьева Екатерина Валерьевна')
INSERT [dbo].[DirectorName] ([id], [NameDir]) VALUES (2, N'Иванова Александра Ивановна')
INSERT [dbo].[DirectorName] ([id], [NameDir]) VALUES (3, N'Петров Василий Петрович')
INSERT [dbo].[DirectorName] ([id], [NameDir]) VALUES (4, N'Соловьев Андрей Николаевич')
INSERT [dbo].[DirectorName] ([id], [NameDir]) VALUES (5, N'Степанов Степан Сергеевич')
GO
INSERT [dbo].[MaterialType] ([Id], [Procent]) VALUES (1, 0.001)
INSERT [dbo].[MaterialType] ([Id], [Procent]) VALUES (2, 0.0095)
INSERT [dbo].[MaterialType] ([Id], [Procent]) VALUES (3, 0.0028)
INSERT [dbo].[MaterialType] ([Id], [Procent]) VALUES (4, 0.0055)
INSERT [dbo].[MaterialType] ([Id], [Procent]) VALUES (5, 0.0034)
GO
INSERT [dbo].[OrganizeName] ([Id], [NameOrg]) VALUES (1, N'База Строитель')
INSERT [dbo].[OrganizeName] ([Id], [NameOrg]) VALUES (2, N'МонтажПро')
INSERT [dbo].[OrganizeName] ([Id], [NameOrg]) VALUES (3, N'Паркет 29')
INSERT [dbo].[OrganizeName] ([Id], [NameOrg]) VALUES (4, N'Ремонт и отделка')
INSERT [dbo].[OrganizeName] ([Id], [NameOrg]) VALUES (5, N'Стройсервис')
GO
INSERT [dbo].[Partner] ([Id], [Partner], [Name], [Director], [Email], [PhoneNumber], [Adress], [INN], [Rate]) VALUES (1, 1, 1, 2, N'aleksandraivanova@ml.ru', N'7 493 123 45 67', 1, N'2222455179', N'7         ')
INSERT [dbo].[Partner] ([Id], [Partner], [Name], [Director], [Email], [PhoneNumber], [Adress], [INN], [Rate]) VALUES (2, 3, 3, 3, N'vppetrov@vl.ru', N'7 987 123 56 78', 2, N'3333888520', N'7         ')
INSERT [dbo].[Partner] ([Id], [Partner], [Name], [Director], [Email], [PhoneNumber], [Adress], [INN], [Rate]) VALUES (3, 4, 5, 4, N'ansolovev@st.ru', N'7 812 223 32 00', 3, N'4440391035', N'7         ')
INSERT [dbo].[Partner] ([Id], [Partner], [Name], [Director], [Email], [PhoneNumber], [Adress], [INN], [Rate]) VALUES (4, 2, 4, 1, N'ekaterina.vorobeva@ml.ru', N'7 444 222 33 11', 4, N'1111520857', N'5         ')
INSERT [dbo].[Partner] ([Id], [Partner], [Name], [Director], [Email], [PhoneNumber], [Adress], [INN], [Rate]) VALUES (5, 1, 2, 5, N'stepanov@stepan.ru', N'7 912 888 33 33', 5, N'5552431140', N'10        ')
GO
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (1, 4, N'Ясень темный однополосная 14 мм', 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (2, 2, N'Дуб дымчато-белый 33 класс 12 мм', 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (3, 2, N'Дуб серый 32 класс 8 мм с фаской', 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (4, 1, N'Дуб Французская елка однополосная 12 мм', 3, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (5, 4, N'напольное клеевое покрытие 32 класс 4 мм', 3, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (6, 2, N'Дуб дымчато-белый 33 класс 12 мм', 3, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (7, 4, N'Ясень темный однополосная 14 мм', 3, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (8, 4, N'Ясень темный однополосная 14 мм', 5, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (9, 1, N'Дуб Французская елка однополосная 12 мм', 5, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (10, 2, N'Дуб серый 32 класс 8 мм с фаской', 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (11, 2, N'Дуб дымчато-белый 33 класс 12 мм', 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (12, 4, N'напольное клеевое покрытие 32 класс 4 мм', 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (13, 2, N'Дуб дымчато-белый 33 класс 12 мм', 2, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (14, 2, N'Дуб серый 32 класс 8 мм с фаской', 2, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (15, 4, N'Ясень темный однополосная 14 мм', 2, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [Production], [ProductionDisrption], [PartnerName], [CountProduct], [DateSell]) VALUES (16, 1, N'Дуб Французская елка однополосная 12 мм', 2, 25000, CAST(N'2024-06-12' AS Date))
GO
INSERT [dbo].[PartnetName] ([Id], [NamePartner]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnetName] ([Id], [NamePartner]) VALUES (2, N'ОАО')
INSERT [dbo].[PartnetName] ([Id], [NamePartner]) VALUES (3, N'ООО')
INSERT [dbo].[PartnetName] ([Id], [NamePartner]) VALUES (4, N'ПАО')
GO
INSERT [dbo].[Product] ([Id], [TypeProduct], [ProductsDiscription], [Article], [MinPrice]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', 4456.9)
INSERT [dbo].[Product] ([Id], [TypeProduct], [ProductsDiscription], [Article], [MinPrice]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', 7330.99)
INSERT [dbo].[Product] ([Id], [TypeProduct], [ProductsDiscription], [Article], [MinPrice]) VALUES (3, 2, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', 1799.33)
INSERT [dbo].[Product] ([Id], [TypeProduct], [ProductsDiscription], [Article], [MinPrice]) VALUES (4, 2, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', 3890.41)
INSERT [dbo].[Product] ([Id], [TypeProduct], [ProductsDiscription], [Article], [MinPrice]) VALUES (5, 3, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', 5450.59)
GO
INSERT [dbo].[Regions] ([Id], [NameRegion]) VALUES (1, N' Архангельская область')
INSERT [dbo].[Regions] ([Id], [NameRegion]) VALUES (2, N' Белгородская область')
INSERT [dbo].[Regions] ([Id], [NameRegion]) VALUES (3, N' Кемеровская область')
INSERT [dbo].[Regions] ([Id], [NameRegion]) VALUES (4, N' Ленинградская область')
INSERT [dbo].[Regions] ([Id], [NameRegion]) VALUES (5, N' Московская область')
GO
INSERT [dbo].[Strets] ([Id], [NameStreet]) VALUES (1, N'Лесная')
INSERT [dbo].[Strets] ([Id], [NameStreet]) VALUES (2, N'Парковая')
INSERT [dbo].[Strets] ([Id], [NameStreet]) VALUES (3, N'Рабочая')
INSERT [dbo].[Strets] ([Id], [NameStreet]) VALUES (4, N'Свободы')
INSERT [dbo].[Strets] ([Id], [NameStreet]) VALUES (5, N'Строителей')
GO
INSERT [dbo].[TypeProduct] ([Id], [Name], [Koeff]) VALUES (1, N'Инженерная доска', 1)
INSERT [dbo].[TypeProduct] ([Id], [Name], [Koeff]) VALUES (2, N'Ламинат', 2.35)
INSERT [dbo].[TypeProduct] ([Id], [Name], [Koeff]) VALUES (3, N'Массивная доска', 5.15)
INSERT [dbo].[TypeProduct] ([Id], [Name], [Koeff]) VALUES (4, N'Паркетная доска', 4.34)
INSERT [dbo].[TypeProduct] ([Id], [Name], [Koeff]) VALUES (5, N'Пробковое покрытие', 1.5)
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_CountryIndex] FOREIGN KEY([IndexCountry])
REFERENCES [dbo].[CountryIndex] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_CountryIndex]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Countrys] FOREIGN KEY([Country])
REFERENCES [dbo].[Countrys] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Countrys]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Regions] FOREIGN KEY([Region])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Regions]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Regions1] FOREIGN KEY([Region])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Regions1]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Strets] FOREIGN KEY([Street])
REFERENCES [dbo].[Strets] ([Id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Strets]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Adress] FOREIGN KEY([Adress])
REFERENCES [dbo].[Adress] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partners_Adress]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partners_DirectorName] FOREIGN KEY([Director])
REFERENCES [dbo].[DirectorName] ([id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partners_DirectorName]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partners_OrganizeName1] FOREIGN KEY([Name])
REFERENCES [dbo].[OrganizeName] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partners_OrganizeName1]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnetName1] FOREIGN KEY([Partner])
REFERENCES [dbo].[PartnetName] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partners_PartnetName1]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_OrganizeName] FOREIGN KEY([PartnerName])
REFERENCES [dbo].[OrganizeName] ([Id])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_OrganizeName]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_TypeProduct] FOREIGN KEY([Production])
REFERENCES [dbo].[TypeProduct] ([Id])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_TypeProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TypeProduct] FOREIGN KEY([TypeProduct])
REFERENCES [dbo].[TypeProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TypeProduct]
GO
USE [master]
GO
ALTER DATABASE [MasterPol] SET  READ_WRITE 
GO
