USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_gold 
    @ViewName nvarchar(100),
    @SchemaName nvarchar(100)

AS
BEGIN

PRINT @ViewName
PRINT @SchemaName
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT *
        FROM 
            OPENROWSET(
            BULK ''https://adventureworks2022dlgen2.dfs.core.windows.net/gold/' + @SchemaName + '/' + @ViewName + '/'',
            FORMAT = ''DELTA''
        ) AS [result];'


EXEC (@statement)

END
GO
