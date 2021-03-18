
CREATE VIEW [etl].[vTask]
AS
     SELECT t.*
     FROM  [stg_pwa].[Task] [t] join [stg_pwa].[Project] [p] ON t.ProjectUID=p.ProjectUID
     WHERE isnull(t.[TaskIsProjectSummary],0)<>1