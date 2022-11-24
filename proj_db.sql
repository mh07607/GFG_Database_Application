USE [master]
GO
/****** Object:  Database [Project]    Script Date: 11/24/2022 9:37:57 AM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'D:\sql\MSSQL15.YEET\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'D:\sql\MSSQL15.YEET\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [nchar](10) NOT NULL,
	[Department Name] [nvarchar](50) NULL,
	[Department Lead] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[donor_id] [nchar](10) NOT NULL,
	[Donor Name] [text] NULL,
	[Donor Type] [text] NULL,
	[Phone Number] [int] NULL,
	[Email address] [text] NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[donor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_CNIC] [int] IDENTITY(1,1) NOT NULL,
	[Reports To] [int] NULL,
	[Position] [nchar](10) NULL,
	[Salary] [float] NULL,
	[department_id] [nchar](10) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone number] [int] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_CNIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee-Project]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee-Project](
	[employee_CNIC] [int] NOT NULL,
	[project_id] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funds]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funds](
	[fund_id] [nchar](10) NOT NULL,
	[Entered by] [int] NOT NULL,
	[Incoming/Outgoing] [bit] NOT NULL,
	[Amount Loss] [float] NULL,
	[Amount Gain] [float] NULL,
	[Date] [date] NULL,
	[Description] [text] NULL,
	[Project] [nchar](10) NULL,
	[Donor] [nchar](10) NULL,
 CONSTRAINT [PK_Funds] PRIMARY KEY CLUSTERED 
(
	[fund_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[project_id] [nchar](10) NOT NULL,
	[Project Name] [text] NULL,
	[Project Lead] [int] NULL,
	[Budget Allocated] [float] NULL,
	[Start Date] [date] NULL,
	[End Date] [date] NULL,
	[Current Status] [text] NULL,
	[Category] [text] NULL,
	[Location] [text] NULL,
 CONSTRAINT [PK_Project_1] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[volunteer_CNIC] [int] NOT NULL,
	[Name] [text] NULL,
	[Address] [text] NULL,
	[Phone Number] [int] NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[volunteer_CNIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer-Project]    Script Date: 11/24/2022 9:37:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer-Project](
	[volunteer_CNIC] [int] NOT NULL,
	[project_id] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([Department Lead])
REFERENCES [dbo].[Employee] ([employee_CNIC])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Reports To])
REFERENCES [dbo].[Employee] ([employee_CNIC])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Employee-Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee-Project_Employee] FOREIGN KEY([employee_CNIC])
REFERENCES [dbo].[Employee] ([employee_CNIC])
GO
ALTER TABLE [dbo].[Employee-Project] CHECK CONSTRAINT [FK_Employee-Project_Employee]
GO
ALTER TABLE [dbo].[Employee-Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee-Project_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[Employee-Project] CHECK CONSTRAINT [FK_Employee-Project_Project]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [FK_Funds_Donor] FOREIGN KEY([Donor])
REFERENCES [dbo].[Donor] ([donor_id])
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [FK_Funds_Donor]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [FK_Funds_Employee] FOREIGN KEY([Entered by])
REFERENCES [dbo].[Employee] ([employee_CNIC])
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [FK_Funds_Employee]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [FK_Funds_Project] FOREIGN KEY([Project])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [FK_Funds_Project]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Employee] FOREIGN KEY([Project Lead])
REFERENCES [dbo].[Employee] ([employee_CNIC])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Employee]
GO
ALTER TABLE [dbo].[Volunteer-Project]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer-Project_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[Volunteer-Project] CHECK CONSTRAINT [FK_Volunteer-Project_Project]
GO
ALTER TABLE [dbo].[Volunteer-Project]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer-Project_Volunteer] FOREIGN KEY([volunteer_CNIC])
REFERENCES [dbo].[Volunteer] ([volunteer_CNIC])
GO
ALTER TABLE [dbo].[Volunteer-Project] CHECK CONSTRAINT [FK_Volunteer-Project_Volunteer]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
