USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_salesByTerritory
    @ViewName nvarchar(100)

AS
BEGIN
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT 
            T.Name AS TerritoryName,
            SUM(SOD.LineTotal) AS TotalRevenue
        FROM 
            SalesOrderHeader SOH
        JOIN 
            SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
        JOIN 
            SalesTerritory T ON SOH.TerritoryID = T.TerritoryID
        GROUP BY 
            T.Name;'

EXEC (@statement)

END
GO