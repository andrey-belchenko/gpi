CREATE TABLE [dm].[FactTask](
	[Timestamp] [datetime2](7) NULL,
	[ProjectUID] [uniqueidentifier] NULL,
	[TaskUID] [uniqueidentifier] NULL,
	[TaskFinishVariance] [decimal](30, 10) NULL,
	[TaskFinishDate] [datetime2](7) NULL,
	[TaskPercentCompleted] [smallint] NULL,
	[TaskPercentWorkCompleted] [smallint] NULL
)
WITH (DATA_COMPRESSION = PAGE)