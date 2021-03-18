CREATE TABLE [dm].[DimPortfolio](
	[Timestamp] [datetime2](7) NULL,
	[PortfolioUID] [uniqueidentifier] NULL,
	[PortfolioId] [int] NULL,
	[PortfolioName] [nvarchar](4000) NULL,
	[PortfolioCurator] [nvarchar](4000) NULL,
	[PortfolioType] [nvarchar](4000) NULL
)
WITH (DATA_COMPRESSION = PAGE)

