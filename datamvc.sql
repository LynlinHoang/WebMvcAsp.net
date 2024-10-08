USE [master]
GO
/****** Object:  Database [datamvc]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE DATABASE [datamvc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datamvc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\datamvc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'datamvc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\datamvc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [datamvc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [datamvc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [datamvc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [datamvc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [datamvc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [datamvc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [datamvc] SET ARITHABORT OFF 
GO
ALTER DATABASE [datamvc] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [datamvc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [datamvc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [datamvc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [datamvc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [datamvc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [datamvc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [datamvc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [datamvc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [datamvc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [datamvc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [datamvc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [datamvc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [datamvc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [datamvc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [datamvc] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [datamvc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [datamvc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [datamvc] SET  MULTI_USER 
GO
ALTER DATABASE [datamvc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [datamvc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [datamvc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [datamvc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [datamvc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [datamvc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [datamvc] SET QUERY_STORE = OFF
GO
USE [datamvc]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPostComment]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPostComment](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[BlogPostId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BlogPostComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPostLike]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPostLike](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[BlogPostId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BlogPostLike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPosts]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPosts](
	[Id] [uniqueidentifier] NOT NULL,
	[Heading] [nvarchar](max) NOT NULL,
	[PageTile] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ShortDescription] [nvarchar](max) NOT NULL,
	[FeaturedImageUrl] [nvarchar](max) NOT NULL,
	[UrlHandle] [nvarchar](max) NOT NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_BlogPosts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPostTag]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPostTag](
	[BlogPostId] [uniqueidentifier] NOT NULL,
	[TagsId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BlogPostTag] PRIMARY KEY CLUSTERED 
(
	[BlogPostId] ASC,
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyComment]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComment](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[BlogPostId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[CommentId] [uniqueidentifier] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ReplyComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 9/5/2024 4:56:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240808073256_Initial Migration', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240812045202_Edit BlogPost', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240813080639_create ChatRoom', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240814082521_RemoveChatRoom', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240816015548_Adding', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240816032728_EditBlogPostLike', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240816084738_Create Comment', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240827060904_AddData', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240829071348_Add ReplayComment', N'8.0.7')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'02f463da-68b9-4325-9e59-7dd33dbeaaaa', N'Admin', N'Admin', N'02f463da-68b9-4325-9e59-7dd33dbeaaaa')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'95046b92-547f-4721-8466-c6b78020c101', N'SuperAdmin', N'SuperAdmin', N'95046b92-547f-4721-8466-c6b78020c101')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a7f945cf-7bfa-4e77-b6b2-c6eaa0d5fbbb', N'User', N'User', N'a7f945cf-7bfa-4e77-b6b2-c6eaa0d5fbbb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1990ecf6-afa4-4efe-8a21-061c30de6197', N'02f463da-68b9-4325-9e59-7dd33dbeaaaa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1990ecf6-afa4-4efe-8a21-061c30de6197', N'95046b92-547f-4721-8466-c6b78020c101')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1990ecf6-afa4-4efe-8a21-061c30de6197', N'a7f945cf-7bfa-4e77-b6b2-c6eaa0d5fbbb')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1990ecf6-afa4-4efe-8a21-061c30de6197', N'superadmin@blog.com', N'SUPERADMIN@BLOG.COM', N'superadmin@blog.com', N'SUPERADMIN@BLOG.COM', 0, N'AQAAAAIAAYagAAAAEFZ5EFiIcWLXLEqqdzj8T3f+8QUZril7Cdz+WoBH3/82fuEUCXYVbr/WHqm/qkbHxA==', N'07ae9abe-636d-497e-9b71-b08a0cdf82d6', N'cf428079-59db-4b39-b4d0-2bf96220ba96', NULL, 0, 0, NULL, 0, 0)
GO
INSERT [dbo].[BlogPosts] ([Id], [Heading], [PageTile], [Content], [ShortDescription], [FeaturedImageUrl], [UrlHandle], [PublishedDate], [Author], [Visible]) VALUES (N'3e698d79-035e-4036-6b94-08dcbaa50700', N'Roses are not only a flower with timeless beauty but also an important part of human culture and life.', N'Roses are not only a flower with timeless beauty but also an important part of human culture and life.', N'<p id="isPasted">Roses, often regarded as the &quot;queen&quot; of flowers, have long held a special place in the human heart. With their diverse hues and captivating fragrance, roses are not only symbols of love but also emblems of timeless beauty.</p><p><strong>Captivating Beauty</strong></p><p>A bouquet of roses, with its soft, plump petals and rich array of colors, can mesmerize anyone. Each color of rose carries its own unique meaning, from the delicate blush of pink to the vivid brilliance of red. Red roses symbolize deep and passionate love, while white roses represent purity and eternal love.</p><p>The fragrance of roses is an integral part of their allure. Every whiff of rose scent not only provides a pleasant aroma but also evokes a sense of tranquility and relaxation.</p>', N'Roses, often regarded as the "queen" of flowers, have long held a special place in the human heart. With their diverse hues and captivating fragrance, roses are not only symbols of love but also emblems of timeless beauty.', N'https://res.cloudinary.com/dxoqtvl4i/image/upload/v1723623098/gapox9jlvisfk6yx7jkc.jpg', N'A bouquet of roses, with its soft, plump petals and rich array of colors, can mesmerize anyone. Each color of rose carries its own unique meaning, from the delicate blush of pink to the vivid brilliance of red. Red roses symbolize deep and passionate love, while white roses represent purity and eternal love.', CAST(N'2024-08-14T00:00:00.0000000' AS DateTime2), N'Lyn', 0)
INSERT [dbo].[BlogPosts] ([Id], [Heading], [PageTile], [Content], [ShortDescription], [FeaturedImageUrl], [UrlHandle], [PublishedDate], [Author], [Visible]) VALUES (N'89a674f4-4ae6-4cfa-9ce2-08dcbc12a379', N'Heading', N'Page Title', N'<p><span id="isPasted" style=''color: rgb(33, 37, 41); font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;''>Content</span><br><span id="isPasted" style=''color: rgb(33, 37, 41); font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;''>Content</span><br><br><br></p>', N'ShortDescription', N'https://res.cloudinary.com/dxoqtvl4i/image/upload/v1723618108/fushwf8pfyjtapxmz0fz.jpg', N'UrlHandle ', CAST(N'2024-08-14T00:00:00.0000000' AS DateTime2), N'Author', 0)
INSERT [dbo].[BlogPosts] ([Id], [Heading], [PageTile], [Content], [ShortDescription], [FeaturedImageUrl], [UrlHandle], [PublishedDate], [Author], [Visible]) VALUES (N'23035547-872b-4ad2-f4e7-08dcbcd41d08', N'When you want to give up, remember why you started ', N'When you want to give up, remember why you started ', N'<p><strong id="isPasted" style=''box-sizing: border-box; font-weight: 700; color: rgb(34, 34, 34); font-family: Verdana, BlinkMacSystemFont, -apple-system, "segoe ui", Roboto, Oxygen, Ubuntu, Cantarell, "open sans", "helvetica neue", sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;''>When you want to give up, remember why you started</strong>&nbsp;</p><p><img src="https://res.cloudinary.com/dxoqtvl4i/image/upload/v1723690021/rpkklgkyflj74nfhq3yj.jpg" style="width: 114px;" class="fr-fic fr-dib"></p>', N'Short Description', N'https://res.cloudinary.com/dxoqtvl4i/image/upload/v1723690038/kpvivtqeuqacwd5rf1p0.jpg', N'When you want to give up, remember why you started ', CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), N'Author', 0)
INSERT [dbo].[BlogPosts] ([Id], [Heading], [PageTile], [Content], [ShortDescription], [FeaturedImageUrl], [UrlHandle], [PublishedDate], [Author], [Visible]) VALUES (N'5a9b7398-1e5b-40af-df48-08dcc0ca7984', N'When you want to give up, remember why you started ', N'When you want to give up, remember why you started ', N'<p>When you want to give up, remember why you started</p>', N'Roses, often regarded as the "queen" of flowers, have long held a special place in the human heart. With their diverse hues and captivating fragrance, roses are not only symbols of love but also emblems of timeless beauty.', N'https://res.cloudinary.com/dxoqtvl4i/image/upload/v1724125325/uoldorfdesllv9qyvjim.jpg', N'A bouquet of roses, with its soft, plump petals and rich array of colors, can mesmerize anyone. Each color of rose carries its own unique meaning, from the delicate blush of pink to the vivid brilliance of red. Red roses symbolize deep and passionate love, while white roses represent purity and eternal love.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Author', 1)
GO
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'89a674f4-4ae6-4cfa-9ce2-08dcbc12a379', N'e2ccaa3d-b87f-434e-5930-08dcb825789b')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'23035547-872b-4ad2-f4e7-08dcbcd41d08', N'e2ccaa3d-b87f-434e-5930-08dcb825789b')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'89a674f4-4ae6-4cfa-9ce2-08dcbc12a379', N'8bee8450-0945-443b-5932-08dcb825789b')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'23035547-872b-4ad2-f4e7-08dcbcd41d08', N'8bee8450-0945-443b-5932-08dcb825789b')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'5a9b7398-1e5b-40af-df48-08dcc0ca7984', N'8bee8450-0945-443b-5932-08dcb825789b')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'5a9b7398-1e5b-40af-df48-08dcc0ca7984', N'30f77ae5-a059-455e-dcf8-08dcb8412e56')
INSERT [dbo].[BlogPostTag] ([BlogPostId], [TagsId]) VALUES (N'3e698d79-035e-4036-6b94-08dcbaa50700', N'62a4d4b6-3706-49c1-0f64-08dcc0565270')
GO
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'e2ccaa3d-b87f-434e-5930-08dcb825789b', N'Business ', N'Entityfreamwork ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'8bee8450-0945-443b-5932-08dcb825789b', N'Technology ', N'Entityfreamwork ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'30f77ae5-a059-455e-dcf8-08dcb8412e56', N'Education ', N'Entityfreamwork ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'dfd131d4-6971-415d-fab4-08dcbff7221c', N'Social Sciences', N'Entityfreamwork ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'09cd841a-4750-4636-fab5-08dcbff7221c', N'Economics ', N'Entityfreamwork ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'62a4d4b6-3706-49c1-0f64-08dcc0565270', N'Entertainment ', N'Entertainment')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'bdb8ba5a-512b-411c-0f65-08dcc0565270', N'Environment ', N'Environment ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'e504bcbd-b1e6-4ab9-0f66-08dcc0565270', N'Politics ', N'Politics ')
INSERT [dbo].[Tags] ([Id], [Name], [DisplayName]) VALUES (N'b7e6ae35-09c6-4d99-702f-08dcc0e64d8b', N'Business', N'Environment ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogPostComment_BlogPostId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostComment_BlogPostId] ON [dbo].[BlogPostComment]
(
	[BlogPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BlogPostComment_UserId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostComment_UserId] ON [dbo].[BlogPostComment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogPostLike_BlogPostId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostLike_BlogPostId] ON [dbo].[BlogPostLike]
(
	[BlogPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BlogPostLike_UserId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostLike_UserId] ON [dbo].[BlogPostLike]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogPostTag_TagsId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostTag_TagsId] ON [dbo].[BlogPostTag]
(
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReplyComment_CommentId]    Script Date: 9/5/2024 4:56:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReplyComment_CommentId] ON [dbo].[ReplyComment]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlogPostLike] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BlogPostId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlogPostComment]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostComment_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostComment] CHECK CONSTRAINT [FK_BlogPostComment_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlogPostComment]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostComment_BlogPosts_BlogPostId] FOREIGN KEY([BlogPostId])
REFERENCES [dbo].[BlogPosts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostComment] CHECK CONSTRAINT [FK_BlogPostComment_BlogPosts_BlogPostId]
GO
ALTER TABLE [dbo].[BlogPostLike]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostLike_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostLike] CHECK CONSTRAINT [FK_BlogPostLike_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlogPostLike]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostLike_BlogPosts_BlogPostId] FOREIGN KEY([BlogPostId])
REFERENCES [dbo].[BlogPosts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostLike] CHECK CONSTRAINT [FK_BlogPostLike_BlogPosts_BlogPostId]
GO
ALTER TABLE [dbo].[BlogPostTag]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostTag_BlogPosts_BlogPostId] FOREIGN KEY([BlogPostId])
REFERENCES [dbo].[BlogPosts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostTag] CHECK CONSTRAINT [FK_BlogPostTag_BlogPosts_BlogPostId]
GO
ALTER TABLE [dbo].[BlogPostTag]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostTag_Tags_TagsId] FOREIGN KEY([TagsId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPostTag] CHECK CONSTRAINT [FK_BlogPostTag_Tags_TagsId]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_BlogPostComment_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[BlogPostComment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_BlogPostComment_CommentId]
GO
USE [master]
GO
ALTER DATABASE [datamvc] SET  READ_WRITE 
GO
