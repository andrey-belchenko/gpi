CREATE TABLE [dm].[DimProject](
	[Timestamp] [datetime2](7) NULL,
	[ProjectUID] [uniqueidentifier] NULL,
	[ProjectName] [nvarchar](4000) NULL,
	[ProjectStartDate] [datetime2](7) NULL,
	[ProjectBaseline0StartDate] [datetime2](7) NULL,
	[ProjectBaseline0FinishDate] [datetime2](7) NULL,
	[ProjectWorkspaceInternalHRef] [nvarchar](4000) NULL,
	[EnterpriseProjectTypeUID] [uniqueidentifier] NULL,
	[ProjectType] [int] NULL,
    [ProjectTypeName] [nvarchar](4000) NULL
)
WITH (DATA_COMPRESSION = PAGE)