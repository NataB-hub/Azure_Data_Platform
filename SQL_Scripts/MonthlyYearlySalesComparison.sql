USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_salesComparison
    @ViewName nvarchar(100)

AS
BEGIN
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT 
            YEAR(SOH.OrderDate) AS Year,
            MONTH(SOH.OrderDate) AS Month,
            CAST(ROUND(SUM(SOH.SubTotal), 2) AS DECIMAL(18,2)) AS MonthlyRevenue,
            CAST(ROUND(SUM(SUM(SOH.SubTotal)) OVER (
                PARTITION BY YEAR(SOH.OrderDate) 
                ORDER BY MONTH(SOH.OrderDate)
            ), 2) AS DECIMAL(18,2)) AS CumulativeYearlyRevenue
            FROM 
                dbo.SalesOrderHeader SOH
            GROUP BY 
                YEAR(SOH.OrderDate), 
                MONTH(SOH.OrderDate);'

EXEC (@statement)

END
GO