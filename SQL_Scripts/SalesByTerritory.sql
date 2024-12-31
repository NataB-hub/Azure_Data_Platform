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
        T.CountryRegionCode AS Country,
        YEAR(SOH.OrderDate) AS Year,
        SUM(SOH.SubTotal) AS AnnualRevenue
        FROM 
            SalesOrderHeader SOH
        JOIN 
            SalesTerritory T ON SOH.TerritoryID = T.TerritoryID
        GROUP BY 
            T.Name, T.CountryRegionCode, YEAR(SOH.OrderDate);'

EXEC (@statement)

END
GO