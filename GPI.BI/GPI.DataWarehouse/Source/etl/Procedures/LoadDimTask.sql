

CREATE PROCEDURE [etl].[LoadDimTask]
AS
     WITH x
          AS (SELECT [Timestamp], 
                     [ProjectUID], 
                     [TaskParentUID], 
                     [TaskUID], 
                     [TaskName], 
                     [TaskIsSummary], 
                     [TaskIsProjectSummary], 
                     [TaskIsMilestone], 
                     [TaskStartDate], 
                     [a].[TaskBaseline0StartDate] AS [TaskBaseStartDate], 
                     [a].[TaskBaseline0FinishDate] AS [TaskBaseFinishDate], 
                     [a].[Тип задачи] AS [TaskType], 
                     [a].[Ответственный] AS [Responder], 
                     --часть строки после точки
                     SUBSTRING([a].[Стадия проекта], CHARINDEX('.', [a].[Стадия проекта]) + 1, LEN([a].[Стадия проекта]) - CHARINDEX('.', [a].[Стадия проекта])) [Stage]
              FROM [etl].[vTask] [a])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;

     TRUNCATE TABLE [dm].[DimTask];
     INSERT INTO [dm].[DimTask]
     ([Timestamp], 
      [ProjectUID], 
      [TaskParentUID], 
      [TaskUID], 
      [TaskName], 
      [TaskIsSummary], 
      [TaskIsProjectSummary], 
      [TaskIsMilestone], 
      [TaskStartDate], 
      [TaskBaselineStartDate], 
      [TaskBaselineFinishDate], 
      [TaskType], 
      [Responder], 
      [Stage]
     )
            SELECT *
            FROM [#x];
     COMMIT TRAN;