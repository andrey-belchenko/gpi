

CREATE PROCEDURE [etl].[ReloadFactTask]
AS
     DECLARE @validFrom DATE;
     --следующий после последнего закрытого среза день (по сути сегодня) а если последнего среза нет, то Р.Х.
     SELECT @validFrom = CASE
                             WHEN MAX([ValidTo]) IS NOT NULL
                             THEN DATEADD(day, 1, MAX([ValidTo]))
                             ELSE '0001'
                         END
     FROM [dm].[FactTask]
     WHERE [ValidTo] < '9999';
     WITH x
          AS (SELECT [Timestamp], 
                     @validFrom AS [ValidFrom], 
                     '9999' AS [ValidTo], 
                     [TaskUID], 
                     [ProjectUID], 
                     [TaskFinishVariance] / 8 [TaskVariance], 
                     [TaskFinishDate], 
                     [TaskPercentCompleted], 
                     [TaskPercentWorkCompleted]
              FROM [etl].[vTask])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     --удаляется незакрытый срез (его может не быть в случае есл вызывалась процедура Slice..)
     DELETE [dm].[FactTask]
     WHERE [ValidTo] = '9999';

     INSERT INTO [dm].[FactTask]
     ([Timestamp], 
      [ValidFrom], 
      [ValidTo], 
      [ProjectUID], 
      [TaskUID], 
      [TaskVariance], 
      [TaskFinishDate], 
      [TaskPercentCompleted], 
      [TaskPercentWorkCompleted]
     )
            SELECT *
            FROM [#x];
     COMMIT TRAN;