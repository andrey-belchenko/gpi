

CREATE PROCEDURE [etl].[LoadDimPortfolioProject]
AS
     WITH x
          AS (SELECT [Timestamp], 
                     [Uid] AS [ProjectUID], 
                     [ParentUid] AS [PortfolioUID]
              FROM [stg_forms].[LinkPortfolioProjects] [a])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     TRUNCATE TABLE [dm].[DimPortfolioProject];
     INSERT INTO [dm].[DimPortfolioProject]
     ([Timestamp], 
      [ProjectUID], 
      [PortfolioUID]
     )
            SELECT *
            FROM [#x];
     COMMIT TRAN;