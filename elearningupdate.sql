USE [master]
GO
/****** Object:  Database [Elearningupdated]    Script Date: 6/21/2020 11:15:16 PM ******/
CREATE DATABASE [Elearningupdated]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elearningupdated', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Elearningupdated.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elearningupdated_log', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Elearningupdated_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Elearningupdated] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elearningupdated].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elearningupdated] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elearningupdated] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elearningupdated] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elearningupdated] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elearningupdated] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elearningupdated] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elearningupdated] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elearningupdated] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elearningupdated] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elearningupdated] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elearningupdated] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elearningupdated] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elearningupdated] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elearningupdated] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elearningupdated] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elearningupdated] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elearningupdated] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elearningupdated] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elearningupdated] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elearningupdated] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elearningupdated] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elearningupdated] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elearningupdated] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Elearningupdated] SET  MULTI_USER 
GO
ALTER DATABASE [Elearningupdated] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elearningupdated] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elearningupdated] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elearningupdated] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elearningupdated] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Elearningupdated] SET QUERY_STORE = OFF
GO
USE [Elearningupdated]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/21/2020 11:15:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Courseid] [int] NOT NULL,
	[Cartid] [int] NOT NULL,
	[cash] [float] NOT NULL,
	[process] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Courseid] ASC,
	[Cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[paid] [bit] NOT NULL,
	[day] [nchar](12) NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[name] [nvarchar](100) NOT NULL,
	[MajorId] [int] NULL,
	[Instruid] [int] NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](200) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Courses_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curriculums]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculums](
	[name] [nchar](10) NOT NULL,
	[CourseId] [int] NULL,
	[pdf] [nchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Curriculums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[TestId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[correct] [int] NULL,
	[rank] [nchar](10) NOT NULL,
	[day] [nchar](12) NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[time] [float] NOT NULL,
	[excel] [nchar](50) NOT NULL,
	[question] [int] NOT NULL,
	[answer] [nchar](100) NOT NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/21/2020 11:15:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Lastname] [nvarchar](100) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Password] [nchar](16) NOT NULL,
	[Birthday] [nchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
	[income] [float] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_cash]  DEFAULT ((0)) FOR [cash]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_process]  DEFAULT ((1)) FOR [process]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_income]  DEFAULT ((0.0)) FOR [income]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Cart] FOREIGN KEY([Cartid])
REFERENCES [dbo].[Cart] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Cart]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Courses] FOREIGN KEY([Courseid])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Courses]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Major1] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Major1]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Users] FOREIGN KEY([Instruid])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Users]
GO
ALTER TABLE [dbo].[Curriculums]  WITH CHECK ADD  CONSTRAINT [FK_Curriculums_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Curriculums] CHECK CONSTRAINT [FK_Curriculums_Courses]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Tests] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Tests]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Users]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Courses]
GO
USE [master]
GO
ALTER DATABASE [Elearningupdated] SET  READ_WRITE 
GO
