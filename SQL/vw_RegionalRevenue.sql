CREATE VIEW dbo.vw_RegionalRevenue
AS
SELECT
    st.Name AS Region,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh
    ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name;
