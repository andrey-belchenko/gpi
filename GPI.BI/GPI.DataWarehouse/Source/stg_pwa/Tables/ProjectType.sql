CREATE TABLE [stg_pwa].[ProjectType](
	[EnterpriseProjectTypeUID] [uniqueidentifier] NULL,
	[EnterpriseProjectTypeName] [nvarchar](4000) NULL,
	[Timestamp] [datetime2](7) NULL
)
WITH (DATA_COMPRESSION = PAGE)