CREATE TABLE [stg_forms].[LinkPortfolioProjects](
	[Timestamp] [datetime2](7) NULL,
	[Uid] [uniqueidentifier] NULL,
	[ParentUid] [uniqueidentifier] NULL
)
WITH (DATA_COMPRESSION = PAGE)