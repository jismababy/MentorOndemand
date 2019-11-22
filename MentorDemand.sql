USE [master]
GO
/****** Object:  Database [Mentor_OnDemand]    Script Date: 11/22/2019 4:36:06 PM ******/
CREATE DATABASE [Mentor_OnDemand]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mentor_OnDemand', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Mentor_OnDemand.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mentor_OnDemand_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Mentor_OnDemand_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mentor_OnDemand] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mentor_OnDemand].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mentor_OnDemand] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mentor_OnDemand] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mentor_OnDemand] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Mentor_OnDemand] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mentor_OnDemand] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET RECOVERY FULL 
GO
ALTER DATABASE [Mentor_OnDemand] SET  MULTI_USER 
GO
ALTER DATABASE [Mentor_OnDemand] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mentor_OnDemand] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mentor_OnDemand] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mentor_OnDemand] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Mentor_OnDemand] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Mentor_OnDemand]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/22/2019 4:36:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mentor]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mentor](
	[mt_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mt_username] [varchar](50) NULL,
	[mt_password] [varchar](40) NULL,
	[mt_firstName] [varchar](25) NULL,
	[mt_lastName] [varchar](25) NULL,
	[mt_contactNumber] [bigint] NULL,
	[mt_linkedin_url] [varchar](50) NULL,
	[mt_reg_datetime] [date] NULL,
	[mt_reg_code] [bigint] NULL,
	[mt_years_of_experience] [int] NULL,
	[mt_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[mt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mentor_skills]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mentor_skills](
	[ms_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mid] [bigint] NULL,
	[sid] [bigint] NULL,
	[self_rating] [int] NULL,
	[years_of_exp] [int] NULL,
	[trainings_delivered] [int] NULL,
	[facilities_offered] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ms_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[technology_skills]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[technology_skills](
	[sk_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sk_name] [varchar](50) NULL,
	[sk_toc] [varchar](50) NULL,
	[sk_duration] [int] NULL,
	[sk_prerequites] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trainings](
	[tr_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[mentor_id] [bigint] NULL,
	[skill_id] [bigint] NULL,
	[status] [varchar](25) NULL,
	[progress] [varchar](25) NULL,
	[rating] [int] NULL,
	[start_date] [date] NULL,
	[amount_received] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[us_id] [bigint] IDENTITY(1,1) NOT NULL,
	[us_username] [varchar](40) NULL,
	[us_password] [varchar](40) NULL,
	[us_firstName] [varchar](25) NULL,
	[us_lastName] [varchar](25) NULL,
	[us_contactNumber] [bigint] NULL,
	[us_reg_datetime] [date] NULL,
	[us_regcode] [bigint] NULL,
	[us_force_reset_password] [bit] NULL,
	[us_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[us_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

GO
INSERT [dbo].[admin] ([id], [username], [password]) VALUES (1, N'baby', N'admin')
GO
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[mentor] ON 

GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (1, N'rony@gmail.com', N'rony50', N'Rony', N'Thomas', 9708987989, N'uyurwer', CAST(N'2019-09-03' AS Date), NULL, 4, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (2, N'kavya', N'kavya27', N'Kavya', N'K', 9087867890, N'jkjkjfdf', CAST(N'2019-09-09' AS Date), NULL, 2, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (3, N'56756', N'65757', N'utyui', N'ytyerty', 534634, N'ytityi', NULL, NULL, 55, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (4, N'rtewt', N'rtrt', N'trtrt', N'trt', 9447486063, N'rtret', NULL, NULL, 44, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (5, N'vishal@gmail.com', N'vishal23', N'vishal', N'wilson', 9808900007, N'hijok', NULL, NULL, 2, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (6, N'finu@gmail.com', N'finunazar', N'Finu', N'Nazar', 8902344555, N'gdhgdjhfgjtyj', NULL, NULL, 22, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (7, N'rtert', N'terteerterte', N'trete', N'terte', 7566786786, N'dfghdfhdfh', NULL, NULL, 45, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (8, N'rwer', N'trtrteryteryety', N'tertert', N'tertery', 8909090909, N'eryteryery', NULL, NULL, 45, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (9, N'tuy', N'tyutyuyu', N'tyutyuty', N'utyuty', 8645645756, N'tiuiyuoyuo', NULL, NULL, 45, NULL)
GO
INSERT [dbo].[mentor] ([mt_id], [mt_username], [mt_password], [mt_firstName], [mt_lastName], [mt_contactNumber], [mt_linkedin_url], [mt_reg_datetime], [mt_reg_code], [mt_years_of_experience], [mt_active]) VALUES (10, N'deepak@gmail.com', N'deepak22', N'Deepak', N'Mathew', 8921470455, N'hhyhjyj', NULL, NULL, 45, NULL)
GO
SET IDENTITY_INSERT [dbo].[mentor] OFF
GO
SET IDENTITY_INSERT [dbo].[mentor_skills] ON 

GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (1, 2, 1, 8, 5, 20, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (2, 5, 3, 9, 4, 22, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (3, 3, 1, 6, 6, 12, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (4, NULL, NULL, 6, 34, 43, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (5, 2, NULL, 6, 56, 76, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (6, 2, NULL, 6, 56, 67, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (7, 2, 1, 6, 45, 44, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (8, 5, 2, 9, 44, 454, N'all')
GO
INSERT [dbo].[mentor_skills] ([ms_id], [mid], [sid], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (9, 10, 6, 8, 34, 56, N'all')
GO
SET IDENTITY_INSERT [dbo].[mentor_skills] OFF
GO
SET IDENTITY_INSERT [dbo].[technology_skills] ON 

GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (1, N'Full Stack Developer', N'Dotnet', 2, N'Html and Csharp')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (2, N'Full Stack Developer', N'Java', 4, N'Html and Java')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (3, N'Full Stack ', N'Dotnet', 6, N'Html')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (4, N'FSD-JAVA', N'Java', 12, N'Html and basics')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (5, N'FSD-Dotnet', N'Dotnet', 16, N'Basics')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (6, N'AI', N'AI', 24, N'Basics')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (7, N'Oracle', N'DB', 10, N'Basics')
GO
INSERT [dbo].[technology_skills] ([sk_id], [sk_name], [sk_toc], [sk_duration], [sk_prerequites]) VALUES (8, N'Big Data', N'Machine Learning', 22, N'Basics')
GO
SET IDENTITY_INSERT [dbo].[technology_skills] OFF
GO
SET IDENTITY_INSERT [dbo].[trainings] ON 

GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (1, 3, 3, 3, N'nominated', N'yes', 6, CAST(N'2019-05-22' AS Date), 5000)
GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (4, 1, 3, 3, N'Nominated', N'yes', 8, NULL, 5000)
GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (5, 1, 2, 1, N'Nominated', N'yes', 8, NULL, 5000)
GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (6, 1, 3, 1, N'Nominated', N'In Progress', 6, NULL, 5000)
GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (7, 1, 5, 3, N'Nominated', N'In Progress', 9, NULL, 5000)
GO
INSERT [dbo].[trainings] ([tr_id], [user_id], [mentor_id], [skill_id], [status], [progress], [rating], [start_date], [amount_received]) VALUES (8, 30, 5, 3, N'Nominated', N'In Progress', 9, NULL, 5000)
GO
SET IDENTITY_INSERT [dbo].[trainings] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (1, N'clara@gmail.com', N'clara21', N'clara', N'trisa', 9447486062, CAST(N'2019-12-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (2, N'veera@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (3, N'jis@gmail.com', N'jisma23', N'jisma', N'baby', 9400499009, CAST(N'2019-09-12' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (5, N'jisma@gmail.com', N'jisma23', N'jisma', N'baby', 9400499008, CAST(N'2019-09-12' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (6, N'gj', N'423', N'erter', N'eryery', 34534, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (9, N'', N'', N'Finu', N'Nazar', 7890678000, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (24, N'erwe', N'rer', N'Finu', N'Nazar', 7890678044, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (28, N'dsfs', N'rttreytytyty', N'ytyty', N'yrtyrtrtu', 7878787878, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (29, N'elsy@gmail.com', N'elsybaby52', N'Elsy', N'Baby', 9090909809, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[users] ([us_id], [us_username], [us_password], [us_firstName], [us_lastName], [us_contactNumber], [us_reg_datetime], [us_regcode], [us_force_reset_password], [us_active]) VALUES (30, N'karthika', N'karthika22', N'karthika', N'k', 8909089008, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [UQ__mentor__7AAD9C7254AA19F1]    Script Date: 11/22/2019 4:36:07 PM ******/
ALTER TABLE [dbo].[mentor] ADD UNIQUE NONCLUSTERED 
(
	[mt_contactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__mentor__9F49C30A90CB546D]    Script Date: 11/22/2019 4:36:07 PM ******/
ALTER TABLE [dbo].[mentor] ADD UNIQUE NONCLUSTERED 
(
	[mt_linkedin_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__mentor__D40B05D144D31A36]    Script Date: 11/22/2019 4:36:07 PM ******/
ALTER TABLE [dbo].[mentor] ADD UNIQUE NONCLUSTERED 
(
	[mt_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__users__05F9FF1DC929BA72]    Script Date: 11/22/2019 4:36:07 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[us_contactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__07AF65FA50AB6585]    Script Date: 11/22/2019 4:36:07 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[us_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mentor_skills]  WITH CHECK ADD FOREIGN KEY([mid])
REFERENCES [dbo].[mentor] ([mt_id])
GO
ALTER TABLE [dbo].[mentor_skills]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[technology_skills] ([sk_id])
GO
ALTER TABLE [dbo].[trainings]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[mentor] ([mt_id])
GO
ALTER TABLE [dbo].[trainings]  WITH CHECK ADD FOREIGN KEY([skill_id])
REFERENCES [dbo].[technology_skills] ([sk_id])
GO
ALTER TABLE [dbo].[trainings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([us_id])
GO
/****** Object:  StoredProcedure [dbo].[get_mentorlist]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_mentorlist] 
as select mentor_skills.ms_id as Msid,mentor_skills.mid as Mtid,mentor_skills.sid as Skid,mentor.mt_firstName as FirstName,
    mentor.mt_lastName as LastName,technology_skills.sk_name as SkName,mentor_skills.self_rating as SelfRating,mentor_skills.years_of_exp as Yearsofexperience
	from mentor,mentor_skills,technology_skills where mentor_skills.mid=mentor.mt_id and mentor_skills.sid=technology_skills.sk_id;

GO
/****** Object:  StoredProcedure [dbo].[sp_login_admin]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_login_admin] (@user varchar(40),@pass varchar(40))
as select * from admin  where username=@user and password=@pass
GO
/****** Object:  StoredProcedure [dbo].[sp_login_mentor]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_login_mentor] (@user varchar(40),@pass varchar(40))
as select * from mentor  where mt_username=@user and mt_password=@pass
GO
/****** Object:  StoredProcedure [dbo].[sp_login_user]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_login_user] (@user varchar(40),@pass varchar(40))
as select * from users  where us_username=@user and us_password=@pass
GO
/****** Object:  StoredProcedure [dbo].[sp_nominate]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_nominate] (@usud bigint,@mtid bigint,@skid bigint,@rating int)
as insert into trainings values(@usud,@mtid,@skid,'Nominated','In Progress',@rating,null,'5000')
GO
/****** Object:  StoredProcedure [dbo].[sp_regmentor]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_regmentor] (@user varchar(50),@pass varchar(40),@first varchar(25),@last varchar(25),@contact bigint,@link varchar(50),@year int)
as insert into mentor values(@user,@pass,@first,@last,@contact,@link,null,null,@year,null)
GO
/****** Object:  StoredProcedure [dbo].[sp_reguser]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_reguser] (@user varchar(40),@pass varchar(40),@first varchar(25),@last varchar(25),@contact bigint)
as insert into users values(@user,@pass,@first,@last,@contact,null,null,null,null)
GO
/****** Object:  StoredProcedure [dbo].[viewnominate]    Script Date: 11/22/2019 4:36:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[viewnominate] (@menid bigint)
as select * from trainings where mentor_id=@menid
GO
USE [master]
GO
ALTER DATABASE [Mentor_OnDemand] SET  READ_WRITE 
GO
