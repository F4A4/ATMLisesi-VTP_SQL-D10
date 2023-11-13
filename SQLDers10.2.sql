USE [Pazarlama]
GO

/****** Object:  Table [dbo].[tblKitap]    Script Date: 25.12.2012 13:37:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblKitap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [nvarchar](70) NULL,
	[GelisFiyat] [money] NULL,
	[SatisFiyat]  AS ([GelisFiyat]*(1.40)),
	[YazarAd] [nvarchar](50) NULL,
	[YayýmTarihi] [date] NULL,
	[StokVarMi] [bit] NULL,
 CONSTRAINT [PK_tblKitap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblKitap] ADD  CONSTRAINT [DF_tblKitap_YazarAd]  DEFAULT (N'Ali AK') FOR [YazarAd]
GO

ALTER TABLE [dbo].[tblKitap] ADD  CONSTRAINT [DF_tblKitap_YayýmTarihi]  DEFAULT (getdate()) FOR [YayýmTarihi]
GO

ALTER TABLE [dbo].[tblKitap] ADD  CONSTRAINT [DF_tblKitap_StokVarMi]  DEFAULT ((1)) FOR [StokVarMi]
GO

ALTER TABLE [dbo].[tblKitap]  WITH CHECK ADD  CONSTRAINT [CK_tblKitap] CHECK  (([GelisFiyat]>(0)))
GO

ALTER TABLE [dbo].[tblKitap] CHECK CONSTRAINT [CK_tblKitap]
GO


