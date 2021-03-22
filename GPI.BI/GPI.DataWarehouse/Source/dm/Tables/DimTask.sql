CREATE TABLE [dm].[DimTask](
	[Timestamp] [datetime2](7) NULL,
	[ProjectUID] [uniqueidentifier] NULL,
	[TaskParentUID] [uniqueidentifier] NULL,
	[TaskUID] [uniqueidentifier] NULL,
	[TaskName] [nvarchar](4000) NULL,
	[TaskIsSummary] [bit] NULL,
	[TaskIsProjectSummary] [bit] NULL,
	[TaskIsMilestone] [bit] NULL,
	[TaskStartDate] [datetime2](7) NULL,
	[TaskBaselineStartDate] [datetime2](7) NULL,
	[TaskBaselineFinishDate] [datetime2](7) NULL,
	[TaskType] [nvarchar](4000) NULL,
	[Responder] [nvarchar](4000) NULL,
	[Stage] [nvarchar](4000) NULL

)
WITH (DATA_COMPRESSION = PAGE)


