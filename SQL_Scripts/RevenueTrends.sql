USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_revenueTrends
    @ViewName nvarchar(100)

AS
BEGIN
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT 
            CAST(SOH.OrderDate AS DATE) AS SalesDate,
            SUM(SOH.SubTotal) AS DailyRevenue
        FROM 
            SalesOrderHeader SOH
        GROUP BY 
            CAST(SOH.OrderDate AS DATE);'

EXEC (@statement)

END
GO