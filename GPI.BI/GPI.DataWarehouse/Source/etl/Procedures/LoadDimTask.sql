
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
                     [a].[Ответственный] AS [Responder]
              FROM [etl].[vTask] [a])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     INSERT INTO [dm].[DimTask]
            SELECT *
            FROM [#x];
     COMMIT TRAN;