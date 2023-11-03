USE [WEB_XEM_PHIM]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id_comment] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NULL,
	[user_id] [int] NULL,
	[comment] [ntext] NOT NULL,
	[value] [int] NOT NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id_comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episode](
	[episode_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[episode] [int] NOT NULL,
	[season] [nvarchar](50) NOT NULL,
	[source] [varchar](255) NOT NULL,
	[movie_id] [int] NOT NULL,
	[day_submit] [datetime] NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[episode_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[user_id] [int] NOT NULL,
	[episode_id] [int] NOT NULL,
	[time_stamp] [float] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[episode_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[language_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[movie_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[movie_content] [ntext] NOT NULL,
	[episodes] [int] NULL,
	[movie_shedule] [int] NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[country_id] [int] NOT NULL,
	[views] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Category]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Category](
	[movie_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Category] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Collection]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Collection](
	[movie_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK_Movie_Collection] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Company]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Company](
	[movie_id] [int] NOT NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Company] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Language]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Language](
	[movie_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_Move_Language] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Person]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Person](
	[movie_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
 CONSTRAINT [PK_Movie_Person] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_User]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[name] [nvarchar](20) NULL,
	[email] [varchar](100) NULL,
	[role_id] [int] NULL,
	[avatar] [varchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[gender] [int] NULL,
	[day_of_birth] [datetime] NULL,
	[image] [varchar](100) NOT NULL,
	[describe] [ntext] NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name]) VALUES (1, N'anime')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (2, N'hành động')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (3, N'cổ trang')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (55, 9, 1, N'good movie', 3, CAST(N'2023-10-01T11:00:07.397' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (56, 7, 1, N'aaaaa', 1, CAST(N'2023-10-07T13:56:45.640' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (57, 7, 1, N'ssssss', 1, CAST(N'2023-10-07T14:00:38.143' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (58, 7, 1, N'sssssssss', 1, CAST(N'2023-10-07T14:06:05.147' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (59, 7, 1, N'bbbbbbb', 1, CAST(N'2023-10-07T14:06:32.230' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (60, 7, 1, N'thử nghiệm code binh luận', 1, CAST(N'2023-10-17T17:49:29.327' AS DateTime))
INSERT [dbo].[Comment] ([id_comment], [movie_id], [user_id], [comment], [value], [date]) VALUES (61, 7, 1, N'thử nghiệm code binh luận', 1, CAST(N'2023-10-17T17:49:45.300' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([company_id], [name]) VALUES (1, N' Nippon Television Network')
INSERT [dbo].[Company] ([company_id], [name]) VALUES (2, N'Houbunsha')
INSERT [dbo].[Company] ([company_id], [name]) VALUES (3, N' ufotable')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([country_id], [name]) VALUES (1, N'VN')
INSERT [dbo].[Country] ([country_id], [name]) VALUES (2, N'United States')
INSERT [dbo].[Country] ([country_id], [name]) VALUES (3, N'Janpan')
INSERT [dbo].[Country] ([country_id], [name]) VALUES (4, N'Vietnam')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Episode] ON 

INSERT [dbo].[Episode] ([episode_id], [name], [episode], [season], [source], [movie_id], [day_submit]) VALUES (9, N'Ep 1', 1, N'season 1', N'Ep 1_10h56m4s.mp4', 7, CAST(N'2023-10-01T10:56:04.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Episode] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([language_id], [name]) VALUES (1, N'English')
INSERT [dbo].[Language] ([language_id], [name]) VALUES (2, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (6, N'Toy Story', N'Toy Story is a 1995 American computer-animated comedy film produced by Pixar Animation Studios and released by Walt Disney Pictures. The first installment in the Toy Story franchise, it was the first entirely computer-animated feature film, as well as the first feature film from Pixar. ', 100, 2, N'toystory.png', 2, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (7, N'THE THREE MUSKETEERS', N' Leaving his country village, D''Artagnan (Douglas Fairbanks) heads to Paris in hopes of becoming a musketeer.', 1, 3, N'three.png', 2, 10)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (8, N'Kimi no Na wa.', N'Mitsuha Miyamizu, a high school girl, yearns to live the life of a boy in the bustling city of Tokyo—a dream that stands in stark contrast to her present life in the countryside. Meanwhile in the city, Taki Tachibana lives a busy life as a high school student while juggling his part-time job and hopes for a future in architecture.', 1, 4, N'yourname.png', 3, 100)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (9, N'Princess Mononoke', N'When an Emishi village is attacked by a fierce demon boar, the young prince Ashitaka puts his life at stake to defend his tribe. With its dying breath, the beast curses the prince''s arm, granting him demonic powers while gradually siphoning his life away. Instructed by the village elders to travel westward for a cure', 12, 3, N'PrincessMononoke_10h42m15s.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (10, N'Mahou Shoujo Madoka', N'The young girls of Mitakihara happily live their lives, occasionally fighting off evil, but otherwise going about their peaceful, everyday routines. However, Homura Akemi feels that something is wrong with this unusually pleasant atmosphere—though the others remain oblivious, she can''t help but suspect that there is more to what is going on than meets the eye: someone who should not exist is currently present to join in on their activities.', 1, 3, N'MahouShoujoMadoka_10h47m6s.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (12, N'Kara no Kyoukai ', N'In February 1999, a string of murders has Shiki Ryougi and Mikiya Kokutou on edge. These crimes share a disturbing resemblance to a similar set of homicides from 1995, when Shiki and Mikiya first met, and awaken a dark, murderous desire that has laid dormant within Shiki''s soul ever since then.', 12, 3, N'kk.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (13, N'Natsume Yujin-cho', N'Takashi Natsume and his spirit companion Madara, nicknamed "Nyanko," continue returning the names of spirits from the Book of Friends given by his late grandmother Reiko Natsume.', 13, 3, N'NatsumeYujin-cho_11h2m44s.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (14, N'Steins;Gate', N'ccentric scientist Rintarou Okabe has a never-ending thirst for scientific exploration. Together with his ditzy but well-meaning friend Mayuri Shiina and his roommate Itaru Hashida, Rintarou founds the Future Gadget Laboratory in the hopes of creating technological innovations that baffle the human psyche. ', 1, 4, N'SteinsGate_11h4m16s.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (15, N'Bocchi the Rock!', N'Yearning to make friends and perform live with a band, lonely and socially anxious Hitori "Bocchi" Gotou devotes her time to playing the guitar. On a fateful day, Bocchi meets the outgoing drummer Nijika Ijichi', 1, 4, N'BocchitheRock!_11h13m11s.png', 3, 0)
INSERT [dbo].[Movie] ([movie_id], [name], [movie_content], [episodes], [movie_shedule], [image], [country_id], [views]) VALUES (16, N'Cha', N'Đang Cập Nhật', 2, 2, N'Cha_15h18m1s.png', 4, 0)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (7, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (9, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (10, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (12, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (13, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (14, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (15, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (16, 1)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (9, 2)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (10, 2)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (12, 2)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (9, 3)
INSERT [dbo].[Movie_Category] ([movie_id], [category_id]) VALUES (13, 3)
GO
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (9, 1)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (10, 2)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (12, 3)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (13, 3)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (14, 1)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (15, 2)
INSERT [dbo].[Movie_Company] ([movie_id], [company_id]) VALUES (16, 1)
GO
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (9, 1, 0)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (10, 1, 0)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (12, 1, 1)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (13, 1, 1)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (14, 1, 0)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (15, 1, 0)
INSERT [dbo].[Movie_Language] ([movie_id], [language_id], [type]) VALUES (16, 1, 0)
GO
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (9, 2)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (10, 1)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (10, 2)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (12, 2)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (13, 2)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (14, 1)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (15, 2)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (16, 1)
INSERT [dbo].[Movie_Person] ([movie_id], [person_id]) VALUES (16, 2)
GO
SET IDENTITY_INSERT [dbo].[Movie_User] ON 

INSERT [dbo].[Movie_User] ([user_id], [user_name], [password], [name], [email], [role_id], [avatar]) VALUES (1, N'gojo', N'123', N'aaaa', N'abc@gmail.com', 1, N'default.png')
INSERT [dbo].[Movie_User] ([user_id], [user_name], [password], [name], [email], [role_id], [avatar]) VALUES (2, N'nguyenvana', N'$2a$10$t3SDsd13oA/zQFcwEUhBFe.4spupIt0b5kvQWTbWAgD5.B4w/swPi', N'nguyenvana', N'nguyenvana@gmail.com', 1, N'default.png')
SET IDENTITY_INSERT [dbo].[Movie_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([person_id], [name], [gender], [day_of_birth], [image], [describe], [country_id]) VALUES (1, N'Naruto', 0, CAST(N'2023-09-29T00:00:00.000' AS DateTime), N'naruto.jpg', NULL, 1)
INSERT [dbo].[Person] ([person_id], [name], [gender], [day_of_birth], [image], [describe], [country_id]) VALUES (2, N'Sasuke', 0, CAST(N'2023-09-28T00:00:00.000' AS DateTime), N'sasuke.jpg', N'', 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name]) VALUES (1, N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
/****** Object:  Index [IX_Date]    Script Date: 03-Nov-23 3:19:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Date] ON [dbo].[Comment]
(
	[date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category]    Script Date: 03-Nov-23 3:19:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Category] ON [dbo].[Movie_Category]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 03-Nov-23 3:19:41 PM ******/
ALTER TABLE [dbo].[Movie_User] ADD  CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_views]  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Movie]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Movie_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Movie_User] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Movie_User]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Movie]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Episode] FOREIGN KEY([episode_id])
REFERENCES [dbo].[Episode] ([episode_id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Episode]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Movie_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Movie_User] ([user_id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Movie_User]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Country]
GO
ALTER TABLE [dbo].[Movie_Category]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Category_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Movie_Category] CHECK CONSTRAINT [FK_Movie_Category_Category]
GO
ALTER TABLE [dbo].[Movie_Category]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Category_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Movie_Category] CHECK CONSTRAINT [FK_Movie_Category_Movie]
GO
ALTER TABLE [dbo].[Movie_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Collection_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Movie_Collection] CHECK CONSTRAINT [FK_Movie_Collection_Movie]
GO
ALTER TABLE [dbo].[Movie_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Collection_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Movie_User] ([user_id])
GO
ALTER TABLE [dbo].[Movie_Collection] CHECK CONSTRAINT [FK_Movie_Collection_User]
GO
ALTER TABLE [dbo].[Movie_Company]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Company_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([company_id])
GO
ALTER TABLE [dbo].[Movie_Company] CHECK CONSTRAINT [FK_Movie_Company_Company]
GO
ALTER TABLE [dbo].[Movie_Company]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Company_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Movie_Company] CHECK CONSTRAINT [FK_Movie_Company_Movie]
GO
ALTER TABLE [dbo].[Movie_Language]  WITH CHECK ADD  CONSTRAINT [FK_Move_Language_Language] FOREIGN KEY([language_id])
REFERENCES [dbo].[Language] ([language_id])
GO
ALTER TABLE [dbo].[Movie_Language] CHECK CONSTRAINT [FK_Move_Language_Language]
GO
ALTER TABLE [dbo].[Movie_Language]  WITH CHECK ADD  CONSTRAINT [FK_Move_Language_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Movie_Language] CHECK CONSTRAINT [FK_Move_Language_Movie]
GO
ALTER TABLE [dbo].[Movie_Person]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Person_Movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Movie_Person] CHECK CONSTRAINT [FK_Movie_Person_Movie]
GO
ALTER TABLE [dbo].[Movie_Person]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Person_Person] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([person_id])
GO
ALTER TABLE [dbo].[Movie_Person] CHECK CONSTRAINT [FK_Movie_Person_Person]
GO
ALTER TABLE [dbo].[Movie_User]  WITH CHECK ADD  CONSTRAINT [FK_Movie_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Movie_User] CHECK CONSTRAINT [FK_Movie_User_Role]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Country]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [CK_VALUE] CHECK  (([value]>=(1) AND [value]<=(10)))
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [CK_VALUE]
GO
/****** Object:  StoredProcedure [dbo].[Person_id_name]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Person_id_name]
as
begin
select person_id,name from Person
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_COLLECTION]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ADD_COLLECTION]
	@user_id INT, @movie_id INT
AS
BEGIN
	INSERT INTO Movie_Collection
	VALUES (@movie_id, @user_id, GETDATE())
	SELECT 1
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_EXISTS_COUNTRY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHECK_EXISTS_COUNTRY]
@name nvarchar(50) AS
BEGIN
	IF EXISTS(SELECT 1 FROM Country WHERE name = @name)
		SELECT '1'
	ELSE
		SELECT '0'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_COUNT_COMMENT_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_COUNT_COMMENT_MOVIE]
@id int AS
BEGIN
	SELECT count_cm =COUNT(id_comment) FROM Comment WHERE movie_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_COUNT_MOVIE_CATEGORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_COUNT_MOVIE_CATEGORY]
@category nvarchar(50)
AS
BEGIN
	SELECT COUNT(MC.movie_id) FROM
	(SELECT category_id FROM Category WHERE name = @category) CA INNER JOIN 
	(SELECT category_id, movie_id FROM Movie_Category WITH(INDEX(IX_Category))) MC ON MC.category_id = CA.category_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_COUNT_SEARCH_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_COUNT_SEARCH_MOVIE]
@input varchar(100)
AS
BEGIN
	SELECT movie_count=COUNT(movie_id) FROM Movie WHERE name LIKE '%'+@input+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_ACTORS]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_ACTORS]
@id int AS
BEGIN
	DELETE FROM Person WHERE person_id =@id
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_EPISODE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_EPISODE]
	@movie_id INT, @episode INT
AS
BEGIN
	DECLARE @totalEpisodeNow INT
	DECLARE @episode_id INT
	SELECT @totalEpisodeNow = COUNT(*) FROM Episode WHERE movie_id = @movie_id GROUP BY movie_id

	IF @totalEpisodeNow > 1
	BEGIN
		SELECT @episode_id = episode_id FROM Episode WHERE movie_id = @movie_id AND episode = @episode
		DELETE FROM History WHERE episode_id = @episode_id
		DELETE FROM Episode WHERE episode_id = @episode_id
	END
	ELSE
	BEGIN
		SELECT @episode_id = episode_id FROM Episode WHERE movie_id = @movie_id AND episode = @episode
		DELETE FROM History WHERE episode_id = @episode_id
		DELETE FROM Movie_Person WHERE movie_id = @movie_id
		DELETE FROM Comment WHERE movie_id = @movie_id
		DELETE FROM Movie_Collection WHERE movie_id = @movie_id
		DELETE FROM Move_Language WHERE movie_id = @movie_id
		DELETE FROM Movie_Company WHERE movie_id = @movie_id
		DELETE FROM Movie_Category WHERE movie_id = @movie_id
		DELETE FROM Episode WHERE movie_id = @movie_id
		DELETE FROM Movie WHERE movie_id = @movie_id
	END
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_HISTORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_HISTORY]
	@user_id INT, @movie_id INT, @episode INT
AS
BEGIN
	DECLARE @episode_id INT
	SELECT @episode_id = episode_id FROM Episode WHERE movie_id = @movie_id AND episode = @episode
	DELETE FROM History WHERE user_id = @user_id AND episode_id = @episode_id
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_INFORMATION_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_INFORMATION_MOVIE]
	@movie_id INT
AS
BEGIN
	BEGIN TRANSACTION; -- Bắt đầu một giao dịch

	BEGIN TRY
		-- Xóa dữ liệu cũ trước đó trước khi cập nhật lại
		DELETE FROM Movie_Category WHERE movie_id = @movie_id;
		DELETE FROM Movie_Company WHERE movie_id = @movie_id;
		DELETE FROM Movie_Language WHERE movie_id = @movie_id;
		DELETE FROM Movie_Person WHERE movie_id = @movie_id;

		COMMIT; -- Lưu các thay đổi vào cơ sở dữ liệu nếu không có lỗi
		SELECT 1;
	END TRY
	BEGIN CATCH
		ROLLBACK; -- Hủy bỏ giao dịch nếu có lỗi
		-- In ra thông báo lỗi hoặc xử lý lỗi tại đây nếu cần
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DELETE_MOVIE]
	@movie_id INT
AS
BEGIN
	DELETE FROM Movie_Person WHERE movie_id = @movie_id
	DELETE FROM Comment WHERE movie_id = @movie_id
	DELETE FROM Movie_Collection WHERE movie_id = @movie_id
	DELETE FROM Move_Language WHERE movie_id = @movie_id
	DELETE FROM Movie_Company WHERE movie_id = @movie_id
	DELETE FROM Movie_Category WHERE movie_id = @movie_id
	DELETE FROM Movie WHERE movie_id = @movie_id
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_COLLECTION]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_COLLECTION]
	@user_id INT
AS
BEGIN
	SELECT MC.movie_id, name, image,views, ISNULL(episode, 0) AS episode, episodes  FROM
	(SELECT user_id, movie_id FROM Movie_Collection WHERE user_id = @user_id) MC INNER JOIN
	(SELECT movie_id, name, image,views, episodes  FROM Movie) M ON MC.movie_id = M.movie_id INNER JOIN
	(SELECT movie_id, episode = COUNT(*) FROM Episode GROUP BY movie_id) E ON E.movie_id = MC.movie_id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_COMMENT_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_COMMENT_MOVIE]
@id int, @start int, @size int 
AS
BEGIN
	SELECT id_comment, C.user_id, name, comment, value, day_cm =  CONVERT(VARCHAR, date, 29), avatar
	FROM (SELECT * FROM Comment WHERE movie_id = @id ) C
		INNER JOIN (SELECT user_id, name,avatar FROM Movie_User) MU ON C.user_id = MU.user_id
	ORDER BY id_comment DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_EPISODE_DELETE_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_EPISODE_DELETE_MOVIE]
	@movie_id INT
AS
BEGIN
	SELECT episode FROM Episode WHERE movie_id = @movie_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_HISTORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_HISTORY]
	@user_id INT, @movie_id INT, @episode INT
AS
BEGIN
	IF EXISTS(SELECT * FROM History WHERE user_id = @user_id)
	BEGIN
		DECLARE @episode_id INT
		DECLARE @time INT
		SET @time = 0
		SELECT @episode_id = episode_id FROM Episode WHERE movie_id = @movie_id AND episode = @episode

		SELECT @time = CAST(time_stamp AS INT) FROM History WHERE user_id = @user_id AND episode_id = @episode_id
		SELECT @time
	END
	ELSE SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_CATEGORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_CATEGORY]
@id int
AS
BEGIN
	SELECT name, C.category_id
	FROM (SELECT movie_id,category_id FROM Movie_Category WHERE movie_id = @id) MC
	INNER JOIN (SELECT category_id, name FROM Category) C ON C.category_id = MC.category_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_COMPANY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_COMPANY]
@id int
AS
BEGIN
	SELECT name, C.company_id
	FROM (SELECT movie_id,company_id FROM Movie_Company WHERE movie_id = @id) MC
	INNER JOIN (SELECT company_id, name FROM Company) C ON C.company_id = MC.company_id 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_DETAIL]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_DETAIL]
@id int
AS
BEGIN
	SELECT   M.movie_id, M.name, movie_content, episodes, image, CO.name AS country, views, episode = ISNULL(episode,0), cm_count = ISNULL(c_cm, 0)
		FROM (SELECT movie_id, name, movie_content, episodes, image, country_id, views FROM Movie WHERE movie_id = @id) M 
		LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id) FROM Episode  WHERE movie_id =@id GROUP BY movie_id) E ON M.movie_id = E.movie_id
		LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment WHERE movie_id =@id GROUP BY movie_id) C ON M.movie_id = C.movie_id
		INNER JOIN (SELECT country_id, name FROM Country) CO ON M.country_id = CO.country_id 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_EPISODES]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_EPISODES]
@id int AS
BEGIN
	SELECT * FROM Episode WHERE movie_id = @id 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_LANGUAGE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_LANGUAGE]
@id int
AS
BEGIN
	SELECT name, type,L.language_id
	FROM (SELECT movie_id,language_id, type FROM Movie_Language WHERE movie_id = @id) ML
	INNER JOIN (SELECT * FROM Language) L ON L.language_id = ML.language_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_NEW_COMMENT]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_MOVIE_NEW_COMMENT]
AS
BEGIN
	SELECT TOP 6 movie_id = M.movie_id, name, views , image,  new_cm = ISNULL(new_cm,0)
	FROM (SELECT movie_id, name, episodes, views, image FROM Movie) M 
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id),episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment), new_cm =MAX(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY new_cm DESC, views DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_MOVIE_PERSON]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_FIND_MOVIE_PERSON]
@id int
AS
BEGIN
	SELECT name, P.person_id, image
	FROM (SELECT movie_id,person_id FROM Movie_Person WHERE movie_id = @id) MP
	INNER JOIN (SELECT person_id, name, image FROM Person) P ON P.person_id = MP.person_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_NEW_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_NEW_MOVIE]
@start int, @size int 
AS
BEGIN
	SELECT movie_id = M.movie_id, name, episodes, episode=ISNULL(episode,0), views , cm_count = ISNULL(c_cm, 0), 
	 episode_id=ISNULL(episode_id,0), image
	FROM (SELECT movie_id, name, episodes, views, image FROM Movie) M 
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id), episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY episode_id DESC, views DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_TOP_MOVIE_CATEGORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_TOP_MOVIE_CATEGORY]
@start int, @size int, @category nvarchar(50)
AS
BEGIN
	SELECT movie_id = M.movie_id, name, episodes, episode=ISNULL(episode,0), views , cm_count = ISNULL(c_cm, 0), 
	episode_id=ISNULL(episode_id,0), image
	FROM
	(SELECT category_id FROM Category WHERE name = @category) CA INNER JOIN 
	(SELECT category_id, movie_id FROM Movie_Category) MC ON MC.category_id = CA.category_id
	INNER JOIN 
	(SELECT movie_id, name, episodes, views, image FROM Movie) M ON M.movie_id = MC.movie_id
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id),episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY views DESC, episode_id DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FIND_TOP_VIEW_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FIND_TOP_VIEW_MOVIE]
@start int, @size int
AS
BEGIN
	SELECT movie_id = M.movie_id, name, episodes, episode = ISNULL(episode, 0), views , cm_count = ISNULL(c_cm, 0), 
	episode_id=ISNULL(episode_id,0), image
	FROM (SELECT movie_id, name, episodes, views, image FROM Movie) M 
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id),episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY views DESC, episode_id DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ACTOR]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_ACTOR]
@start int , @size int
AS
BEGIN
	SELECT P.person_id, actor_name = P.name , gender, day_of_birth = convert(varchar, day_of_birth, 34), image , describe, cn_name = C.name , mv_count = ISNULL(mv,0)
		FROM	
		(SELECT * FROM Person) P INNER JOIN
		(SELECT * FROM Country) C ON P.country_id = C.country_id LEFT JOIN
		(SELECT person_id, mv = COUNT(movie_id) FROM Movie_Person GROUP BY person_id) MP ON MP.person_id = P.person_id
		ORDER BY person_id DESC
			OFFSET (@start) ROWS
			FETCH NEXT (@size) ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ACTOR_COUNT]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GET_ACTOR_COUNT] 
AS
BEGIN
	SELECT ac_count = COUNT(person_id) FROM Person
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ACTOR_INFO]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_ACTOR_INFO]
@id int
AS
BEGIN
	SELECT id = person_id, name_actor = P.name, gender,day_of_birth,image, describe, name_country = C.name  FROM 
	(SELECT * FROM Person WHERE person_id = @id) P INNER JOIN (SELECT * FROM Country) C ON P.country_id = C.country_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_COUNTRY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_COUNTRY]
AS
BEGIN
	SELECT name FROM Country
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_STATUS_COLLECTION]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_STATUS_COLLECTION]
	@user_id INT, @movie_id INT
AS
BEGIN
	IF EXISTS(SELECT * FROM Movie_Collection MC WHERE MC.user_id = @user_id AND MC.movie_id = @movie_id)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_ACTOR]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_ACTOR]
@name nvarchar(50), @gender int, @day_of_birth datetime, @image varchar(100), @describe ntext, @name_cn nvarchar(50)
AS
BEGIN
	DECLARE @id_cn int
	SELECT @id_cn = country_id FROM Country WHERE name = @name_cn
	INSERT INTO Person(name, gender, day_of_birth,image,describe,country_id)
		VALUES (@name, @gender, @day_of_birth,@image,@describe,@id_cn)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_COMMENT]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_COMMENT]
@movie_id int, @user_id int ,@comment ntext, @value int, @date datetime, @result int OUTPUT
AS
BEGIN
	BEGIN TRY
		INSERT INTO Comment(movie_id, user_id, comment,value,date)
		VALUES (@movie_id, @user_id, @comment,@value,@date)
		SET @result = 1;
    END TRY
	BEGIN CATCH
		SET @result = 0; 
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_EPISODE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_EPISODE]
@name nvarchar(50), @episode int, @season nvarchar(50),@source varchar(255), @movie_id int, @day_submit datetime
AS
BEGIN
	INSERT INTO Episode(name,episode,season,source,movie_id,day_submit)
		VALUES(@name,@episode,@season,@source,@movie_id,@day_submit)
		SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_INFORMATION_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_INFORMATION_MOVIE]
	@movie_id INT, @person_id INT, @category_id INT, @language_id INT, @company_id INT , @type int
AS
BEGIN
	BEGIN TRANSACTION; -- Bắt đầu một giao dịch

	BEGIN TRY
		-- Thêm thông tin về công ty liên quan đến phim
		IF (@company_id != 0) AND (NOT EXISTS(SELECT * FROM Movie_Company WHERE movie_id = @movie_id AND company_id = @company_id))
		BEGIN
			INSERT INTO Movie_Company
			VALUES (@movie_id, @company_id);
		END

		-- Thêm thông tin về người liên quan đến phim
		IF (@person_id != 0) AND (NOT EXISTS(SELECT * FROM Movie_Person WHERE movie_id = @movie_id AND person_id = @person_id))
		BEGIN
			INSERT INTO Movie_Person
			VALUES (@movie_id, @person_id);
		END

		-- Thêm thông tin về thể loại của phim
		IF (@category_id != 0) AND (NOT EXISTS(SELECT * FROM Movie_Category WHERE movie_id = @movie_id AND category_id = @category_id))
		BEGIN
			INSERT INTO Movie_Category
			VALUES (@movie_id, @category_id);
		END

		-- Thêm thông tin về ngôn ngữ của phim
		IF (@language_id != 0) AND (NOT EXISTS(SELECT * FROM Movie_Language WHERE movie_id = @movie_id AND language_id = @language_id))
		BEGIN
			INSERT INTO Movie_Language
			VALUES (@movie_id, @language_id, @type);
		END

		COMMIT; -- Lưu các thay đổi vào cơ sở dữ liệu nếu không có lỗi
		SELECT 1;
	END TRY
	BEGIN CATCH
		ROLLBACK; -- Hủy bỏ giao dịch nếu có lỗi
		-- In ra thông báo lỗi hoặc xử lý lỗi tại đây nếu cần
	END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[SP_REMOVE_COLLECTION]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REMOVE_COLLECTION]
	@user_id INT, @movie_id INT
AS
BEGIN
	DELETE FROM Movie_Collection
	WHERE user_id = @user_id AND movie_id = @movie_id
	SELECT 1
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_HISTORY]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SAVE_HISTORY]
	@user_id INT, @movie_id INT, @episode INT, @time FLOAT
AS
BEGIN
	
	DECLARE @episode_id INT
	SELECT @episode_id = episode_id FROM Episode WHERE movie_id = @movie_id AND episode = @episode
	IF @time >= 60
	BEGIN
		IF EXISTS(SELECT * FROM History WHERE user_id = @user_id AND episode_id = @episode_id)
		BEGIN
			DELETE FROM History WHERE user_id = @user_id AND episode_id = @episode_id
			SELECT 1
		END
		ELSE
		BEGIN
			INSERT INTO History
			VALUES(@user_id, @episode_id, @time)
			DECLARE @v INT
			SELECT @v =  views FROM Movie WHERE movie_id = @movie_id
			UPDATE Movie
			SET views = @v + 1
			WHERE movie_id = @movie_id
			SELECT 1
		END
	END
	SELECT 0
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SEARCH_MOVIE]
@input varchar(100), @start int, @size int
AS
BEGIN
	SELECT  movie_id = M.movie_id, name, episodes, episode=ISNULL(episode,0), views , cm_count = ISNULL(c_cm, 0), 
	episode_id = ISNULL(episode_id,0), image
	FROM (SELECT movie_id, name, episodes, views, image FROM Movie WHERE name LIKE '%'+@input+'%') M 
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id),episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY views DESC, episode_id DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_LIST_MOVIE]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SELECT_LIST_MOVIE]
AS
BEGIN
	SELECT M.movie_id, name, image,views, ISNULL(episode, 0) AS episode, episodes  FROM
	(SELECT movie_id, name, image,views, episodes  FROM Movie) M LEFT JOIN
	(SELECT movie_id, episode = COUNT(*) FROM Episode GROUP BY movie_id) E ON E.movie_id = M.movie_id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_PHIM_THEO_2_THE_LOAI]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIM_PHIM_THEO_2_THE_LOAI]
@theloai1 nvarchar(50),@theloai2 nvarchar(50), @start int, @size int
AS
BEGIN
	DECLARE @id_tl1 int, @id_tl2 int 
	SELECT @id_tl1 = category_id FROM Category WHERE name = @theloai1
	SELECT @id_tl2 = category_id FROM Category WHERE name = @theloai2

	SELECT movie_id = M.movie_id, name, episodes, episode=ISNULL(episode,0), views , cm_count = ISNULL(c_cm, 0), 
	episode_id=ISNULL(episode_id,0), image
	FROM
	(SELECT movie_id FROM Movie_Category WITH(INDEX(IX_Category)) WHERE  category_id = @id_tl1) M1 
	INNER JOIN (SELECT movie_id FROM Movie_Category WITH(INDEX(IX_Category)) WHERE category_id = @id_tl2) M2 ON M1.movie_id = M2.movie_id 
	INNER JOIN (SELECT movie_id, name, episodes, views, image FROM Movie) M ON M.movie_id = M2.movie_id
	LEFT JOIN (SELECT movie_id ,episode = COUNT(episode_id),episode_id = MAX(episode_id) FROM Episode GROUP BY movie_id) E ON M.movie_id = E.movie_id
	LEFT JOIN (SELECT movie_id , c_cm = COUNT(id_comment)  FROM Comment GROUP BY movie_id) C ON M.movie_id = C.movie_id
	ORDER BY views DESC, episode_id DESC
	OFFSET (@start) ROWS
	FETCH NEXT (@size) ROWS ONLY;
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_ACTOR_INFO]    Script Date: 03-Nov-23 3:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_ACTOR_INFO]
@id int, @name nvarchar(50), @gender int , @day datetime, @image varchar(100), @describe ntext, @name_cn nvarchar(50) , @result int OUTPUT
AS
BEGIN
	

	BEGIN TRY
		DECLARE @id_cn int
		SELECT @id_cn = country_id FROM Country WHERE name = @name_cn
		UPDATE Person
		SET name = @name, gender = @gender, day_of_birth = @day, image = @image, describe =@describe, country_id = @id_cn
		WHERE person_id = @id
		SET @result = 1;
    END TRY
	BEGIN CATCH
		SET @result = 0; 
    END CATCH
END
GO
