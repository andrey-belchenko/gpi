CREATE TABLE [dm].[FactProject](
	[Timestamp] [datetime2](7) NULL,
	[ValidFrom] date,
	[ValidTo] date,
	[ProjectUID] [uniqueidentifier] NULL,
	[ProjectFinishDate] [datetime2](7) NULL,
	[ProjectPercentCompleted] [smallint] NULL,
	[ProjectFinishVariance] [decimal](30, 10) NULL,
	[ProjectLastPublishedDate] [datetime2](7) NULL
)
WITH (DATA_COMPRESSION = PAGE)