USE [MA_Databases]
GO
/****** Object:  Table [dbo].[Data_Produksi_EXPORT]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Produksi_EXPORT](
	[No] [varchar](50) NULL,
	[Telur Butir] [decimal](28, 0) NULL,
	[Telur (Gram)] [decimal](28, 0) NULL,
	[Telur Hari (Kg)] [decimal](28, 0) NULL,
	[Telur Minggu (Kg)] [decimal](28, 0) NULL,
	[Telur Bulan (Kg)] [decimal](28, 0) NULL,
	[Telur Quartal 4 Bulan (Kg)] [decimal](28, 0) NULL,
	[Pendapatan Hari (Rp)] [decimal](28, 0) NULL,
	[Pendapatan Minggu (Rp)] [decimal](28, 0) NULL,
	[Pendapatan Bulan (Rp)] [decimal](28, 0) NULL,
	[Pendapatan Quartal 4 Bulan (Rp)] [decimal](28, 0) NULL,
	[Pendapatan Tahun (Rp)] [decimal](28, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_PRODUKSI_PAKAN]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_PRODUKSI_PAKAN](
	[No] [varchar](50) NULL,
	[Pakan Hari (Kg)] [decimal](28, 0) NULL,
	[Pakan Minggu (Kg)] [decimal](28, 0) NULL,
	[Pakan Bulan (Kg)] [decimal](28, 0) NULL,
	[Pakan Quartal 4 Bulan (Kg)] [decimal](28, 0) NULL,
	[Pengeluaran Hari (Rp)] [decimal](28, 0) NULL,
	[Pengeluaran Minggu (Rp)] [decimal](28, 0) NULL,
	[Pengeluaran Bulan (Rp)] [decimal](28, 0) NULL,
	[Pengeluaran Quartal 4 Bulan (Rp)] [decimal](28, 0) NULL,
	[Pengeluaran Tahun (Rp)] [decimal](28, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ma_analisis]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ma_analisis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jenis] [varchar](50) NULL,
	[periode_mulai] [date] NULL,
	[periode_akhir] [date] NULL,
	[nilai_ma] [decimal](18, 2) NULL,
	[kategori] [varchar](50) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pakan]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pakan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tanggal] [date] NOT NULL,
	[pakan_kg_hari] [decimal](10, 2) NULL,
	[pakan_kg_minggu] [decimal](10, 2) NULL,
	[pakan_kg_bulan] [decimal](10, 2) NULL,
	[pakan_ref_quartal] [int] NULL,
	[persen_pakan] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pakan_bulan]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pakan_bulan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bulan] [int] NOT NULL,
	[tahun] [int] NOT NULL,
	[total_Pakan_kg] [decimal](10, 2) NOT NULL,
	[jumlah_hari] [int] NOT NULL,
	[rata_rata_harian] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK__produksi__3132T83F95EC079D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pakan_hari]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pakan_hari](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanggal] [date] NULL,
	[Pakan_kg] [decimal](10, 2) NULL,
 CONSTRAINT [Pakan_hari_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pakan_quartal]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pakan_quartal](
	[Id_quartal] [int] IDENTITY(1,1) NOT NULL,
	[Pakan_kg_quartal] [decimal](10, 2) NULL,
 CONSTRAINT [Pakan_quartal_PK] PRIMARY KEY CLUSTERED 
(
	[Id_quartal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pendapatan]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pendapatan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[produksi_id] [int] NOT NULL,
	[tanggal] [date] NOT NULL,
	[pendapatan_hari] [decimal](18, 2) NULL,
	[pendapatan_minggu] [decimal](18, 2) NULL,
	[pendapatan_bulan] [decimal](18, 2) NULL,
	[pendapatan_quartal] [decimal](18, 2) NULL,
	[pendapatan_tahun] [decimal](18, 2) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pengeluaran]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pengeluaran](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pakan_id] [int] NOT NULL,
	[tanggal] [date] NOT NULL,
	[pengeluaran_hari] [decimal](20, 2) NULL,
	[pengeluaran_minggu] [decimal](20, 2) NULL,
	[pengeluaran_bulan] [decimal](20, 2) NULL,
	[pengeluaran_quartal] [decimal](20, 2) NULL,
	[pengeluaran_tahun] [decimal](20, 2) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produksi_telur]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produksi_telur](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tanggal] [date] NOT NULL,
	[telur_butir] [int] NOT NULL,
	[telur_gram] [int] NOT NULL,
	[telur_kg_hari] [decimal](10, 2) NOT NULL,
	[telur_kg_minggu] [decimal](10, 2) NULL,
	[telur_kg_bulan] [decimal](10, 2) NULL,
	[telur_ref_quartal] [int] NULL,
	[persen_produksi] [decimal](5, 2) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produksi_telur_bulan]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produksi_telur_bulan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bulan] [int] NOT NULL,
	[tahun] [int] NOT NULL,
	[total_telur_kg] [decimal](10, 2) NOT NULL,
	[jumlah_hari] [int] NOT NULL,
	[rata_rata_harian] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produksi_telur_hari]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produksi_telur_hari](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanggal] [date] NULL,
	[Telur_kg] [decimal](20, 8) NULL,
 CONSTRAINT [Produksi_telur_hari_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telur_quartal]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telur_quartal](
	[Id_quartal] [int] IDENTITY(1,1) NOT NULL,
	[Telur_kg_quartal] [decimal](20, 2) NULL,
 CONSTRAINT [Telur_quartal_PK] PRIMARY KEY CLUSTERED 
(
	[Id_quartal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 25/05/2025 12:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password_hash] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'1', CAST(21355 AS Decimal(28, 0)), CAST(1345344 AS Decimal(28, 0)), CAST(1345 AS Decimal(28, 0)), CAST(9417 AS Decimal(28, 0)), CAST(37670 AS Decimal(28, 0)), CAST(151948 AS Decimal(28, 0)), CAST(2959755876 AS Decimal(28, 0)), CAST(20718291132 AS Decimal(28, 0)), CAST(82873164528 AS Decimal(28, 0)), CAST(334286135568 AS Decimal(28, 0)), CAST(1007514202464 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'2', CAST(21355 AS Decimal(28, 0)), CAST(1345344 AS Decimal(28, 0)), CAST(1345 AS Decimal(28, 0)), CAST(9417 AS Decimal(28, 0)), CAST(37670 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(2959755876 AS Decimal(28, 0)), CAST(20718291132 AS Decimal(28, 0)), CAST(82873164528 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'3', CAST(21595 AS Decimal(28, 0)), CAST(1360460 AS Decimal(28, 0)), CAST(1360 AS Decimal(28, 0)), CAST(9523 AS Decimal(28, 0)), CAST(38093 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(299301156 AS Decimal(28, 0)), CAST(2095108092 AS Decimal(28, 0)), CAST(8380432368 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'4', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'5', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(152795 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(336148453872 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'6', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'7', CAST(21355 AS Decimal(28, 0)), CAST(1345344 AS Decimal(28, 0)), CAST(1345 AS Decimal(28, 0)), CAST(9417 AS Decimal(28, 0)), CAST(37670 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(2959755876 AS Decimal(28, 0)), CAST(20718291132 AS Decimal(28, 0)), CAST(82873164528 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'8', CAST(21595 AS Decimal(28, 0)), CAST(1360460 AS Decimal(28, 0)), CAST(1360 AS Decimal(28, 0)), CAST(9523 AS Decimal(28, 0)), CAST(38093 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(299301156 AS Decimal(28, 0)), CAST(2095108092 AS Decimal(28, 0)), CAST(8380432368 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'9', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(153218 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(337079613024 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'10', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'11', CAST(21835 AS Decimal(28, 0)), CAST(1375576 AS Decimal(28, 0)), CAST(1376 AS Decimal(28, 0)), CAST(9629 AS Decimal(28, 0)), CAST(38516 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(3026267244 AS Decimal(28, 0)), CAST(21183870708 AS Decimal(28, 0)), CAST(84735482832 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[Data_Produksi_EXPORT] ([No], [Telur Butir], [Telur (Gram)], [Telur Hari (Kg)], [Telur Minggu (Kg)], [Telur Bulan (Kg)], [Telur Quartal 4 Bulan (Kg)], [Pendapatan Hari (Rp)], [Pendapatan Minggu (Rp)], [Pendapatan Bulan (Rp)], [Pendapatan Quartal 4 Bulan (Rp)], [Pendapatan Tahun (Rp)]) VALUES (N'12', CAST(21355 AS Decimal(28, 0)), CAST(1345344 AS Decimal(28, 0)), CAST(1345 AS Decimal(28, 0)), CAST(9417 AS Decimal(28, 0)), CAST(37670 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(2959755876 AS Decimal(28, 0)), CAST(20718291132 AS Decimal(28, 0)), CAST(82873164528 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
GO
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'1', CAST(2563 AS Decimal(28, 0)), CAST(17938 AS Decimal(28, 0)), CAST(71752 AS Decimal(28, 0)), CAST(289425 AS Decimal(28, 0)), CAST(179379144 AS Decimal(28, 0)), CAST(1255654008 AS Decimal(28, 0)), CAST(5022616032 AS Decimal(28, 0)), CAST(20259765792 AS Decimal(28, 0)), CAST(61061466816 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'2', CAST(2563 AS Decimal(28, 0)), CAST(17938 AS Decimal(28, 0)), CAST(71752 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(179379144 AS Decimal(28, 0)), CAST(1255654008 AS Decimal(28, 0)), CAST(5022616032 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'3', CAST(2591 AS Decimal(28, 0)), CAST(18139 AS Decimal(28, 0)), CAST(72558 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(18139464 AS Decimal(28, 0)), CAST(126976248 AS Decimal(28, 0)), CAST(507904992 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'4', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'5', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(291038 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(20372633568 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'6', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'7', CAST(2563 AS Decimal(28, 0)), CAST(17938 AS Decimal(28, 0)), CAST(71752 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(179379144 AS Decimal(28, 0)), CAST(1255654008 AS Decimal(28, 0)), CAST(5022616032 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'8', CAST(2591 AS Decimal(28, 0)), CAST(18139 AS Decimal(28, 0)), CAST(72558 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(18139464 AS Decimal(28, 0)), CAST(126976248 AS Decimal(28, 0)), CAST(507904992 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'9', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(291844 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(20429067456 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'10', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'11', CAST(2620 AS Decimal(28, 0)), CAST(18341 AS Decimal(28, 0)), CAST(73364 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(183410136 AS Decimal(28, 0)), CAST(1283870952 AS Decimal(28, 0)), CAST(5135483808 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
INSERT [dbo].[data_PRODUKSI_PAKAN] ([No], [Pakan Hari (Kg)], [Pakan Minggu (Kg)], [Pakan Bulan (Kg)], [Pakan Quartal 4 Bulan (Kg)], [Pengeluaran Hari (Rp)], [Pengeluaran Minggu (Rp)], [Pengeluaran Bulan (Rp)], [Pengeluaran Quartal 4 Bulan (Rp)], [Pengeluaran Tahun (Rp)]) VALUES (N'12', CAST(2563 AS Decimal(28, 0)), CAST(17938 AS Decimal(28, 0)), CAST(71752 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(179379144 AS Decimal(28, 0)), CAST(1255654008 AS Decimal(28, 0)), CAST(5022616032 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)), CAST(0 AS Decimal(28, 0)))
GO
SET IDENTITY_INSERT [dbo].[pakan] ON 

INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (1, CAST(N'2025-05-21' AS Date), CAST(2563.00 AS Decimal(10, 2)), CAST(17938.00 AS Decimal(10, 2)), CAST(71752.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (2, CAST(N'2025-05-21' AS Date), CAST(2563.00 AS Decimal(10, 2)), CAST(17938.00 AS Decimal(10, 2)), CAST(71752.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (3, CAST(N'2025-05-21' AS Date), CAST(2591.00 AS Decimal(10, 2)), CAST(18139.00 AS Decimal(10, 2)), CAST(72558.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (4, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (5, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 2, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (6, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 2, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (7, CAST(N'2025-05-21' AS Date), CAST(2563.00 AS Decimal(10, 2)), CAST(17938.00 AS Decimal(10, 2)), CAST(71752.00 AS Decimal(10, 2)), 2, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (8, CAST(N'2025-05-21' AS Date), CAST(2591.00 AS Decimal(10, 2)), CAST(18139.00 AS Decimal(10, 2)), CAST(72558.00 AS Decimal(10, 2)), 2, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (9, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 3, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (10, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 3, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (11, CAST(N'2025-05-21' AS Date), CAST(2620.00 AS Decimal(10, 2)), CAST(18341.00 AS Decimal(10, 2)), CAST(73364.00 AS Decimal(10, 2)), 3, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
INSERT [dbo].[pakan] ([id], [tanggal], [pakan_kg_hari], [pakan_kg_minggu], [pakan_kg_bulan], [pakan_ref_quartal], [persen_pakan], [created_at], [update_at]) VALUES (12, CAST(N'2025-05-21' AS Date), CAST(2563.00 AS Decimal(10, 2)), CAST(17938.00 AS Decimal(10, 2)), CAST(71752.00 AS Decimal(10, 2)), 3, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-05-21T12:48:56.703' AS DateTime), CAST(N'2025-05-21T12:48:56.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[pakan] OFF
GO
SET IDENTITY_INSERT [dbo].[Pakan_bulan] ON 

INSERT [dbo].[Pakan_bulan] ([id], [bulan], [tahun], [total_Pakan_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (1, 5, 2025, CAST(13970.00 AS Decimal(10, 2)), 8, CAST(1746.25 AS Decimal(10, 2)), CAST(N'2025-05-24T15:46:53.110' AS DateTime), CAST(N'2025-05-25T00:45:40.567' AS DateTime))
INSERT [dbo].[Pakan_bulan] ([id], [bulan], [tahun], [total_Pakan_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (2, 6, 2025, CAST(237440.00 AS Decimal(10, 2)), 120, CAST(1978.67 AS Decimal(10, 2)), CAST(N'2025-05-25T00:45:40.577' AS DateTime), CAST(N'2025-05-25T00:45:40.577' AS DateTime))
INSERT [dbo].[Pakan_bulan] ([id], [bulan], [tahun], [total_Pakan_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (3, 7, 2025, CAST(8360.00 AS Decimal(10, 2)), 4, CAST(2090.00 AS Decimal(10, 2)), CAST(N'2025-05-25T00:45:40.583' AS DateTime), CAST(N'2025-05-25T00:45:40.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pakan_bulan] OFF
GO
SET IDENTITY_INSERT [dbo].[Pakan_hari] ON 

INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (1, CAST(N'2025-05-01' AS Date), CAST(1960.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (2, CAST(N'2025-05-02' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (3, CAST(N'2025-05-03' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (4, CAST(N'2025-05-04' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (5, CAST(N'2025-05-05' AS Date), CAST(1422.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (6, CAST(N'2025-05-06' AS Date), CAST(1554.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (7, CAST(N'2025-05-07' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (8, CAST(N'2025-05-08' AS Date), CAST(1234.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (9, CAST(N'2025-06-01' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (10, CAST(N'2025-06-02' AS Date), CAST(1880.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (11, CAST(N'2025-06-03' AS Date), CAST(2020.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (12, CAST(N'2025-06-04' AS Date), CAST(1910.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (13, CAST(N'2025-06-05' AS Date), CAST(1850.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (14, CAST(N'2025-06-06' AS Date), CAST(2100.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (15, CAST(N'2025-06-07' AS Date), CAST(1980.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (16, CAST(N'2025-06-09' AS Date), CAST(1820.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (17, CAST(N'2025-06-09' AS Date), CAST(2050.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (18, CAST(N'2025-06-10' AS Date), CAST(1930.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (19, CAST(N'2025-06-11' AS Date), CAST(1790.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (20, CAST(N'2025-06-12' AS Date), CAST(2150.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (21, CAST(N'2025-06-13' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (22, CAST(N'2025-06-14' AS Date), CAST(1870.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (23, CAST(N'2025-06-15' AS Date), CAST(2060.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (24, CAST(N'2025-06-16' AS Date), CAST(1960.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (25, CAST(N'2025-06-17' AS Date), CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (26, CAST(N'2025-06-18' AS Date), CAST(2200.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (27, CAST(N'2025-06-19' AS Date), CAST(1990.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (28, CAST(N'2025-06-20' AS Date), CAST(1840.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (29, CAST(N'2025-06-21' AS Date), CAST(2120.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (30, CAST(N'2025-06-22' AS Date), CAST(1900.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (31, CAST(N'2025-06-23' AS Date), CAST(2030.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (32, CAST(N'2025-06-24' AS Date), CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (33, CAST(N'2025-06-25' AS Date), CAST(2170.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (34, CAST(N'2025-06-26' AS Date), CAST(1940.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (35, CAST(N'2025-06-27' AS Date), CAST(2070.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (36, CAST(N'2025-06-28' AS Date), CAST(1860.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (37, CAST(N'2025-06-29' AS Date), CAST(2250.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (38, CAST(N'2025-06-30' AS Date), CAST(1970.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (39, CAST(N'2025-07-01' AS Date), CAST(2090.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (40, CAST(N'2025-06-01' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (41, CAST(N'2025-06-02' AS Date), CAST(1880.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (42, CAST(N'2025-06-03' AS Date), CAST(2020.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (43, CAST(N'2025-06-04' AS Date), CAST(1910.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (44, CAST(N'2025-06-05' AS Date), CAST(1850.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (45, CAST(N'2025-06-06' AS Date), CAST(2100.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (46, CAST(N'2025-06-07' AS Date), CAST(1980.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (47, CAST(N'2025-06-09' AS Date), CAST(1820.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (48, CAST(N'2025-06-09' AS Date), CAST(2050.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (49, CAST(N'2025-06-10' AS Date), CAST(1930.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (50, CAST(N'2025-06-11' AS Date), CAST(1790.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (51, CAST(N'2025-06-12' AS Date), CAST(2150.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (52, CAST(N'2025-06-13' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (53, CAST(N'2025-06-14' AS Date), CAST(1870.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (54, CAST(N'2025-06-15' AS Date), CAST(2060.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (55, CAST(N'2025-06-16' AS Date), CAST(1960.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (56, CAST(N'2025-06-17' AS Date), CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (57, CAST(N'2025-06-18' AS Date), CAST(2200.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (58, CAST(N'2025-06-19' AS Date), CAST(1990.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (59, CAST(N'2025-06-20' AS Date), CAST(1840.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (60, CAST(N'2025-06-21' AS Date), CAST(2120.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (61, CAST(N'2025-06-22' AS Date), CAST(1900.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (62, CAST(N'2025-06-23' AS Date), CAST(2030.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (63, CAST(N'2025-06-24' AS Date), CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (64, CAST(N'2025-06-25' AS Date), CAST(2170.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (65, CAST(N'2025-06-26' AS Date), CAST(1940.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (66, CAST(N'2025-06-27' AS Date), CAST(2070.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (67, CAST(N'2025-06-28' AS Date), CAST(1860.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (68, CAST(N'2025-06-29' AS Date), CAST(2250.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (69, CAST(N'2025-06-30' AS Date), CAST(1970.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (70, CAST(N'2025-07-01' AS Date), CAST(2090.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (71, CAST(N'2025-06-01' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (72, CAST(N'2025-06-02' AS Date), CAST(1880.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (73, CAST(N'2025-06-03' AS Date), CAST(2020.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (74, CAST(N'2025-06-04' AS Date), CAST(1910.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (75, CAST(N'2025-06-05' AS Date), CAST(1850.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (76, CAST(N'2025-06-06' AS Date), CAST(2100.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (77, CAST(N'2025-06-07' AS Date), CAST(1980.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (78, CAST(N'2025-06-09' AS Date), CAST(1820.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (79, CAST(N'2025-06-09' AS Date), CAST(2050.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (80, CAST(N'2025-06-10' AS Date), CAST(1930.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (81, CAST(N'2025-06-11' AS Date), CAST(1790.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (82, CAST(N'2025-06-12' AS Date), CAST(2150.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (83, CAST(N'2025-06-13' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (84, CAST(N'2025-06-14' AS Date), CAST(1870.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (85, CAST(N'2025-06-15' AS Date), CAST(2060.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (86, CAST(N'2025-06-16' AS Date), CAST(1960.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (87, CAST(N'2025-06-17' AS Date), CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (88, CAST(N'2025-06-18' AS Date), CAST(2200.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (89, CAST(N'2025-06-19' AS Date), CAST(1990.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (90, CAST(N'2025-06-20' AS Date), CAST(1840.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (91, CAST(N'2025-06-21' AS Date), CAST(2120.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (92, CAST(N'2025-06-22' AS Date), CAST(1900.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (93, CAST(N'2025-06-23' AS Date), CAST(2030.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (94, CAST(N'2025-06-24' AS Date), CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (95, CAST(N'2025-06-25' AS Date), CAST(2170.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (96, CAST(N'2025-06-26' AS Date), CAST(1940.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (97, CAST(N'2025-06-27' AS Date), CAST(2070.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (98, CAST(N'2025-06-28' AS Date), CAST(1860.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (99, CAST(N'2025-06-29' AS Date), CAST(2250.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (100, CAST(N'2025-06-30' AS Date), CAST(1970.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (101, CAST(N'2025-07-01' AS Date), CAST(2090.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (102, CAST(N'2025-06-01' AS Date), CAST(1950.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (103, CAST(N'2025-06-02' AS Date), CAST(1880.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (104, CAST(N'2025-06-03' AS Date), CAST(2020.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (105, CAST(N'2025-06-04' AS Date), CAST(1910.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (106, CAST(N'2025-06-05' AS Date), CAST(1850.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (107, CAST(N'2025-06-06' AS Date), CAST(2100.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (108, CAST(N'2025-06-07' AS Date), CAST(1980.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (109, CAST(N'2025-06-09' AS Date), CAST(1820.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (110, CAST(N'2025-06-09' AS Date), CAST(2050.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (111, CAST(N'2025-06-10' AS Date), CAST(1930.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (112, CAST(N'2025-06-11' AS Date), CAST(1790.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (113, CAST(N'2025-06-12' AS Date), CAST(2150.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (114, CAST(N'2025-06-13' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (115, CAST(N'2025-06-14' AS Date), CAST(1870.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (116, CAST(N'2025-06-15' AS Date), CAST(2060.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (117, CAST(N'2025-06-16' AS Date), CAST(1960.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (118, CAST(N'2025-06-17' AS Date), CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (119, CAST(N'2025-06-18' AS Date), CAST(2200.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (120, CAST(N'2025-06-19' AS Date), CAST(1990.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (121, CAST(N'2025-06-20' AS Date), CAST(1840.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (122, CAST(N'2025-06-21' AS Date), CAST(2120.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (123, CAST(N'2025-06-22' AS Date), CAST(1900.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (124, CAST(N'2025-06-23' AS Date), CAST(2030.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (125, CAST(N'2025-06-24' AS Date), CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (126, CAST(N'2025-06-25' AS Date), CAST(2170.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (127, CAST(N'2025-06-26' AS Date), CAST(1940.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (128, CAST(N'2025-06-27' AS Date), CAST(2070.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (129, CAST(N'2025-06-28' AS Date), CAST(1860.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (130, CAST(N'2025-06-29' AS Date), CAST(2250.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (131, CAST(N'2025-06-30' AS Date), CAST(1970.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_hari] ([Id], [Tanggal], [Pakan_kg]) VALUES (132, CAST(N'2025-07-01' AS Date), CAST(2090.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Pakan_hari] OFF
GO
SET IDENTITY_INSERT [dbo].[Pakan_quartal] ON 

INSERT [dbo].[Pakan_quartal] ([Id_quartal], [Pakan_kg_quartal]) VALUES (1, CAST(289425.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_quartal] ([Id_quartal], [Pakan_kg_quartal]) VALUES (2, CAST(291038.00 AS Decimal(10, 2)))
INSERT [dbo].[Pakan_quartal] ([Id_quartal], [Pakan_kg_quartal]) VALUES (3, CAST(291844.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Pakan_quartal] OFF
GO
SET IDENTITY_INSERT [dbo].[pendapatan] ON 

INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (2, 1, CAST(N'2025-05-21' AS Date), CAST(2959755876.00 AS Decimal(18, 2)), CAST(20718291132.00 AS Decimal(18, 2)), CAST(82873164528.00 AS Decimal(18, 2)), CAST(334286135568.00 AS Decimal(18, 2)), CAST(1007514202464.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (3, 2, CAST(N'2025-05-21' AS Date), CAST(2959755876.00 AS Decimal(18, 2)), CAST(20718291132.00 AS Decimal(18, 2)), CAST(82873164528.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (4, 3, CAST(N'2025-05-21' AS Date), CAST(299301156.00 AS Decimal(18, 2)), CAST(2095108092.00 AS Decimal(18, 2)), CAST(8380432368.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (5, 4, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (6, 5, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(336148453872.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (7, 6, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (8, 7, CAST(N'2025-05-21' AS Date), CAST(2959755876.00 AS Decimal(18, 2)), CAST(20718291132.00 AS Decimal(18, 2)), CAST(82873164528.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (9, 8, CAST(N'2025-05-21' AS Date), CAST(299301156.00 AS Decimal(18, 2)), CAST(2095108092.00 AS Decimal(18, 2)), CAST(8380432368.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (10, 9, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(337079613024.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (11, 10, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (12, 11, CAST(N'2025-05-21' AS Date), CAST(3026267244.00 AS Decimal(18, 2)), CAST(21183870708.00 AS Decimal(18, 2)), CAST(84735482832.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
INSERT [dbo].[pendapatan] ([id], [produksi_id], [tanggal], [pendapatan_hari], [pendapatan_minggu], [pendapatan_bulan], [pendapatan_quartal], [pendapatan_tahun], [created_at], [update_at]) VALUES (13, 12, CAST(N'2025-05-21' AS Date), CAST(2959755876.00 AS Decimal(18, 2)), CAST(20718291132.00 AS Decimal(18, 2)), CAST(82873164528.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-05-21T12:56:31.773' AS DateTime), CAST(N'2025-05-21T12:56:31.773' AS DateTime))
SET IDENTITY_INSERT [dbo].[pendapatan] OFF
GO
SET IDENTITY_INSERT [dbo].[pengeluaran] ON 

INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (27, 1, CAST(N'2025-05-21' AS Date), CAST(179379144.00 AS Decimal(20, 2)), CAST(1255654008.00 AS Decimal(20, 2)), CAST(5022616032.00 AS Decimal(20, 2)), CAST(20259765792.00 AS Decimal(20, 2)), CAST(61061466816.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (28, 2, CAST(N'2025-05-21' AS Date), CAST(179379144.00 AS Decimal(20, 2)), CAST(1255654008.00 AS Decimal(20, 2)), CAST(5022616032.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (29, 3, CAST(N'2025-05-21' AS Date), CAST(18139464.00 AS Decimal(20, 2)), CAST(126976248.00 AS Decimal(20, 2)), CAST(507904992.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (30, 4, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (31, 5, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(20372633568.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (32, 6, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (33, 7, CAST(N'2025-05-21' AS Date), CAST(179379144.00 AS Decimal(20, 2)), CAST(1255654008.00 AS Decimal(20, 2)), CAST(5022616032.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (34, 8, CAST(N'2025-05-21' AS Date), CAST(18139464.00 AS Decimal(20, 2)), CAST(126976248.00 AS Decimal(20, 2)), CAST(507904992.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (35, 9, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(20429067456.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (36, 10, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (37, 11, CAST(N'2025-05-21' AS Date), CAST(183410136.00 AS Decimal(20, 2)), CAST(1283870952.00 AS Decimal(20, 2)), CAST(5135483808.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
INSERT [dbo].[pengeluaran] ([id], [pakan_id], [tanggal], [pengeluaran_hari], [pengeluaran_minggu], [pengeluaran_bulan], [pengeluaran_quartal], [pengeluaran_tahun], [create_at], [update_at]) VALUES (38, 12, CAST(N'2025-05-21' AS Date), CAST(179379144.00 AS Decimal(20, 2)), CAST(1255654008.00 AS Decimal(20, 2)), CAST(5022616032.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), CAST(N'2025-05-21T12:52:43.723' AS DateTime), CAST(N'2025-05-21T12:52:43.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[pengeluaran] OFF
GO
SET IDENTITY_INSERT [dbo].[produksi_telur] ON 

INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (1, CAST(N'2025-05-21' AS Date), 21355, 1345344, CAST(1345.00 AS Decimal(10, 2)), CAST(9417.00 AS Decimal(10, 2)), CAST(37670.00 AS Decimal(10, 2)), 1, CAST(0.89 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (2, CAST(N'2025-05-21' AS Date), 21355, 1345344, CAST(1345.00 AS Decimal(10, 2)), CAST(9417.00 AS Decimal(10, 2)), CAST(37670.00 AS Decimal(10, 2)), 1, CAST(0.89 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (3, CAST(N'2025-05-21' AS Date), 21595, 1360460, CAST(1360.00 AS Decimal(10, 2)), CAST(9523.00 AS Decimal(10, 2)), CAST(38093.00 AS Decimal(10, 2)), 1, CAST(0.90 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (4, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 1, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (5, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 2, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (6, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 2, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (7, CAST(N'2025-05-21' AS Date), 21355, 1345344, CAST(1345.00 AS Decimal(10, 2)), CAST(9417.00 AS Decimal(10, 2)), CAST(37670.00 AS Decimal(10, 2)), 2, CAST(0.89 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (8, CAST(N'2025-05-21' AS Date), 21595, 1360460, CAST(1360.00 AS Decimal(10, 2)), CAST(9523.00 AS Decimal(10, 2)), CAST(38093.00 AS Decimal(10, 2)), 2, CAST(0.90 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (9, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 3, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (10, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 3, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (11, CAST(N'2025-05-21' AS Date), 21835, 1375576, CAST(1376.00 AS Decimal(10, 2)), CAST(9629.00 AS Decimal(10, 2)), CAST(38516.00 AS Decimal(10, 2)), 3, CAST(0.91 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (12, CAST(N'2025-05-21' AS Date), 21355, 1345344, CAST(1345.00 AS Decimal(10, 2)), CAST(9417.00 AS Decimal(10, 2)), CAST(37670.00 AS Decimal(10, 2)), 3, CAST(0.89 AS Decimal(5, 2)), CAST(N'2025-05-21T12:23:25.180' AS DateTime), CAST(N'2025-05-21T12:23:25.180' AS DateTime))
INSERT [dbo].[produksi_telur] ([id], [tanggal], [telur_butir], [telur_gram], [telur_kg_hari], [telur_kg_minggu], [telur_kg_bulan], [telur_ref_quartal], [persen_produksi], [created_at], [update_at]) VALUES (13, CAST(N'2025-05-21' AS Date), 21355, 1345344, CAST(1345.00 AS Decimal(10, 2)), CAST(9417.00 AS Decimal(10, 2)), CAST(37670.00 AS Decimal(10, 2)), NULL, CAST(0.89 AS Decimal(5, 2)), CAST(N'2025-05-21T14:13:56.393' AS DateTime), CAST(N'2025-05-21T14:13:56.393' AS DateTime))
SET IDENTITY_INSERT [dbo].[produksi_telur] OFF
GO
SET IDENTITY_INSERT [dbo].[produksi_telur_bulan] ON 

INSERT [dbo].[produksi_telur_bulan] ([id], [bulan], [tahun], [total_telur_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (5, 6, 2025, CAST(40350.00 AS Decimal(10, 2)), 30, CAST(1345.00 AS Decimal(10, 2)), CAST(N'2025-05-22T17:36:58.373' AS DateTime), CAST(N'2025-05-24T23:04:49.190' AS DateTime))
INSERT [dbo].[produksi_telur_bulan] ([id], [bulan], [tahun], [total_telur_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (6, 5, 2025, CAST(44575.00 AS Decimal(10, 2)), 31, CAST(1437.90 AS Decimal(10, 2)), CAST(N'2025-05-24T13:16:18.230' AS DateTime), CAST(N'2025-05-24T23:04:49.183' AS DateTime))
INSERT [dbo].[produksi_telur_bulan] ([id], [bulan], [tahun], [total_telur_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (7, 7, 2025, CAST(52950.00 AS Decimal(10, 2)), 31, CAST(1708.06 AS Decimal(10, 2)), CAST(N'2025-05-24T14:17:48.530' AS DateTime), CAST(N'2025-05-24T23:04:49.197' AS DateTime))
INSERT [dbo].[produksi_telur_bulan] ([id], [bulan], [tahun], [total_telur_kg], [jumlah_hari], [rata_rata_harian], [created_at], [update_at]) VALUES (8, 8, 2025, CAST(61470.00 AS Decimal(10, 2)), 31, CAST(1982.90 AS Decimal(10, 2)), CAST(N'2025-05-24T14:20:48.833' AS DateTime), CAST(N'2025-05-24T23:04:49.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[produksi_telur_bulan] OFF
GO
SET IDENTITY_INSERT [dbo].[Produksi_telur_hari] ON 

INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (80, CAST(N'2025-06-01' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (81, CAST(N'2025-06-02' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (83, CAST(N'2025-06-03' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (84, CAST(N'2025-06-04' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (85, CAST(N'2025-06-05' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (86, CAST(N'2025-06-06' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (87, CAST(N'2025-06-07' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (88, CAST(N'2025-06-08' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (89, CAST(N'2025-06-09' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (90, CAST(N'2025-06-10' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (91, CAST(N'2025-06-11' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (92, CAST(N'2025-06-12' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (93, CAST(N'2025-06-13' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (94, CAST(N'2025-06-14' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (95, CAST(N'2025-06-15' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (96, CAST(N'2025-06-16' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (97, CAST(N'2025-06-17' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (98, CAST(N'2025-06-18' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (99, CAST(N'2025-06-19' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (100, CAST(N'2025-06-20' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (101, CAST(N'2025-06-21' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (102, CAST(N'2025-06-22' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (103, CAST(N'2025-06-23' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (104, CAST(N'2025-06-24' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (105, CAST(N'2025-06-25' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (106, CAST(N'2025-06-26' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (107, CAST(N'2025-06-27' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (108, CAST(N'2025-06-28' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (109, CAST(N'2025-06-29' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (111, CAST(N'2025-06-30' AS Date), CAST(1345.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (116, CAST(N'2025-05-01' AS Date), CAST(1150.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (117, CAST(N'2025-05-02' AS Date), CAST(1280.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (118, CAST(N'2025-05-03' AS Date), CAST(2250.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (120, CAST(N'2025-05-04' AS Date), CAST(1300.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (121, CAST(N'2025-05-05' AS Date), CAST(1270.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (122, CAST(N'2025-05-06' AS Date), CAST(1180.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (123, CAST(N'2025-05-05' AS Date), CAST(1250.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (124, CAST(N'2025-05-08' AS Date), CAST(1400.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (125, CAST(N'2025-05-09' AS Date), CAST(1290.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (126, CAST(N'2025-05-10' AS Date), CAST(1350.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (127, CAST(N'2025-05-11' AS Date), CAST(1190.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (128, CAST(N'2025-05-12' AS Date), CAST(1420.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (129, CAST(N'2025-05-13' AS Date), CAST(2300.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (130, CAST(N'2025-05-14' AS Date), CAST(2550.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (131, CAST(N'2025-05-15' AS Date), CAST(1380.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (132, CAST(N'2025-05-16' AS Date), CAST(1200.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (133, CAST(N'2025-05-17' AS Date), CAST(1700.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (134, CAST(N'2025-05-18' AS Date), CAST(1310.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (135, CAST(N'2025-05-19' AS Date), CAST(1360.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (136, CAST(N'2025-05-20' AS Date), CAST(1900.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (137, CAST(N'2025-05-21' AS Date), CAST(1410.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (138, CAST(N'2025-05-22' AS Date), CAST(1320.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (139, CAST(N'2025-05-23' AS Date), CAST(1430.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (140, CAST(N'2025-05-24' AS Date), CAST(1305.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (141, CAST(N'2025-05-25' AS Date), CAST(1175.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (142, CAST(N'2025-05-26' AS Date), CAST(1050.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (143, CAST(N'2025-05-27' AS Date), CAST(1395.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (144, CAST(N'2025-05-28' AS Date), CAST(1160.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (145, CAST(N'2025-05-29' AS Date), CAST(1450.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (146, CAST(N'2025-05-30' AS Date), CAST(1425.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (147, CAST(N'2025-05-31' AS Date), CAST(1425.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (148, CAST(N'2025-07-01' AS Date), CAST(1550.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (149, CAST(N'2025-07-02' AS Date), CAST(1620.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (150, CAST(N'2025-07-03' AS Date), CAST(1480.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (151, CAST(N'2025-07-04' AS Date), CAST(1710.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (152, CAST(N'2025-07-05' AS Date), CAST(1650.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (153, CAST(N'2025-07-06' AS Date), CAST(1590.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (154, CAST(N'2025-07-07' AS Date), CAST(1800.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (155, CAST(N'2025-07-08' AS Date), CAST(1750.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (156, CAST(N'2025-07-09' AS Date), CAST(1680.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (157, CAST(N'2025-07-10' AS Date), CAST(1520.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (158, CAST(N'2025-07-11' AS Date), CAST(1900.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (159, CAST(N'2025-07-12' AS Date), CAST(1780.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (160, CAST(N'2025-07-13' AS Date), CAST(1610.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (161, CAST(N'2025-07-14' AS Date), CAST(1850.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (162, CAST(N'2025-07-15' AS Date), CAST(1720.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (163, CAST(N'2025-07-16' AS Date), CAST(1500.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (164, CAST(N'2025-07-17' AS Date), CAST(1950.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (165, CAST(N'2025-07-18' AS Date), CAST(1820.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (166, CAST(N'2025-07-19' AS Date), CAST(1670.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (167, CAST(N'2025-07-20' AS Date), CAST(1730.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (168, CAST(N'2025-07-21' AS Date), CAST(1580.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (169, CAST(N'2025-07-22' AS Date), CAST(1880.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (170, CAST(N'2025-07-23' AS Date), CAST(1760.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (171, CAST(N'2025-07-24' AS Date), CAST(1630.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (172, CAST(N'2025-07-25' AS Date), CAST(1920.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (173, CAST(N'2025-07-26' AS Date), CAST(1790.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (174, CAST(N'2025-07-27' AS Date), CAST(1540.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (175, CAST(N'2025-07-28' AS Date), CAST(1810.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (176, CAST(N'2025-07-29' AS Date), CAST(1700.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (177, CAST(N'2025-07-30' AS Date), CAST(1600.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (178, CAST(N'2025-07-31' AS Date), CAST(1860.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (179, CAST(N'2025-08-01' AS Date), CAST(1950.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (180, CAST(N'2025-08-02' AS Date), CAST(1880.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (181, CAST(N'2025-08-03' AS Date), CAST(2020.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (182, CAST(N'2025-08-04' AS Date), CAST(1910.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (183, CAST(N'2025-08-05' AS Date), CAST(1850.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (184, CAST(N'2025-08-06' AS Date), CAST(2100.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (185, CAST(N'2025-08-07' AS Date), CAST(1980.00000000 AS Decimal(20, 8)))
GO
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (186, CAST(N'2025-08-08' AS Date), CAST(1820.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (187, CAST(N'2025-08-09' AS Date), CAST(2050.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (188, CAST(N'2025-08-10' AS Date), CAST(1930.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (189, CAST(N'2025-08-11' AS Date), CAST(1790.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (190, CAST(N'2025-08-12' AS Date), CAST(2150.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (191, CAST(N'2025-08-13' AS Date), CAST(2000.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (192, CAST(N'2025-08-14' AS Date), CAST(1870.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (193, CAST(N'2025-08-15' AS Date), CAST(2080.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (194, CAST(N'2025-08-16' AS Date), CAST(1960.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (195, CAST(N'2025-08-17' AS Date), CAST(1810.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (196, CAST(N'2025-08-18' AS Date), CAST(2200.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (197, CAST(N'2025-08-19' AS Date), CAST(1990.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (198, CAST(N'2025-08-20' AS Date), CAST(1840.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (199, CAST(N'2025-08-21' AS Date), CAST(2120.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (200, CAST(N'2025-08-22' AS Date), CAST(1900.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (201, CAST(N'2025-08-23' AS Date), CAST(2030.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (202, CAST(N'2025-08-24' AS Date), CAST(1890.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (203, CAST(N'2025-08-25' AS Date), CAST(2170.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (204, CAST(N'2025-08-26' AS Date), CAST(1940.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (205, CAST(N'2025-08-27' AS Date), CAST(2070.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (206, CAST(N'2025-08-28' AS Date), CAST(1860.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (207, CAST(N'2025-08-29' AS Date), CAST(2250.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (208, CAST(N'2025-08-30' AS Date), CAST(1970.00000000 AS Decimal(20, 8)))
INSERT [dbo].[Produksi_telur_hari] ([Id], [Tanggal], [Telur_kg]) VALUES (209, CAST(N'2025-08-31' AS Date), CAST(2090.00000000 AS Decimal(20, 8)))
SET IDENTITY_INSERT [dbo].[Produksi_telur_hari] OFF
GO
SET IDENTITY_INSERT [dbo].[Telur_quartal] ON 

INSERT [dbo].[Telur_quartal] ([Id_quartal], [Telur_kg_quartal]) VALUES (1, CAST(151948.00 AS Decimal(20, 2)))
INSERT [dbo].[Telur_quartal] ([Id_quartal], [Telur_kg_quartal]) VALUES (2, CAST(152795.00 AS Decimal(20, 2)))
INSERT [dbo].[Telur_quartal] ([Id_quartal], [Telur_kg_quartal]) VALUES (3, CAST(153218.00 AS Decimal(20, 2)))
SET IDENTITY_INSERT [dbo].[Telur_quartal] OFF
GO
/****** Object:  Index [UP_Bulan_Tahun]    Script Date: 25/05/2025 12:12:11 ******/
ALTER TABLE [dbo].[Pakan_bulan] ADD  CONSTRAINT [UP_Bulan_Tahun] UNIQUE NONCLUSTERED 
(
	[bulan] ASC,
	[tahun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_Bulan_Tahun]    Script Date: 25/05/2025 12:12:11 ******/
ALTER TABLE [dbo].[produksi_telur_bulan] ADD  CONSTRAINT [UC_Bulan_Tahun] UNIQUE NONCLUSTERED 
(
	[bulan] ASC,
	[tahun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__F3DBC572E0175945]    Script Date: 25/05/2025 12:12:11 ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ma_analisis] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[pakan] ADD  DEFAULT (getdate()) FOR [tanggal]
GO
ALTER TABLE [dbo].[pakan] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[pakan] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[Pakan_bulan] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Pakan_bulan] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[pendapatan] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[pendapatan] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[pengeluaran] ADD  DEFAULT (getdate()) FOR [tanggal]
GO
ALTER TABLE [dbo].[pengeluaran] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[pengeluaran] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[produksi_telur] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[produksi_telur] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[produksi_telur_bulan] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[produksi_telur_bulan] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[pakan]  WITH CHECK ADD  CONSTRAINT [pakan_Pakan_quartal_FK] FOREIGN KEY([pakan_ref_quartal])
REFERENCES [dbo].[Pakan_quartal] ([Id_quartal])
GO
ALTER TABLE [dbo].[pakan] CHECK CONSTRAINT [pakan_Pakan_quartal_FK]
GO
ALTER TABLE [dbo].[pendapatan]  WITH CHECK ADD  CONSTRAINT [FK_pendapatan_produksi] FOREIGN KEY([produksi_id])
REFERENCES [dbo].[produksi_telur] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pendapatan] CHECK CONSTRAINT [FK_pendapatan_produksi]
GO
ALTER TABLE [dbo].[pengeluaran]  WITH CHECK ADD FOREIGN KEY([pakan_id])
REFERENCES [dbo].[pakan] ([id])
GO
ALTER TABLE [dbo].[produksi_telur]  WITH CHECK ADD  CONSTRAINT [produksi_telur_Telur_quartal_FK] FOREIGN KEY([telur_ref_quartal])
REFERENCES [dbo].[Telur_quartal] ([Id_quartal])
GO
ALTER TABLE [dbo].[produksi_telur] CHECK CONSTRAINT [produksi_telur_Telur_quartal_FK]
GO
