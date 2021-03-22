

CREATE PROCEDURE [etl].[LoadDimProject]
AS
     WITH x
          AS (SELECT [Timestamp], 
                     [ProjectUID], 
                     [ProjectName], 
                     [ProjectStartDate], 
                     [ProjectBaseline0StartDate] [ProjectBaselineStartDate], 
                     [ProjectBaseline0FinishDate] [ProjectBaselineFinishDate], 
                     [ProjectWorkspaceInternalHRef], 
                     [EnterpriseProjectTypeUID], 
                     [ProjectType], 
                     [ProjectTypeName], 
                     [Текущая стадия проекта]
              FROM [etl].[vProject])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;

     TRUNCATE TABLE [dm].[DimProject];
     INSERT INTO [dm].[DimProject]
     ([Timestamp], 
      [ProjectUID], 
      [ProjectName], 
      [ProjectStartDate], 
      [ProjectBaseline0StartDate], 
      [ProjectBaseline0FinishDate], 
      [ProjectWorkspaceInternalHRef], 
      [EnterpriseProjectTypeUID], 
      [ProjectType], 
      [ProjectTypeName], 
      [ProjectStage]
     )
            SELECT *
            FROM [#x];
     COMMIT TRAN;