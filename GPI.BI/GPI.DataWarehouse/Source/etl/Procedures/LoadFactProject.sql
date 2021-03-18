CREATE PROCEDURE [etl].[LoadFactProject]
AS
  
EXEC [etl].[SliceFactProject];
EXEC [etl].[ReloadFactProject];
