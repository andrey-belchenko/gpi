CREATE TABLE [stg_pwa].[Task](
	[ProjectUID] [uniqueidentifier] NULL,
	[TaskParentUID] [uniqueidentifier] NULL,
	[TaskUID] [uniqueidentifier] NULL,
	[TaskName] [nvarchar](4000) NULL,
	[TaskIsSummary] [bit] NULL,
	[TaskIsProjectSummary] [bit] NULL,
	[TaskIsMilestone] [bit] NULL,
	[TaskStartDate] [datetime2](7) NULL,
	[TaskBaseline0StartDate] [datetime2](7) NULL,
	[TaskBaseline0FinishDate] [datetime2](7) NULL,
	[Тип задачи] [nvarchar](4000) NULL,
	[Ответственный] [nvarchar](4000) NULL,
	[TaskFinishVariance] [decimal](30, 10) NULL,
	[TaskFinishDate] [datetime2](7) NULL,
	[TaskPercentCompleted] [smallint] NULL,
	[TaskPercentWorkCompleted] [smallint] NULL,
	[Timestamp] [datetime2](7) NULL
)