CREATE VIEW dbo.vw_MonthlyRevenue
AS
SELECT
    DATEFROMPARTS(
        YEAR(soh.OrderDate),
        MONTH(soh.OrderDate),
        1
    ) AS RevenueMonth,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate);
