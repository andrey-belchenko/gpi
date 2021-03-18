CREATE PROCEDURE [etl].[LoadFactTask]
AS
  
EXEC [etl].[SliceFactTask];
EXEC [etl].[ReloadFactTask];
