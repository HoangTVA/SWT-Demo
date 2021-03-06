USE [WebDatabase]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](2) NOT NULL,
	[name] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [nvarchar](4) NOT NULL,
	[orderID] [nvarchar](4) NULL,
	[productID] [nvarchar](10) NULL,
	[price] [numeric](2, 2) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](4) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](10) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[price] [decimal](19, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [nvarchar](2) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [char](2) NOT NULL,
	[name] [char](5) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/17/2021 11:33:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[phone] [char](10) NULL,
	[roleID] [char](2) NOT NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'NI', N'Nintendo')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'PC', N'Personal Computer')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'PS', N'PlayStation')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'NI-033', N'3DS', CAST(23.50 AS Decimal(19, 2)), 200, N'NI', 1)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'NI-123', N'Switch', CAST(12.30 AS Decimal(19, 2)), 110, N'NI', 0)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'PC-080', N'GTX 3080', CAST(12.60 AS Decimal(19, 2)), 23, N'PC', 1)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'PC-123', N'gtx 1080', CAST(43.50 AS Decimal(19, 2)), 123, N'PC', 0)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'PS-123', N'PS4', CAST(4.70 AS Decimal(19, 2)), 12, N'PS', 1)
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'GU', N'Guest')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'ad@ad.ad', N'Admin', NULL, NULL, N'AD', N'1234')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'alo@alo.com', N'Phat', NULL, NULL, N'GU', N'1234      ')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'phafap123@gmail.com', N'Pha Fap', NULL, NULL, N'GU', N'5678')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'phat.9a9@gmail.com', N'asd', NULL, NULL, N'GU', N'1234      ')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'phathuuho@gmail.com', N'testSignIn', NULL, NULL, N'GU', N'1234      ')
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
