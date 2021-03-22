

CREATE PROCEDURE [etl].[LoadDimPortfolio]
AS
     WITH x
          AS (SELECT [Timestamp], 
                     [UID] AS [PortfolioUID], 
                     [Id] AS [PortfolioId], 
                     [a].[Title] AS [PortfolioName], 
                     [PortfolioCurator], 
                     [type] [PortfolioType]
              FROM [stg_forms].[PortfolioList] [a])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     TRUNCATE   TABLE    [dm].[DimPortfolio];
     INSERT INTO [dm].[DimPortfolio]
            SELECT *
            FROM [#x];
     COMMIT TRAN;