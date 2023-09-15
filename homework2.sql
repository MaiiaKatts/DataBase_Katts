Вывести название и стоимость
        в USD (12.09.2023 - 1.07) одного самого дорогого проданного товара (Read)
SELECT
    Products.ProductName,
    ROUND(Products.Price * 1.07,2) AS PriceUSD
FROM OrderDetails

JOIN Products
    ON OrderDetails.ProductID = Products.ProductID

ORDER BY Products.Price DESC
    LIMIT 1


Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products

JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID

WHERE
    Categories.CategoryName LIKE 'beverages'
      AND
    Suppliers.Country LIKE 'usa'

ORDER BY Products.Price DESC
    LIMIT 2

Удалить товары с ценой менее 5 EUR
DELETE
FROM Products
WHERE
    Price < 5

Вывести список стран, которые поставляют напитки
SELECT DISTINCT Suppliers.Country
FROM Products

JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID

WHERE
    Categories.CategoryName LIKE 'beverages'

Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = NULL
WHERE
    NOT Country LIKE 'china';