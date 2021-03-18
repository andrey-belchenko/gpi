

CREATE PROCEDURE [etl].[ReloadFactProject]
AS
     DECLARE @validFrom DATE;
     --следующий после последнего закрытого среза день (по сути сегодня) а если последнего среза нет, то Р.Х.
     SELECT @validFrom = CASE
                             WHEN MAX([ValidTo]) IS NOT NULL
                             THEN DATEADD(day, 1, MAX([ValidTo]))
                             ELSE '0001'
                         END
     FROM [dm].[FactProject]
     WHERE [ValidTo] < '9999';
     WITH x
          AS (SELECT [Timestamp], 
                     @validFrom AS [ValidFrom], 
                     '9999' AS [ValidTo], 
                     [ProjectUID], 
                     [ProjectFinishDate], 
                     [ProjectPercentCompleted], 
                     [ProjectFinishVariance], 
                     [ProjectLastPublishedDate]
              FROM [etl].[vProject])
          SELECT *
          INTO [#x]
          FROM [x];

     BEGIN TRAN;
     --удаляется незакрытый срез (его может не быть в случае есл вызывалась процедура Slice..)
     DELETE [dm].[FactProject]
     WHERE [ValidTo] = '9999';

     INSERT INTO [dm].[FactProject]
            SELECT *
            FROM [#x];
     COMMIT TRAN;