CREATE TABLE [stg_forms].[PortfolioList](
	[Uid] [uniqueidentifier] NULL,
	[Id] [int] NULL,
	[Title] [nvarchar](4000) NULL,
	[PortfolioCurator] [nvarchar](4000) NULL,
	[type] [nvarchar](4000) NULL,
	[Timestamp] [datetime2](7) NULL
)
WITH (DATA_COMPRESSION = PAGE)