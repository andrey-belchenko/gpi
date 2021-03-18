﻿

CREATE PROCEDURE [etl].[SliceFactProject]
AS
     DECLARE @td DATE= GETDATE();
     DECLARE @yd DATE= DATEADD(day, -1, @td);

--последний срез закрывается вчерашней датой, если срез не сегодняшний
     UPDATE [dm].[FactProject]
       SET 
           [ValidTo] = @yd
     WHERE [ValidTo] = '9999'
           AND [ValidFrom] < @td;

