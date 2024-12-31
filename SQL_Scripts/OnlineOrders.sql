USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_onlineOrders
    @ViewName nvarchar(100)

AS
BEGIN
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT 
        CASE 
            WHEN SOH.OnlineOrderFlag = 1 THEN ''OnlineOrder''
                ELSE ''OfflineOrder'' 
                END AS IsOnlineOrder,
            YEAR(SOH.OrderDate) AS OrdersByYear,
            COUNT(*) AS TotalOrders
        FROM dbo.SalesOrderHeader SOH
        GROUP BY SOH.OnlineOrderFlag,  YEAR(SOH.OrderDate);'

EXEC (@statement)

END
GO