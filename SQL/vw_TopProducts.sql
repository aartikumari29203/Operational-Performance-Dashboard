CREATE VIEW dbo.vw_TopProducts
AS
WITH ProductRevenue AS
(
    SELECT
        pc.Name AS Category,
        p.Name AS Product,
        SUM(sod.LineTotal) AS TotalRevenue
    FROM Sales.SalesOrderDetail AS sod
    JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
    JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
    JOIN Production.ProductCategory AS pc
        ON ps.ProductCategoryID = pc.ProductCategoryID
    GROUP BY
        pc.Name,
        p.Name
),
RankedProducts AS
(
    SELECT
        Category,
        Product,
        TotalRevenue,
        RANK() OVER
        (
            PARTITION BY Category
            ORDER BY TotalRevenue DESC
        ) AS ProductRank
    FROM ProductRevenue
)
SELECT
    Category,
    Product,
    TotalRevenue,
    ProductRank
FROM RankedProducts
WHERE ProductRank <= 5;
