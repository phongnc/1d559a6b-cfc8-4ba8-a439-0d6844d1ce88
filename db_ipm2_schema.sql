USE [SSIS_IPM2]
GO
/****** Object:  Table [dbo].[QLSPChannel_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLSPChannel_Tb](
	[QLSPChannel_id] [int] IDENTITY(1,1) NOT NULL,
	[QLSPChannel_title] [nvarchar](500) NULL,
	[QLSPChannel_created] [datetime2](0) NULL,
	[QLSPThanhVien_id] [int] NOT NULL,
 CONSTRAINT [PK_QLSPChannel_Tb] PRIMARY KEY CLUSTERED 
(
	[QLSPChannel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QLSPInvoice_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QLSPInvoice_Tb](
	[QLSPInvoice_id] [int] IDENTITY(1,1) NOT NULL,
	[QLSPChannel_id] [int] NOT NULL,
	[QLSPKhachHang_title] [nvarchar](500) NULL,
	[QLSPKhachHang_mobile] [varchar](50) NULL,
	[QLSPInvoice_created] [datetime2](0) NULL CONSTRAINT [DF_QLSPInvoiceTb_QLSPInvoice_created]  DEFAULT (getdate()),
	[QLSPInvoice_total] [int] NULL,
 CONSTRAINT [PK_QLSPInvoiceTb] PRIMARY KEY CLUSTERED 
(
	[QLSPInvoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLSPKhachHang_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QLSPKhachHang_Tb](
	[QLSPKhachHang_id] [int] IDENTITY(1,1) NOT NULL,
	[QLSPKhachHang_title] [nvarchar](500) NULL,
	[QLSPKhachHang_code] [varchar](50) NULL,
	[QLSPKhachHang_email] [varchar](150) NULL,
	[QLSPKhachHang_mobile] [varchar](50) NULL,
	[QLSPThanhVien_id] [int] NOT NULL CONSTRAINT [DF_QLSPKhachHang_Tb_QLSPThanhVien_id]  DEFAULT ((1)),
 CONSTRAINT [PK_QLSPKhachHangTb] PRIMARY KEY CLUSTERED 
(
	[QLSPKhachHang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLSPOrder_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QLSPOrder_Tb](
	[QLSPOrder_id] [int] IDENTITY(1,1) NOT NULL,
	[QLSPInvoice_id] [int] NULL,
	[QLSPSanPham_code] [varchar](50) NULL,
	[QLSPSanPham_title] [nvarchar](500) NULL,
	[QLSPOrder_created] [datetime2](0) NULL CONSTRAINT [DF_QLSPOrder_Tb_QLSPOrder_created]  DEFAULT (getdate()),
	[QLSPOrder_count] [int] NULL,
	[QLSPOrder_total] [int] NULL,
 CONSTRAINT [PK_QLSPInvoiceSanPhamTb] PRIMARY KEY CLUSTERED 
(
	[QLSPOrder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLSPSanPham_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QLSPSanPham_Tb](
	[QLSPSanPham_id] [int] IDENTITY(1,1) NOT NULL,
	[QLSPSanPham_title] [nvarchar](500) NULL,
	[QLSPSanPham_cover] [varchar](500) NULL,
	[QLSPSanPham_code] [varchar](50) NULL,
	[QLSPSanPham_price1] [int] NULL,
	[QLSPSanPham_price2] [int] NULL,
	[QLSPSanPham_note] [nvarchar](500) NULL,
	[QLSPThanhVien_id] [int] NOT NULL CONSTRAINT [DF_QLSPSanPham_Tb_QLSPThanhVien_id]  DEFAULT ((1)),
 CONSTRAINT [PK_QLSPSanPhamTb] PRIMARY KEY CLUSTERED 
(
	[QLSPSanPham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLSPThanhVien_Tb]    Script Date: 13/04/2017 6:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLSPThanhVien_Tb](
	[QLSPThanhVien_id] [int] NOT NULL,
	[QLSPChannel_id] [int] NOT NULL,
	[Title] [nvarchar](1000) NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[IsOwner] [smallint] NOT NULL CONSTRAINT [DF_QLSPThanhVien_Tb_IsOwner]  DEFAULT ((0)),
 CONSTRAINT [PK_QLSPThanhVien_Tb] PRIMARY KEY CLUSTERED 
(
	[QLSPThanhVien_id] ASC,
	[QLSPChannel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
