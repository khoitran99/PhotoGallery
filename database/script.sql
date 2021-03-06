USE [master]
GO
/****** Object:  Database [photo1234]    Script Date: 6/17/2021 11:26:45 AM ******/
CREATE DATABASE [photo1234]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'photo1234', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\photo1234.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'photo1234_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\photo1234_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [photo1234] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [photo1234].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [photo1234] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [photo1234] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [photo1234] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [photo1234] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [photo1234] SET ARITHABORT OFF 
GO
ALTER DATABASE [photo1234] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [photo1234] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [photo1234] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [photo1234] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [photo1234] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [photo1234] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [photo1234] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [photo1234] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [photo1234] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [photo1234] SET  ENABLE_BROKER 
GO
ALTER DATABASE [photo1234] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [photo1234] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [photo1234] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [photo1234] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [photo1234] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [photo1234] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [photo1234] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [photo1234] SET RECOVERY FULL 
GO
ALTER DATABASE [photo1234] SET  MULTI_USER 
GO
ALTER DATABASE [photo1234] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [photo1234] SET DB_CHAINING OFF 
GO
ALTER DATABASE [photo1234] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [photo1234] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [photo1234] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'photo1234', N'ON'
GO
ALTER DATABASE [photo1234] SET QUERY_STORE = OFF
GO
USE [photo1234]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/17/2021 11:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[address] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[country] [nvarchar](max) NOT NULL,
	[telephone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[face_url] [nvarchar](max) NOT NULL,
	[twitter_url] [nvarchar](max) NOT NULL,
	[google_url] [nvarchar](max) NOT NULL,
	[about] [nvarchar](max) NOT NULL,
	[image_main] [nvarchar](max) NOT NULL,
	[content_main] [nvarchar](max) NOT NULL,
	[map] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 6/17/2021 11:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/17/2021 11:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gallery_id] [int] NOT NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Contact] ([address], [city], [country], [telephone], [email], [face_url], [twitter_url], [google_url], [about], [image_main], [content_main], [map]) VALUES (N'Tiên Tân , Phủ Lý , Hà Nam', N'Phủ Lý', N'Việt Nam', N'0965611359', N'khoitvhe130007@fpt.edu.vn', N'https://www.facebook.com/khoitran3799/', N'https://twitter.com/?lang=en', N'https://www.google.com/account/about/', N'Tôi tên là Trần Văn Khôi , sinh ngày 03/07/1999, quê ở Phủ Lý Hà Nam , hiện đang là sinh viên năm 4 nghành 
Software Engineer tại đại học FPT . Đây là 1 website cho bạn thấy những album ảnh do tôi tạo nên. Cảm ơn đã ghé thăm', N'main.jpg', N'Trần Văn Khôi - Tam Đảo - 2019', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29880.516021734227!2d105.91760142886551!3d20.58542329052919!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135cf088739fa1f%3A0xeb45b4a48777e425!2zVGnDqm4gVMOibiwgUGjhu6cgTMO9LCBIw6AgTmFtLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1623728048949!5m2!1sen!2s" width="900" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>')
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (1, N'View Gallery 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 1')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (2, N'View Gallery 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 2')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (3, N'View Gallery 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 3')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (4, N'View Gallery 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 4')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (5, N'View Gallery 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 5')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (6, N'View Gallery 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 6')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (7, N'View Gallery 7', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 7')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (1, 1, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (2, 1, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (3, 1, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (4, 1, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (5, 1, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (6, 1, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (7, 1, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (8, 1, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (9, 1, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (10, 2, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (11, 2, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (12, 2, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (13, 2, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (14, 2, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (15, 2, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (16, 2, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (17, 2, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (18, 2, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (19, 2, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (20, 3, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (21, 3, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (22, 3, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (23, 3, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (24, 3, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (25, 3, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (26, 3, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (27, 3, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (28, 3, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (29, 3, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (30, 4, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (31, 4, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (32, 4, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (33, 4, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (34, 4, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (35, 4, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (36, 4, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (37, 4, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (38, 4, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (39, 4, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (40, 5, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (41, 5, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (42, 5, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (43, 5, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (44, 5, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (45, 5, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (46, 5, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (47, 5, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (48, 5, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (49, 5, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (50, 6, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (51, 6, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (52, 6, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (53, 6, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (54, 6, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (55, 6, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (56, 6, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (57, 6, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (58, 6, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (59, 6, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (60, 7, N'bonus/1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (61, 7, N'bonus/2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (62, 7, N'bonus/3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (63, 7, N'bonus/4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (64, 7, N'bonus/5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (65, 7, N'bonus/6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (66, 7, N'bonus/7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (67, 7, N'bonus/8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (68, 7, N'bonus/9.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (69, 7, N'bonus/10.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (70, 7, N'bonus/11.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
ALTER TABLE [dbo].[Images]  WITH CHECK ADD FOREIGN KEY([gallery_id])
REFERENCES [dbo].[Gallery] ([id])
GO
USE [master]
GO
ALTER DATABASE [photo1234] SET  READ_WRITE 
GO
