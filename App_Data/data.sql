USE [master]
GO
/****** Object:  Database [FixtureManagement]    Script Date: 2020/5/28 22:05:04 ******/
CREATE DATABASE [FixtureManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FixtureManagement', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FixtureManagement.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FixtureManagement_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FixtureManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FixtureManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FixtureManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FixtureManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FixtureManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FixtureManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FixtureManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FixtureManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FixtureManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FixtureManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FixtureManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FixtureManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FixtureManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FixtureManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FixtureManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FixtureManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FixtureManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FixtureManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FixtureManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FixtureManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FixtureManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FixtureManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FixtureManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FixtureManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FixtureManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FixtureManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FixtureManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FixtureManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FixtureManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FixtureManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FixtureManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FixtureManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FixtureManagement]
GO
/****** Object:  User [Fixture]    Script Date: 2020/5/28 22:05:04 ******/
CREATE USER [Fixture] FOR LOGIN [Fixture] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Fixture]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Fixture]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Fixture]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Fixture]
GO
/****** Object:  Table [dbo].[FixtureDefinition]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureDefinition](
	[ID] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[FamilyID] [int] NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[PartNo] [nvarchar](100) NOT NULL,
	[UPL] [int] NOT NULL,
	[UsedFor] [nvarchar](50) NOT NULL,
	[PMPeriod] [int] NOT NULL,
	[Owner] [nvarchar](20) NOT NULL,
	[RecOn] [datetime] NOT NULL,
	[RecBy] [nvarchar](20) NOT NULL,
	[EditOn] [datetime] NOT NULL,
	[EditBy] [nvarchar](20) NOT NULL,
	[WorkCellID] [int] NOT NULL,
 CONSTRAINT [PK_FixtureDefinition] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureEntity]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureEntity](
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureEntity] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureFamily]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureFamily](
	[FamilyID] [int] NOT NULL,
	[FamilyName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureFamily] PRIMARY KEY CLUSTERED 
(
	[FamilyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureInRecord]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureInRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[RetDate] [datetime] NOT NULL,
	[RetByName] [nvarchar](20) NOT NULL,
	[OperationByName] [nvarchar](20) NOT NULL,
	[ProdLineID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureOutRecord]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureOutRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[UsedDate] [datetime] NOT NULL,
	[UsedByName] [nvarchar](20) NOT NULL,
	[OperationByName] [nvarchar](20) NOT NULL,
	[ProdLineID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixturePurchase]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixturePurchase](
	[AppBy] [nvarchar](20) NOT NULL,
	[AppByName] [nvarchar](20) NOT NULL,
	[FamilyID] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[BillNo] [nvarchar](20) NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[Pic] [nvarchar](20) NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixturePurchaseApp] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureRepair]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureRepair](
	[RepBy] [nvarchar](20) NOT NULL,
	[RepByName] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[faultDes] [nvarchar](100) NOT NULL,
	[faultPic] [nvarchar](20) NOT NULL,
	[DealBy] [nvarchar](20) NOT NULL,
	[DealByName] [nvarchar](20) NOT NULL,
	[DealRes] [nvarchar](20) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureRepair] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixtureScrap]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixtureScrap](
	[ScrapBy] [nvarchar](20) NOT NULL,
	[ScrapByName] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SeqID] [int] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[ScrapReason] [nvarchar](100) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FixtureScrap] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuNode]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuNode](
	[MenuID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[ParentMenuID] [nvarchar](20) NULL,
	[ControllerName] [nvarchar](20) NULL,
	[ActionName] [nvarchar](40) NULL,
	[NodeIcon] [nvarchar](40) NULL,
	[ExpandIcon] [nvarchar](40) NULL,
	[CollapseIcon] [nvarchar](40) NULL,
 CONSTRAINT [PK_MenuNode] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionLine]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionLine](
	[ProdLineID] [int] NOT NULL,
	[ProdLineName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductionLine] PRIMARY KEY CLUSTERED 
(
	[ProdLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleMenu]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenu](
	[ID] [int] NOT NULL,
	[MenuID] [nvarchar](20) NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[WorkCellID] [int] NOT NULL,
 CONSTRAINT [PK_TestUser] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [int] NOT NULL,
	[UserCode] [nvarchar](20) NOT NULL,
	[RoleID] [int] NULL,
	[WorkCell] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkCell]    Script Date: 2020/5/28 22:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCell](
	[WorkCellID] [int] NOT NULL,
	[WorkCellName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_WorkCell] PRIMARY KEY CLUSTERED 
(
	[WorkCellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FixtureEntity] ADD  CONSTRAINT [DF_FixtureEntity_UsedCount]  DEFAULT ((0)) FOR [UsedCount]
GO
ALTER TABLE [dbo].[FixtureDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FixtureDefinition_FixtureFamily] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[FixtureFamily] ([FamilyID])
GO
ALTER TABLE [dbo].[FixtureDefinition] CHECK CONSTRAINT [FK_FixtureDefinition_FixtureFamily]
GO
ALTER TABLE [dbo].[FixtureDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FixtureDefinition_WorkCell] FOREIGN KEY([WorkCellID])
REFERENCES [dbo].[WorkCell] ([WorkCellID])
GO
ALTER TABLE [dbo].[FixtureDefinition] CHECK CONSTRAINT [FK_FixtureDefinition_WorkCell]
GO
ALTER TABLE [dbo].[FixtureEntity]  WITH CHECK ADD  CONSTRAINT [FK_FixtureEntity_FixtureDefinition] FOREIGN KEY([Code])
REFERENCES [dbo].[FixtureDefinition] ([Code])
GO
ALTER TABLE [dbo].[FixtureEntity] CHECK CONSTRAINT [FK_FixtureEntity_FixtureDefinition]
GO
ALTER TABLE [dbo].[FixtureInRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureInRecord_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixtureInRecord] CHECK CONSTRAINT [FK_FixtureInRecord_FixtureEntity]
GO
ALTER TABLE [dbo].[FixtureInRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureInRecord_ProductionLine] FOREIGN KEY([ProdLineID])
REFERENCES [dbo].[ProductionLine] ([ProdLineID])
GO
ALTER TABLE [dbo].[FixtureInRecord] CHECK CONSTRAINT [FK_FixtureInRecord_ProductionLine]
GO
ALTER TABLE [dbo].[FixtureOutRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureOutRecord_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixtureOutRecord] CHECK CONSTRAINT [FK_FixtureOutRecord_FixtureEntity]
GO
ALTER TABLE [dbo].[FixtureOutRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_FixtureOutRecord_ProductionLine] FOREIGN KEY([ProdLineID])
REFERENCES [dbo].[ProductionLine] ([ProdLineID])
GO
ALTER TABLE [dbo].[FixtureOutRecord] CHECK CONSTRAINT [FK_FixtureOutRecord_ProductionLine]
GO
ALTER TABLE [dbo].[FixturePurchase]  WITH CHECK ADD  CONSTRAINT [FK_FixturePurchaseApp_FixtureEntity] FOREIGN KEY([Code], [SeqID])
REFERENCES [dbo].[FixtureEntity] ([Code], [SeqID])
GO
ALTER TABLE [dbo].[FixturePurchase] CHECK CONSTRAINT [FK_FixturePurchaseApp_FixtureEntity]
GO
ALTER TABLE [dbo].[FixturePurchase]  WITH CHECK ADD  CONSTRAINT [FK_FixturePurchaseApp_FixtureFamily] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[FixtureFamily] ([FamilyID])
GO
ALTER TABLE [dbo].[FixturePurchase] CHECK CONSTRAINT [FK_FixturePurchaseApp_FixtureFamily]
GO
ALTER TABLE [dbo].[FixtureRepair]  WITH CHECK ADD  CONSTRAINT [FK_FixtureRepair_FixtureDefinition] FOREIGN KEY([Code])
REFERENCES [dbo].[FixtureDefinition] ([Code])
GO
ALTER TABLE [dbo].[FixtureRepair] CHECK CONSTRAINT [FK_FixtureRepair_FixtureDefinition]
GO
ALTER TABLE [dbo].[FixtureScrap]  WITH CHECK ADD  CONSTRAINT [FK_FixtureScrap_FixtureDefinition] FOREIGN KEY([Code])
REFERENCES [dbo].[FixtureDefinition] ([Code])
GO
ALTER TABLE [dbo].[FixtureScrap] CHECK CONSTRAINT [FK_FixtureScrap_FixtureDefinition]
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenu_MenuNode] FOREIGN KEY([MenuID])
REFERENCES [dbo].[MenuNode] ([MenuID])
GO
ALTER TABLE [dbo].[RoleMenu] CHECK CONSTRAINT [FK_RoleMenu_MenuNode]
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenu_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleMenu] CHECK CONSTRAINT [FK_RoleMenu_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_WorkCell] FOREIGN KEY([WorkCellID])
REFERENCES [dbo].[WorkCell] ([WorkCellID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_WorkCell]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserCode])
REFERENCES [dbo].[User] ([Code])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具所属大类 id  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具模组 多个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Model'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具料号 多个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'PartNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具在产线上需配备数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'UPL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具用途' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'UsedFor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具保养点检查周期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'PMPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'RecOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人 代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'RecBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'EditOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'EditBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具所属工作部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureDefinition', @level2type=N'COLUMN',@level2name=N'WorkCellID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'与夹具定义表关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区分同一夹具定义下的多个夹具实体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单据号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'BillNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'UsedCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放库位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureEntity', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具大类代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureFamily', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureFamily', @level2type=N'COLUMN',@level2name=N'FamilyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'归还人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureInRecord', @level2type=N'COLUMN',@level2name=N'RetByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'UsedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'UsedByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'OperationByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产线代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixtureOutRecord', @level2type=N'COLUMN',@level2name=N'ProdLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人 代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'AppBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'AppByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具类别代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具代码 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夹具序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'SeqID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'BillNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购入库日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pic 存放的 服务器url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'Pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixturePurchase', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点id 为0 代表本身为初始父节点 为-1 代表 为action' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MenuNode', @level2type=N'COLUMN',@level2name=N'ParentMenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'如果是父亲节点不显示该图标 子节点图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MenuNode', @level2type=N'COLUMN',@level2name=N'NodeIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'如果是父亲节点 则有值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MenuNode', @level2type=N'COLUMN',@level2name=N'ExpandIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'如果是父亲节点则有值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MenuNode', @level2type=N'COLUMN',@level2name=N'CollapseIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产线ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductionLine', @level2type=N'COLUMN',@level2name=N'ProdLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产线名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductionLine', @level2type=N'COLUMN',@level2name=N'ProdLineName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户代码（员工号)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指明用户 在那个部门拥有哪那个角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRole', @level2type=N'COLUMN',@level2name=N'WorkCell'
GO
USE [master]
GO
ALTER DATABASE [FixtureManagement] SET  READ_WRITE 
GO
