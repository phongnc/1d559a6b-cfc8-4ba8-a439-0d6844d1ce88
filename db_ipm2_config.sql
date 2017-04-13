USE [SSIS_IPM2]
GO
/****** Object:  Table [dbo].[APPUser_Tb]    Script Date: 13/04/2017 6:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPUser_Tb](
	[APPUser_id] [int] IDENTITY(1,1) NOT NULL,
	[SSUser_id] [int] NOT NULL,
 CONSTRAINT [PK_APPUser_Tb] PRIMARY KEY CLUSTERED 
(
	[APPUser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Columns_tb]    Script Date: 13/04/2017 6:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Columns_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Table_Name] [varchar](50) NOT NULL,
	[Column_Name] [varchar](50) NOT NULL,
	[Display_Name] [nvarchar](50) NULL,
	[Use_As] [varchar](1000) NULL,
 CONSTRAINT [PK_Columns_tb_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tables_tb]    Script Date: 13/04/2017 6:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tables_tb](
	[Table_Name] [nvarchar](50) NOT NULL,
	[Display_Name] [nvarchar](50) NULL,
	[Use_As] [varchar](1000) NULL CONSTRAINT [DF_Tables_tb_Use_As]  DEFAULT (''),
 CONSTRAINT [PK_Tables_tb] PRIMARY KEY CLUSTERED 
(
	[Table_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[APPUser_Tb] ON 

GO
INSERT [dbo].[APPUser_Tb] ([APPUser_id], [SSUser_id]) VALUES (1, 4)
GO
SET IDENTITY_INSERT [dbo].[APPUser_Tb] OFF
GO
SET IDENTITY_INSERT [dbo].[Columns_tb] ON 

GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (1, N'APPUser_Tb', N'APPUser_id', N'', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (2, N'APPUser_Tb', N'SSUser_id', N'', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (3, N'QLSPInvoice_Tb', N'QLSPInvoice_id', N'Id', N'displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (4, N'QLSPInvoice_Tb', N'QLSPChannel_id', N'Đợt Bán', N'parent,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (6, N'QLSPInvoice_Tb', N'QLSPInvoice_created', N'Ngày', N'date')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (7, N'QLSPInvoice_Tb', N'QLSPInvoice_total', N'Tổng', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (8, N'QLSPOrder_Tb', N'QLSPOrder_id', N'Id', N'displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (9, N'QLSPOrder_Tb', N'QLSPInvoice_id', N'Hóa Đơn', N'parent,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (10, N'QLSPOrder_Tb', N'QLSPSanPham_code', N'Mã Sản Phẩm', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (11, N'QLSPOrder_Tb', N'QLSPOrder_created', N'Ngày', N'date')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (12, N'QLSPOrder_Tb', N'QLSPOrder_count', N'Số Lượng', N'number')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (13, N'QLSPOrder_Tb', N'QLSPOrder_total', N'Tổng', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (14, N'QLSPThanhVien_Tb', N'QLSPThanhVien_id', N'Id', N'optionvalue,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (15, N'QLSPThanhVien_Tb', N'QLSPChannel_id', N'Đợt Bán', N'parent,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (16, N'QLSPThanhVien_Tb', N'Title', N'Tên', N'title,optiontext')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (17, N'QLSPThanhVien_Tb', N'GhiChu', N'Ghi Chú', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (18, N'QLSPThanhVien_Tb', N'IsOwner', N'Owner', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (19, N'QLSPChannel_Tb', N'QLSPChannel_id', N'Id', N'scope,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (20, N'QLSPChannel_Tb', N'QLSPChannel_title', N'Đợt Bán', N'title')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (21, N'QLSPChannel_Tb', N'QLSPChannel_created', N'Ngày', N'date')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (22, N'QLSPChannel_Tb', N'QLSPThanhVien_id', N'Thành Viên', N'hidden,displaynone,owner')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (23, N'QLSPSanPham_Tb', N'QLSPSanPham_id', N'Id', N'optionvalue,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (24, N'QLSPSanPham_Tb', N'QLSPSanPham_title', N'Tên Sản Phẩm', N'title,optiontext')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (25, N'QLSPSanPham_Tb', N'QLSPSanPham_code', N'Mã Sản Phẩm', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (26, N'QLSPSanPham_Tb', N'QLSPSanPham_price1', N'Giá 1', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (27, N'QLSPSanPham_Tb', N'QLSPSanPham_price2', N'Giá 2', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (28, N'QLSPSanPham_Tb', N'QLSPSanPham_note', N'Ghi Chú', N'editor')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (29, N'QLSPSanPham_Tb', N'QLSPThanhVien_id', N'Thành Viên', N'hidden,displaynone,owner')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (30, N'QLSPKhachHang_Tb', N'QLSPKhachHang_id', N'Id', N'optionvalue,displaynone')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (31, N'QLSPKhachHang_Tb', N'QLSPKhachHang_title', N'Tên Khách Hàng', N'title,optiontext')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (32, N'QLSPKhachHang_Tb', N'QLSPKhachHang_code', N'Mã Khách Hàng', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (33, N'QLSPKhachHang_Tb', N'QLSPKhachHang_email', N'Email', N'email')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (34, N'QLSPKhachHang_Tb', N'QLSPKhachHang_mobile', N'Số Điện Thoại', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (35, N'QLSPKhachHang_Tb', N'QLSPThanhVien_id', N'Thành Viên', N'hidden,displaynone,owner')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (36, N'QLSPSanPham_Tb', N'QLSPSanPham_cover', N'Ảnh', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (37, N'QLSPInvoice_Tb', N'QLSPKhachHang_title', N'Tên Khách Hàng', N'title')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (38, N'QLSPInvoice_Tb', N'QLSPKhachHang_mobile', N'SĐT Khách Hàng', N'')
GO
INSERT [dbo].[Columns_tb] ([Id], [Table_Name], [Column_Name], [Display_Name], [Use_As]) VALUES (39, N'QLSPOrder_Tb', N'QLSPSanPham_title', N'Tên Sản Phẩm', N'title')
GO
SET IDENTITY_INSERT [dbo].[Columns_tb] OFF
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'APPUser_Tb', NULL, N'Client0')
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPChannel_Tb', N'ĐỢT BÁN', N'Index0,menu')
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPInvoice_Tb', N'HÓA ĐƠN', N'Index1')
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPKhachHang_Tb', N'KHÁCH HÀNG', N'menu')
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPOrder_Tb', N'ORDER', NULL)
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPSanPham_Tb', N'SẢN PHẨM', N'menu')
GO
INSERT [dbo].[Tables_tb] ([Table_Name], [Display_Name], [Use_As]) VALUES (N'QLSPThanhVien_Tb', N'THÀNH VIÊN', NULL)
GO
