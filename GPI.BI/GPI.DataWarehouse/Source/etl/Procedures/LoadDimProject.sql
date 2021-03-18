
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
                     [ProjectTypeName]
              FROM [etl].[vProject])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     INSERT INTO [dm].[DimProject]
            SELECT *
            FROM [#x];
     COMMIT TRAN;