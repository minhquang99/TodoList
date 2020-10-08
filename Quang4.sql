USE [TodoListDb]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/28/2020 2:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdCongViec] [int] NULL,
	[IdNhanVien] [int] NULL,
	[Content] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 9/28/2020 2:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NameCongViec] [varchar](255) NULL,
	[IdNhanVien] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsPublic] [int] NOT NULL,
	[PartnerNhanVien] [int] NULL,
	[Files] [varchar](255) NULL,
	[Status] [tinyint] NULL,
	[IsVisible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/28/2020 2:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NULL,
	[Email] [varchar](100) NULL,
	[IsManager] [bit] NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 9/28/2020 2:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[idnhanvien] [int] NULL,
	[idcongviec] [int] NULL,
	[comment] [nvarchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (NULL) FOR [IdCongViec]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (NULL) FOR [IdNhanVien]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (NULL) FOR [Content]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [NameCongViec]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [IdNhanVien]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [StartDate]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [PartnerNhanVien]
GO
ALTER TABLE [dbo].[CongViec] ADD  DEFAULT (NULL) FOR [Files]
GO
/****** Object:  StoredProcedure [dbo].[ListAll]    Script Date: 9/28/2020 2:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListAll]
as
begin
	select *
	from NhanVien
end
GO