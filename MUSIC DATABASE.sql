USE [master]
GO
/****** Object:  Database [music_database]    Script Date: 24-05-2023 13:51:06 ******/
CREATE DATABASE [music_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'music_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\music_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'music_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\music_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [music_database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [music_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [music_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [music_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [music_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [music_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [music_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [music_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [music_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [music_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [music_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [music_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [music_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [music_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [music_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [music_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [music_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [music_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [music_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [music_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [music_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [music_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [music_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [music_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [music_database] SET RECOVERY FULL 
GO
ALTER DATABASE [music_database] SET  MULTI_USER 
GO
ALTER DATABASE [music_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [music_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [music_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [music_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [music_database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [music_database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'music_database', N'ON'
GO
ALTER DATABASE [music_database] SET QUERY_STORE = ON
GO
ALTER DATABASE [music_database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [music_database]
GO
/****** Object:  Table [dbo].[album]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album](
	[album_id] [smallint] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[artist_id] [int] NOT NULL,
 CONSTRAINT [PK_album] PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artist]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist](
	[artist_id] [smallint] NOT NULL,
	[name] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [tinyint] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[company] [nvarchar](50) NULL,
	[address] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NOT NULL,
	[postal_code] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[support_rep_id] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [tinyint] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[reports_to] [tinyint] NULL,
	[levels] [money] NOT NULL,
	[birthdate] [datetime2](7) NOT NULL,
	[hire_date] [datetime2](7) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[postal_code] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[fax] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genre_id] [tinyint] NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoice_id] [smallint] NOT NULL,
	[customer_id] [tinyint] NOT NULL,
	[invoice_date] [datetime2](7) NOT NULL,
	[billing_address] [nvarchar](50) NOT NULL,
	[billing_city] [nvarchar](50) NOT NULL,
	[billing_state] [nvarchar](50) NOT NULL,
	[billing_country] [nvarchar](50) NOT NULL,
	[billing_postal_code] [nvarchar](50) NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_line]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_line](
	[invoice_line_id] [smallint] NOT NULL,
	[invoice_id] [int] NOT NULL,
	[track_id] [smallint] NOT NULL,
	[unit_price] [float] NOT NULL,
	[quantity] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[media_type]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_type](
	[media_type_id] [tinyint] NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlist]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlist](
	[playlist_id] [tinyint] NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlist_track]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlist_track](
	[playlist_id] [tinyint] NOT NULL,
	[track_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track]    Script Date: 24-05-2023 13:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track](
	[track_id] [smallint] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[album_id] [int] NOT NULL,
	[media_type_id] [tinyint] NOT NULL,
	[genre_id] [tinyint] NOT NULL,
	[composer] [varchar](max) NULL,
	[milliseconds] [int] NOT NULL,
	[bytes] [int] NOT NULL,
	[unit_price] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [music_database] SET  READ_WRITE 
GO
