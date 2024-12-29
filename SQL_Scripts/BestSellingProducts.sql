USE gold_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView_BestSellingProducts
    @ViewName nvarchar(100)

AS
BEGIN
DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT 
            P.Name AS ProductName,
            SUM(SOD.OrderQty) AS TotalQuantitySold,
            SUM(SOD.LineTotal) AS TotalRevenue
        FROM 
            SalesOrderDetail SOD
        JOIN 
            Product P ON SOD.ProductID = P.ProductID
        GROUP BY 
            P.Name;'

EXEC (@statement)

END
GO