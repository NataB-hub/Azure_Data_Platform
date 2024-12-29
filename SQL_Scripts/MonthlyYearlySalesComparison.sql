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
            CAST(ROUND(SUM(SOD.LineTotal), 2) AS DECIMAL(18,2)) AS MonthlyRevenue,
            CAST(ROUND(SUM(SUM(SOD.LineTotal)) OVER (PARTITION BY YEAR(SOH.OrderDate)), 2) AS DECIMAL(18,2)) AS YearlyRevenue
        FROM 
            SalesOrderHeader SOH
        JOIN 
            SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
        GROUP BY 
            YEAR(SOH.OrderDate), MONTH(SOH.OrderDate);'

EXEC (@statement)

END
GO