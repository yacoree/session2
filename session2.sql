USE [Data_Import]
GO
/****** Object:  Table [dbo].[Material_Type]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_Type](
	[Material_Type_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Material_Type] PRIMARY KEY CLUSTERED 
(
	[Material_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Material_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Material_Type_ID] [int] NOT NULL,
	[Amount_InPack] [int] NOT NULL,
	[Unit_ID] [int] NOT NULL,
	[Amount_In_Stock] [int] NOT NULL,
	[Min_Possible_Balance] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Product_Type_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[Product_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Article] [int] NOT NULL,
	[Min_Agent_Price] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Product_Type_ID] [int] NOT NULL,
	[People_Amount] [int] NOT NULL,
	[Workshop_Number] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Materials]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Materials](
	[Products_Materials_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Material_ID] [int] NOT NULL,
	[Necessary_Amount] [int] NOT NULL,
 CONSTRAINT [PK_Products_Materials] PRIMARY KEY CLUSTERED 
(
	[Products_Materials_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 15.03.2024 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[Unit_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Name]) VALUES (1, N' Пресс')
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Name]) VALUES (2, N' Рулон')
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Name]) VALUES (3, N' Гранулы')
INSERT [dbo].[Material_Type] ([Material_Type_ID], [Name]) VALUES (4, N' Нарезка')
GO
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (1, N'Спрессованный материал серый 0x2', 1, 5, 1, 140, 49, 33128)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (2, N'Рулон бумаги зеленый 1x1', 2, 3, 1, 634, 36, 26841)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (3, N'Спрессованный материал розовый 2x1', 1, 8, 1, 636, 21, 52606)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (4, N'Гранулы для бумаги розовый 2x2', 3, 10, 2, 661, 16, 10608)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (5, N'Спрессованный материал белый 1x1', 1, 7, 3, 843, 16, 43440)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (6, N'Рулон бумаги белый 1x0', 2, 1, 1, 501, 49, 15833)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (7, N'Переработка бумаги синий 0x3', 4, 9, 1, 958, 32, 14180)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (8, N'Рулон бумаги цветной 2x0', 2, 3, 1, 386, 46, 35544)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (9, N'Рулон бумаги зеленый 2x2', 2, 8, 3, 593, 20, 55016)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (10, N'Рулон бумаги белый 3x2', 2, 4, 3, 16, 31, 53759)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (11, N'Переработка бумаги серый 3x3', 4, 10, 1, 89, 20, 49391)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (12, N'Гранулы для бумаги синий 1x2', 3, 6, 2, 112, 34, 25624)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (13, N'Рулон бумаги серый 3x3', 2, 3, 1, 596, 8, 50247)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (14, N'Спрессованный материал цветной 1x3', 1, 3, 1, 772, 40, 51672)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (15, N'Рулон бумаги синий 2x2', 2, 6, 3, 363, 47, 38450)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (16, N'Гранулы для бумаги розовый 0x3', 3, 4, 2, 379, 41, 3868)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (17, N'Переработка бумаги цветной 1x3', 4, 6, 3, 32, 34, 37930)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (18, N'Гранулы для бумаги цветной 0x1', 3, 5, 2, 759, 28, 9216)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (19, N'Рулон бумаги цветной 1x2', 2, 10, 1, 246, 37, 5016)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (20, N'Переработка бумаги серый 1x2', 4, 8, 1, 516, 49, 35981)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (21, N'Спрессованный материал синий 0x2', 1, 3, 3, 514, 40, 6555)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (22, N'Переработка бумаги синий 1x2', 4, 4, 1, 81, 32, 47873)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (23, N'Спрессованный материал цветной 1x2', 1, 1, 1, 429, 47, 15802)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (24, N'Рулон бумаги розовый 2x1', 2, 1, 1, 349, 9, 36163)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (25, N'Рулон бумаги белый 3x3', 2, 2, 3, 201, 46, 51261)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (26, N'Рулон бумаги цветной 2x2', 2, 10, 3, 534, 46, 50776)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (27, N'Спрессованный материал розовый 2x3', 1, 3, 1, 552, 7, 4657)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (28, N'Рулон бумаги розовый 3x2', 2, 9, 1, 144, 41, 51776)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (29, N'Переработка бумаги синий 0x1', 4, 7, 1, 97, 30, 47937)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (30, N'Спрессованный материал розовый 1x2', 1, 7, 1, 509, 26, 10604)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (31, N'Рулон бумаги цветной 1x3', 2, 10, 3, 149, 13, 22724)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (32, N'Рулон бумаги синий 3x2', 2, 9, 1, 508, 16, 25561)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (33, N'Рулон бумаги зеленый 2x3', 2, 2, 1, 181, 35, 45388)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (34, N'Гранулы для бумаги розовый 0x2', 3, 7, 3, 37, 50, 17227)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (35, N'Переработка бумаги цветной 0x0', 4, 9, 1, 508, 19, 51147)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (36, N'Переработка бумаги серый 0x2', 4, 3, 1, 167, 17, 10248)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (37, N'Гранулы для бумаги цветной 0x3', 3, 10, 3, 962, 33, 35922)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (38, N'Рулон бумаги зеленый 3x3', 2, 3, 1, 861, 45, 37283)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (39, N'Рулон бумаги белый 0x3', 2, 2, 1, 933, 50, 7253)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (40, N'Рулон бумаги синий 3x1', 2, 3, 1, 720, 11, 44675)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (41, N'Спрессованный материал белый 3x3', 1, 8, 1, 942, 12, 17600)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (42, N'Рулон бумаги белый 1x3', 2, 2, 3, 382, 10, 32770)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (43, N'Переработка бумаги белый 3x0', 4, 10, 1, 247, 11, 39500)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (44, N'Гранулы для бумаги синий 1x3', 3, 10, 2, 841, 18, 38700)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (45, N'Спрессованный материал синий 3x1', 1, 10, 1, 270, 50, 38809)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (46, N'Спрессованный материал цветной 0x0', 1, 6, 1, 754, 24, 4611)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (47, N'Переработка бумаги цветной 0x1', 4, 8, 1, 833, 34, 53875)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (48, N'Спрессованный материал цветной 1x0', 1, 8, 1, 856, 26, 12817)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (49, N'Переработка бумаги синий 0x2', 4, 9, 3, 709, 47, 23157)
INSERT [dbo].[Materials] ([Material_ID], [Name], [Material_Type_ID], [Amount_InPack], [Unit_ID], [Amount_In_Stock], [Min_Possible_Balance], [Price]) VALUES (50, N'Переработка бумаги белый 2x0', 4, 5, 1, 794, 17, 21637)
GO
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Name]) VALUES (1, N'Три слоя')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Name]) VALUES (2, N'Два слоя')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Name]) VALUES (3, N'Детская')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Name]) VALUES (4, N'Супер мягкая')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Name]) VALUES (5, N'Один слой')
GO
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (1, N'Полотенце 28М Клубника', 334385, 9208, N'\products\paper_20.jpg', 1, 2, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (2, N'Набор 24М Дыня', 337632, 11471, NULL, 2, 5, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (3, N'Набор 9М Бриз', 259548, 2317, NULL, 2, 4, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (4, N'Набор 50М Клубника', 278721, 14220, NULL, 3, 3, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (5, N'Полотенце 24М Дыня', 264493, 10479, NULL, 2, 5, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (6, N'Бумага 21М Дыня', 366160, 11064, N'\products\paper_2.jpg', 4, 1, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (7, N'Полотенце 37М Клубника', 292358, 3961, NULL, 5, 4, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (8, N'Набор 6М Бриз', 289779, 14154, NULL, 5, 1, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (9, N'Бумага 37М Клубника', 442634, 12664, N'\products\paper_14.jpg', 3, 5, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (10, N'Набор 41М Дыня', 385037, 3295, N'\products\paper_21.jpg', 5, 5, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (11, N'Бумага 26М Ваниль', 444337, 3007, NULL, 4, 4, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (12, N'Бумага 50М Ваниль', 454479, 3163, NULL, 3, 3, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (13, N'Набор 25М Бриз', 434113, 13047, NULL, 5, 4, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (14, N'Бумага 32М Бриз', 379800, 6832, NULL, 3, 1, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (15, N'Полотенце 41М Дыня', 239349, 6238, NULL, 3, 2, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (16, N'Бумага 9М Ваниль', 446348, 13568, NULL, 3, 3, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (17, N'Бумага 3М Бриз', 260492, 8278, NULL, 2, 1, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (18, N'Бумага 5М Дыня', 256862, 3712, N'\products\paper_5.jpg', 5, 5, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (19, N'Полотенце 16М Ваниль', 259488, 10095, NULL, 4, 3, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (20, N'Бумага 44М Бриз', 422185, 6441, NULL, 5, 2, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (21, N'Набор 19М Дыня', 382063, 2373, NULL, 4, 1, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (22, N'Бумага 29М Клубника', 334943, 5997, NULL, 5, 1, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (23, N'Полотенце 27М Дыня', 238686, 7864, NULL, 2, 2, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (24, N'Набор 11М Дыня', 450659, 5956, N'\products\paper_16.jpg', 2, 3, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (25, N'Полотенце 48М Клубника', 292206, 9801, NULL, 4, 3, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (26, N'Полотенце 16М Бриз', 418298, 7342, NULL, 1, 2, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (27, N'Полотенце 14М Клубника', 309862, 10682, N'\products\paper_17.jpg', 2, 4, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (28, N'Полотенце 43М Клубника', 425641, 14151, NULL, 4, 2, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (29, N'Набор 19М Бриз', 277950, 9962, NULL, 3, 5, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (30, N'Набор 32М Клубника', 351062, 4450, NULL, 4, 3, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (31, N'Набор 26М Дыня', 279801, 4628, NULL, 2, 2, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (32, N'Бумага 15М Клубника', 449359, 10009, NULL, 2, 3, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (33, N'Полотенце 45М Бриз', 303994, 13081, N'\products\paper_6.jpg', 3, 2, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (34, N'Набор 50М Бриз', 414595, 10750, N'\products\paper_8.jpg', 2, 4, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (35, N'Набор 16М Дыня', 376834, 11927, NULL, 5, 4, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (36, N'Бумага 45М Бриз', 374276, 13605, NULL, 3, 3, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (37, N'Бумага 45М Клубника', 400484, 3475, NULL, 4, 3, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (38, N'Бумага 16М Дыня', 262257, 9107, NULL, 4, 5, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (39, N'Набор 40М Дыня', 346154, 3427, NULL, 3, 4, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (40, N'Бумага 33М Бриз', 347239, 13767, NULL, 2, 5, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (41, N'Полотенце 45М Клубника', 352034, 11939, NULL, 1, 2, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (42, N'Набор 43М Клубника', 443538, 13786, NULL, 5, 1, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (43, N'Набор 34М Ваниль', 316033, 13533, NULL, 4, 1, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (44, N'Бумага 32М Дыня', 268393, 7424, NULL, 5, 4, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (45, N'Бумага 12М Бриз', 426804, 10703, NULL, 5, 1, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (46, N'Полотенце 6М Ваниль', 324941, 5594, NULL, 2, 1, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (47, N'Полотенце 47М Клубника', 378723, 3871, NULL, 5, 4, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (48, N'Полотенце 15М Бриз', 365615, 13013, NULL, 5, 1, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (49, N'Набор 9М Дыня', 440942, 2580, NULL, 5, 3, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (50, N'Набор 17М Клубника', 441239, 14863, NULL, 4, 2, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (51, N'Набор 5М Бриз', 278382, 7325, NULL, 2, 3, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (52, N'Набор 29М Ваниль', 344868, 7618, N'\products\paper_4.jpg', 1, 1, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (53, N'Набор 31М Дыня', 449401, 5236, NULL, 5, 5, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (54, N'Набор 45М Бриз', 349802, 12040, NULL, 2, 1, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (55, N'Бумага 13М Дыня', 348651, 3477, NULL, 1, 3, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (56, N'Набор 24М Клубника', 296007, 14162, NULL, 3, 2, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (57, N'Набор 10М Дыня', 431234, 3816, N'\products\paper_22.jpg', 5, 4, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (58, N'Бумага 12М Клубника', 456129, 6467, N'\products\paper_1.jpg', 5, 3, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (59, N'Полотенце 11М Дыня', 400418, 11660, N'\products\paper_25.jpg', 4, 2, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (60, N'Набор 42М Дыня', 390914, 14344, N'\products\paper_13.jpg', 3, 5, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (61, N'Бумага 5М Бриз', 345239, 9243, NULL, 5, 1, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (62, N'Набор 14М Дыня', 373939, 3382, NULL, 1, 2, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (63, N'Бумага 33М Клубника', 252485, 4240, N'\products\paper_0.jpg', 1, 3, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (64, N'Набор 34М Клубника', 381110, 2372, NULL, 2, 3, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (65, N'Полотенце 14М Дыня', 331688, 10330, NULL, 2, 2, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (66, N'Бумага 40М Бриз', 326200, 12927, N'\products\paper_19.jpg', 2, 5, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (67, N'Бумага 20М Клубника', 253218, 11684, NULL, 5, 2, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (68, N'Бумага 50М Бриз', 340583, 6788, N'\products\paper_15.jpg', 3, 4, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (69, N'Полотенце 23М Ваниль', 437519, 3317, NULL, 1, 1, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (70, N'Набор 8М Дыня', 240580, 7465, NULL, 5, 5, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (71, N'Бумага 10М Клубника', 275591, 13600, N'\products\paper_7.jpg', 2, 4, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (72, N'Набор 41М Клубника', 281425, 9908, N'\products\paper_23.jpg', 4, 4, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (73, N'Набор 10М Ваниль', 261465, 13028, N'\products\paper_12.jpg', 4, 5, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (74, N'Полотенце 17М Бриз', 309067, 13825, N'\products\paper_24.jpg', 2, 1, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (75, N'Полотенце 27М Ваниль', 278463, 3978, N'\products\paper_10.jpg', 2, 3, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (76, N'Полотенце 50М Ваниль', 310212, 13204, N'\products\paper_11.jpg', 1, 1, 10)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (77, N'Набор 20М Бриз', 377042, 9227, N'\products\paper_9.jpg', 5, 5, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (78, N'Полотенце 47М Дыня', 294441, 11460, NULL, 4, 4, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (79, N'Бумага 29М Дыня', 332522, 5439, N'\products\paper_18.jpg', 1, 3, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (80, N'Полотенце 44М Ваниль', 357053, 3396, NULL, 5, 5, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (81, N'Полотенце 7М Ваниль', 397143, 2868, NULL, 3, 2, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (82, N'Бумага 49М Бриз', 414339, 10786, NULL, 1, 1, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (83, N'Полотенце 7М Бриз', 350515, 4986, NULL, 2, 2, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (84, N'Полотенце 25М Бриз', 258695, 3631, NULL, 1, 1, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (85, N'Полотенце 17М Ваниль', 403054, 5048, NULL, 4, 2, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (86, N'Бумага 14М Бриз', 310507, 7846, NULL, 3, 1, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (87, N'Набор 40М Бриз', 353930, 12767, NULL, 2, 2, 8)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (88, N'Набор 22М Клубника', 360424, 13524, NULL, 1, 4, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (89, N'Бумага 13М Бриз', 349861, 3842, NULL, 2, 4, 6)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (90, N'Бумага 7М Ваниль', 290729, 6934, NULL, 4, 4, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (91, N'Набор 24М Ваниль', 374263, 3907, NULL, 5, 5, 9)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (92, N'Набор 43М Дыня', 330360, 5867, NULL, 1, 5, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (93, N'Полотенце 33М Бриз', 297840, 4611, NULL, 4, 4, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (94, N'Набор 12М Бриз', 349614, 2551, N'\products\paper_3.jpg', 3, 1, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (95, N'Бумага 38М Ваниль', 416066, 12175, NULL, 1, 2, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (96, N'Бумага 20М Бриз', 285792, 14370, NULL, 3, 3, 7)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (97, N'Бумага 28М Дыня', 298632, 14671, NULL, 3, 4, 4)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (98, N'Бумага 10М Дыня', 446103, 13975, NULL, 5, 1, 3)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (99, N'Набор 22М Бриз', 443382, 4501, NULL, 3, 3, 5)
INSERT [dbo].[Products] ([Product_ID], [Name], [Article], [Min_Agent_Price], [Image], [Product_Type_ID], [People_Amount], [Workshop_Number]) VALUES (100, N'Набор 18М Ваниль', 331270, 11171, NULL, 1, 4, 8)
GO
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (1, 1, 24, 20)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (2, 2, 6, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (3, 3, 6, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (4, 4, 24, 18)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (5, 5, 6, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (6, 6, 24, 9)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (7, 7, 23, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (8, 1, 25, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (9, 9, 39, 12)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (10, 10, 25, 20)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (11, 5, 42, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (12, 12, 33, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (13, 13, 39, 12)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (14, 14, 25, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (15, 6, 25, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (16, 16, 42, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (17, 17, 42, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (18, 18, 42, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (19, 19, 2, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (20, 19, 8, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (21, 21, 38, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (22, 22, 13, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (23, 13, 27, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (24, 9, 40, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (25, 25, 13, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (26, 26, 13, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (27, 27, 2, 16)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (28, 28, 38, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (29, 29, 21, 5)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (30, 18, 27, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (31, 31, 27, 14)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (32, 32, 40, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (33, 33, 2, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (34, 34, 40, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (35, 33, 36, 2)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (36, 36, 14, 9)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (37, 37, 13, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (38, 38, 40, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (39, 12, 40, 14)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (40, 40, 13, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (41, 41, 8, 2)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (42, 10, 21, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (43, 43, 14, 11)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (44, 29, 10, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (45, 32, 22, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (46, 46, 16, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (47, 19, 16, 16)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (48, 28, 16, 11)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (49, 49, 16, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (50, 5, 18, 20)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (51, 27, 18, 18)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (52, 52, 18, 18)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (53, 53, 18, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (54, 12, 18, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (55, 9, 46, 11)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (56, 4, 15, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (57, 25, 12, 18)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (58, 58, 46, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (59, 40, 17, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (60, 37, 46, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (61, 43, 12, 6)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (62, 62, 46, 7)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (63, 12, 12, 14)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (64, 46, 34, 14)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (65, 26, 34, 5)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (66, 66, 29, 15)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (67, 28, 5, 13)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (68, 18, 5, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (69, 62, 5, 5)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (70, 53, 30, 20)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (71, 21, 41, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (72, 9, 48, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (73, 6, 3, 13)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (74, 25, 48, 18)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (75, 75, 47, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (76, 52, 32, 20)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (77, 40, 32, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (78, 40, 49, 14)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (79, 10, 7, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (80, 58, 35, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (81, 12, 28, 5)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (82, 1, 35, 1)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (83, 29, 28, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (84, 26, 7, 19)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (85, 25, 32, 16)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (86, 13, 28, 17)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (87, 87, 44, 8)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (88, 88, 37, 17)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (89, 37, 37, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (90, 13, 44, 11)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (91, 91, 43, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (92, 34, 26, 16)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (93, 2, 26, 11)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (94, 2, 11, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (95, 25, 44, 12)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (96, 28, 44, 16)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (97, 75, 11, 3)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (98, 66, 43, 4)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (99, 1, 37, 10)
INSERT [dbo].[Products_Materials] ([Products_Materials_ID], [Product_ID], [Material_ID], [Necessary_Amount]) VALUES (100, 53, 44, 6)
GO
INSERT [dbo].[Units] ([Unit_ID], [Name]) VALUES (1, N' м')
INSERT [dbo].[Units] ([Unit_ID], [Name]) VALUES (2, N' л')
INSERT [dbo].[Units] ([Unit_ID], [Name]) VALUES (3, N' кг')
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Material_Type] FOREIGN KEY([Material_Type_ID])
REFERENCES [dbo].[Material_Type] ([Material_Type_ID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Material_Type]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Units1] FOREIGN KEY([Unit_ID])
REFERENCES [dbo].[Units] ([Unit_ID])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Units1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_Type]
GO
ALTER TABLE [dbo].[Products_Materials]  WITH CHECK ADD  CONSTRAINT [FK_Products_Materials_Materials] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Materials] ([Material_ID])
GO
ALTER TABLE [dbo].[Products_Materials] CHECK CONSTRAINT [FK_Products_Materials_Materials]
GO
ALTER TABLE [dbo].[Products_Materials]  WITH CHECK ADD  CONSTRAINT [FK_Products_Materials_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Products_Materials] CHECK CONSTRAINT [FK_Products_Materials_Products]
GO
