/*USE [master]
GO
/****** Object:  Database [test1]    Script Date: 12/3/2022 11:38:37 AM ******/
CREATE DATABASE [test1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test1', FILENAME = N'D:\sql\MSSQL15.YEET\MSSQL\DATA\test1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test1_log', FILENAME = N'D:\sql\MSSQL15.YEET\MSSQL\DATA\test1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [test1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test1] SET ARITHABORT OFF 
GO
ALTER DATABASE [test1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test1] SET RECOVERY FULL 
GO
ALTER DATABASE [test1] SET  MULTI_USER 
GO
ALTER DATABASE [test1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'test1', N'ON'
GO
ALTER DATABASE [test1] SET QUERY_STORE = OFF
GO
USE [test1]
GO*/
/****** Object:  Table [dbo].[Department]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_id] [int] NOT NULL,
	[Department_Name] [text] NOT NULL,
	[Department_Lead] [text] NOT NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[Department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[donor_id] [int] IDENTITY(10,1) NOT NULL,
	[Donor_name] [text] NOT NULL,
	[Donor_type] [text] NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DONOR] PRIMARY KEY CLUSTERED 
(
	[donor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_has_project]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_has_project](
	[project_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEE_HAS_PROJECT] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[Is Founder] [bit] NULL,
	[ReportsTo] [int] NULL,
	[Salary] [float] NOT NULL,
	[Name] [text] NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[User_ID] [varchar](max) NOT NULL,
	[CNIC] [varchar](max) NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funds]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funds](
	[fund_id] [int] IDENTITY(1,1) NOT NULL,
	[Entered_by] [int] NOT NULL,
	[InOut] [bit] NOT NULL,
	[Amount_loss] [float] NOT NULL,
	[Amount_gain] [float] NOT NULL,
	[Date] [date] NOT NULL,
	[Description] [text] NOT NULL,
	[project_id] [int] NOT NULL,
	[donor_id] [int] NULL,
 CONSTRAINT [PK_FUNDS] PRIMARY KEY CLUSTERED 
(
	[fund_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [varchar](max) NOT NULL,
	[Budget_Allocated] [float] NULL,
	[Project_Leads] [int] NULL,
	[Start_Date] [date] NULL,
	[End_date] [date] NULL,
	[Current_Status] [text] NOT NULL,
	[Location] [text] NOT NULL,
 CONSTRAINT [PK_PROJECTS] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[volunteer_id] [int] IDENTITY(1,1) NOT NULL,
	[Volunteer_Name] [text] NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Address] [text] NOT NULL,
	[CNIC] [text] NOT NULL,
 CONSTRAINT [PK_VOLUNTEER] PRIMARY KEY CLUSTERED 
(
	[volunteer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer_of_Project]    Script Date: 12/3/2022 11:38:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer_of_Project](
	[project_id] [int] NOT NULL,
	[volunteer_id] [int] NOT NULL,
 CONSTRAINT [PK_Volunteer_of_Project_1] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[volunteer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Donor] ON 
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (1, N'South City', N'Organization', N'03072017984')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (2, N'Agha Khan', N'Organization', N'03001569876')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (3, N'Bruce Wayne', N'Individual', N'03003009456')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (4, N'Tony Stark', N'Individual', N'03215006359')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (5, N'Habib University', N'Organization', N'111789789')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (6, N'Laiba Zehra', N'Individual', N'03007865142')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (7, N'Ziauddin', N'Organization', N'02158796123')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (8, N'Qasim Pasta', N'Individual', N'03005648987')
GO
INSERT [dbo].[Donor] ([donor_id], [Donor_name], [Donor_type], [Phone_Number]) VALUES (9, N'Edhi Foundation', N'Organization', N'021112112')
GO
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (1, 3)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (2, 8)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (3, 10)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (4, 5)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (5, 7)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (6, 11)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (7, 4)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (8, 2)
GO
INSERT [dbo].[employee_has_project] ([project_id], [employee_id]) VALUES (9, 6)
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (2, 1, NULL, 0, N'Hamza Abdullah', N'03158667988', N'Defence, Karachi', N'ha07194', N'001', N'4201-7896541-1')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (3, 1, NULL, 0, N'Hammad Bin Zahoor', N'03075669841', N'Boat Basin, Karachi', N'hz07428', N'002', N'4201-7896589-2')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (4, 1, NULL, 0, N'Arsalan Hussain', N'03144562001', N'Nazimabad, Karachi', N'mh07565', N'003', N'4201-7897891-4')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (5, 0, NULL, 5000, N'Ali Ahmed', N'03002447896', N'Defence, Lahore', N'aa05144', N'004', N'4201-7896123-5')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (6, 0, 2, 5000, N'Maria Usman', N'03004556444', N'Clifton Karachi', N'mu07144', N'007', N'4201-7855541-9')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (7, 0, 10, 5000, N'Laiba Zehra', N'03121228945', N'Garden, Karchi', N'lz07648', N'005', N'4201-7896541-3')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (8, 0, NULL, 5000, N'Qasim Pasta', N'03334187999', N'Clifton, Karachi', N'qp041236', N'006', N'4201-7646541-9')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (10, 0, 5, 5000, N'Abeera Tariq', N'03008714569', N'Bahria Town, Lahore', N'at06888', N'009', N'4201-7896111-5')
GO
INSERT [dbo].[Employees] ([employee_id], [Is Founder], [ReportsTo], [Salary], [Name], [Phone_Number], [Address], [Password], [User_ID], [CNIC]) VALUES (11, 0, 6, 5000, N'Hafsa Kamran', N'03332114895', N'Saddar, Karachi', N'hk07562', N'010', N'4201-7895123-4')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Funds] ON 
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (5, 2, 1, 0, 10000, CAST(N'2022-12-01' AS Date), N'Travel expenses', 5, 6)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (6, 3, 1, 0, 10000, CAST(N'2022-09-15' AS Date), N'Charity donation', 2, 2)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (7, 4, 0, 40000, 0, CAST(N'2021-07-01' AS Date), N'Charity Donation', 3, NULL)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (8, 5, 1, 0, 80000, CAST(N'2019-01-05' AS Date), N'Logistics expenses', 4, 3)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (9, 6, 0, 5000, 0, CAST(N'2022-12-01' AS Date), N'Travel expenses', 6, NULL)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (10, 7, 0, 5000, 0, CAST(N'2022-08-01' AS Date), N'Travel expenses', 1, NULL)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (11, 8, 1, 0, 40000, CAST(N'2022-11-15' AS Date), N'Ration donation', 8, 4)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (12, 10, 1, 0, 5000, CAST(N'2021-08-05' AS Date), N'Book donation', 9, 8)
GO
INSERT [dbo].[Funds] ([fund_id], [Entered_by], [InOut], [Amount_loss], [Amount_gain], [Date], [Description], [project_id], [donor_id]) VALUES (13, 3, 1, 0, 50000, CAST(N'2021-08-01' AS Date), N'Construction expenses', 7, 9)
GO
SET IDENTITY_INSERT [dbo].[Funds] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (1, N'Sindh Flood Fundraiser', 20000, 2, CAST(N'2022-06-01' AS Date), NULL, N'Active', N'Sukkur')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (2, N'Edhi Donation Drive', 20000, 3, CAST(N'2022-09-01' AS Date), NULL, N'Active', N'Karachi')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (3, N'Akhuwat Foundation Fundraiser', 30000, 4, CAST(N'2021-06-01' AS Date), CAST(N'2021-08-01' AS Date), N'Complete', N'Karachi')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (4, N'Old Homes event', 100000, 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-10' AS Date), N'Complete', N'Lahore')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (5, N'Blood Donation Drive', 60000, 6, CAST(N'2022-11-20' AS Date), NULL, N'Active', N'Karachi')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (6, N'Edhi Donation Fundraiser', 20000, 10, CAST(N'2022-11-30' AS Date), NULL, N'Active', N'Lahore')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (7, N'School Construction', 200000, 2, CAST(N'2021-05-01' AS Date), CAST(N'2022-01-01' AS Date), N'Completed', N'Berani Village')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (8, N'Winter Drive', 50000, 6, CAST(N'2022-11-01' AS Date), CAST(N'2022-11-30' AS Date), N'Completed', N'Hyderabad')
GO
INSERT [dbo].[Projects] ([project_id], [Project_Name], [Budget_Allocated], [Project_Leads], [Start_Date], [End_date], [Current_Status], [Location]) VALUES (9, N'Book Donation Drive', 10000, 7, CAST(N'2021-08-01' AS Date), CAST(N'2021-08-15' AS Date), N'Completed', N'Lahore')
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[Volunteer] ON 
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (1, N'Raza ', N'03002207844', N'Boat Basin, Karachi', N'42180-7642894-6kdshfadhf')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (2, N'Asadadsoaifiaupsd', N'03152489652', N'Clifton, Karachi', N'42180-7642894-6')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (3, N'Muhammad', N'03115697895', N'Defence, Karachi', N'42180-7645594-8')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (4, N'Batool', N'03147896541', N'Saddar, Karachi', N'42180-7642885-7')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (5, N'Abeeha', N'03332156987', N'Garden, Karachi', N'42180-7642666-1')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (7, N'Rija', N'03343345189', N'Nazimabad, Karachi', N'42180-7642821-5')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (8, N'Lybah', N'03135586987', N'Bahria Town, Lahore', N'42180-7642753-1')
GO
INSERT [dbo].[Volunteer] ([volunteer_id], [Volunteer_Name], [Phone_Number], [Address], [CNIC]) VALUES (9, N'Abeera', N'03154424897', N'Bahria Town, Karachi', N'42180-7642456-5')
GO
SET IDENTITY_INSERT [dbo].[Volunteer] OFF
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (1, 1)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (2, 5)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (3, 8)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (4, 7)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (5, 2)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (6, 4)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (7, 9)
GO
INSERT [dbo].[Volunteer_of_Project] ([project_id], [volunteer_id]) VALUES (8, 3)
GO
ALTER TABLE [dbo].[employee_has_project]  WITH CHECK ADD  CONSTRAINT [employee_has_project_fk0] FOREIGN KEY([project_id])
REFERENCES [dbo].[Projects] ([project_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee_has_project] CHECK CONSTRAINT [employee_has_project_fk0]
GO
ALTER TABLE [dbo].[employee_has_project]  WITH CHECK ADD  CONSTRAINT [employee_has_project_fk1] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee_has_project] CHECK CONSTRAINT [employee_has_project_fk1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [Funds_fk0] FOREIGN KEY([Entered_by])
REFERENCES [dbo].[Employees] ([employee_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [Funds_fk0]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [Funds_fk2] FOREIGN KEY([project_id])
REFERENCES [dbo].[Projects] ([project_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [Funds_fk2]
GO
ALTER TABLE [dbo].[Funds]  WITH CHECK ADD  CONSTRAINT [Funds_fk3] FOREIGN KEY([donor_id])
REFERENCES [dbo].[Donor] ([donor_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funds] CHECK CONSTRAINT [Funds_fk3]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Employees] FOREIGN KEY([Project_Leads])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Employees]
GO
ALTER TABLE [dbo].[Volunteer_of_Project]  WITH CHECK ADD  CONSTRAINT [Volunteer_of_Project_fk0] FOREIGN KEY([project_id])
REFERENCES [dbo].[Projects] ([project_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Volunteer_of_Project] CHECK CONSTRAINT [Volunteer_of_Project_fk0]
GO
ALTER TABLE [dbo].[Volunteer_of_Project]  WITH CHECK ADD  CONSTRAINT [Volunteer_of_Project_fk1] FOREIGN KEY([volunteer_id])
REFERENCES [dbo].[Volunteer] ([volunteer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Volunteer_of_Project] CHECK CONSTRAINT [Volunteer_of_Project_fk1]
GO
/****** Object:  StoredProcedure [dbo].[INS_DON]    Script Date: 12/3/2022 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INS_DON]
@DonName text, @DonType text, @PhoneNo text
as
  begin
    INSERT INTO Donor(Donor_name, Donor_type, Phone_Number)
	values (@DonName, @DonType, @PhoneNo)
  end           
GO
/****** Object:  StoredProcedure [dbo].[INS_EMP]    Script Date: 12/3/2022 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INS_EMP]
@RepTo int, @EmpPos bit, @EmpSalary float, @EmpName text, @PhoneNo text, @EmpAdd text,
@Password text, @EmpUID text, @CNIC text
as
  begin
    INSERT INTO Employees (ReportsTo, [Is Founder], Salary, Name, Phone_Number, Address, Password, User_ID, CNIC)
	values (@RepTo, @EmpPos, @EmpSalary, @EmpName, @PhoneNo, @EmpAdd, @Password, @EmpUID, @CNIC)
  end   
GO
/****** Object:  StoredProcedure [dbo].[INS_PROJ]    Script Date: 12/3/2022 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INS_PROJ]
@ProjectName text, @BudgetAllo float, @ProjectLeads int, @StartDate date, @CurrentStat text, @Location text 
as
  begin
    INSERT INTO Projects (Project_Name, Budget_Allocated, Project_Leads, Start_Date, End_date, Current_Status, Location)
    values (@ProjectName, @BudgetAllo, @ProjectLeads, @StartDate, NULL, @CurrentStat, @Location)
  end  
GO
/****** Object:  StoredProcedure [dbo].[INS_VOL]    Script Date: 12/3/2022 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INS_VOL]
@VolunteerName text, @PhoneNo text, @VolAddress text, @VolCNIC text
as
  begin
    INSERT INTO Volunteer (Volunteer_Name, Phone_Number, Address, CNIC)
    values (@VolunteerName, @PhoneNo, @VolAddress, @VolCNIC)
  end 
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_VOL]    Script Date: 12/3/2022 11:38:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UPDATE_VOL]
@VolID int, @VolName text, @PhoneNo text, @VolAdd text, @CNIC text
as
  begin
    update Volunteer
	set Volunteer_Name = @VolName, Phone_Number = @PhoneNo, Address = @VolAdd, CNIC = @CNIC
	
	from Volunteer V
	where V.volunteer_id = @VolID
  end
/*GO
USE [master]
GO*/
ALTER DATABASE [test1] SET  READ_WRITE 
GO
