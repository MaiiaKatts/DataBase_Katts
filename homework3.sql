Вывести ко-во поставщиков не из UK и не из China
SELECT
    COUNT(*)
        AS amount_of_suppliers_but_uk_and_china
FROM Suppliers

WHERE
    NOT Country IN ('china','uk');

Вывести среднюю, MAX и MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
    AVG(Price) AS avg_price_category_3_5,
    MAX(Price) AS max_price_category_3_5,
    MIN(Price) AS min_price_category_3_5,
    COUNT(*) AS total_amount_of_products_category_3_5
FROM Products

WHERE
    CategoryID IN (3, 5)

Вывести общую сумму проданных товаров (общая выручка от проданных товаров)
SELECT
    SUM(Products.Price * OrderDetails.Quantity)
        AS total_sales_proceeds
FROM OrderDetails

JOIN Products
    ON OrderDetails.ProductID=Products.ProductID

Вывести ко-во стран, которые поставляют напитки
SELECT
    COUNT(DISTINCT Suppliers.Country)
        AS num_of_countries_suppluing_beverages
FROM Products

JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID

WHERE
    Categories.CategoryName LIKE 'beverages'

Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
    SUM(Products.Price * OrderDetails.Quantity)
        AS total_export_germany_sum
FROM OrderDetails

JOIN Products
    ON OrderDetails.ProductID = Products.ProductID
JOIN Orders
    ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID

WHERE
        Customers.Country = 'Germany'