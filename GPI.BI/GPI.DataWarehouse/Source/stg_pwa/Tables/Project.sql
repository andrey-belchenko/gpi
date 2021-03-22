CREATE TABLE [stg_pwa].[Project](
	[Timestamp] [datetime2](7) NULL,
	[ProjectUID] [uniqueidentifier] NULL,
	[ProjectName] [nvarchar](4000) NULL,
	[ProjectStartDate] [datetime2](7) NULL,
	[ProjectBaseline0StartDate] [datetime2](7) NULL,
	[ProjectBaseline0FinishDate] [datetime2](7) NULL,
	[ProjectWorkspaceInternalHRef] [nvarchar](4000) NULL,
	[EnterpriseProjectTypeUID] [uniqueidentifier] NULL,
	[ProjectType] [int] NULL,
    [ProjectTypeName] [nvarchar](4000) NULL,
	[ProjectFinishDate] [datetime2](7) NULL,
	[ProjectPercentCompleted] [smallint] NULL,
	[ProjectFinishVariance] [decimal](30, 10) NULL,
	[ProjectLastPublishedDate] [datetime2](7) NULL,
    [Текущая стадия проекта] [nvarchar](4000) NULL
)
WITH (DATA_COMPRESSION = PAGE)