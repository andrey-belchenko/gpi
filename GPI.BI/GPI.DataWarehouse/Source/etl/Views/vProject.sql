
CREATE VIEW [etl].[vProject]
AS
     SELECT *
     FROM [stg_pwa].[Project] [a]
     WHERE [a].[ProjectType] <> 7;