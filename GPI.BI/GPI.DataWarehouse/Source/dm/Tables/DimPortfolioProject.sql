CREATE TABLE [dm].[DimPortfolioProject](
	[Timestamp] [datetime2](7) NULL,
	[ProjectUID] [uniqueidentifier] NULL,
	[PortfolioUID] [uniqueidentifier] NULL
)
WITH (DATA_COMPRESSION = PAGE)