ПРОВЕРКА ПРИНАДЛЕЖНОСТИ К СПИСКУ ЗНАЧЕНИЙ

ЗАДАЧА: Вывести название и стоимость товаров
от 20 EUR.
SELECT
    ProductName,
    Price
FROM Products
WHERE
    Price >= 20


ЗАДАЧА: Вывести страны поставщиков.
SELECT DISTINCT//??? нужно ли distinct??
    Country
FROM Suppliers;

ЗАДАЧА: В упорядоченном по стоимости виде
вывести название и стоимость товаров
со скидкой в 9% от всех поставщиков, кроме поставщика 1.
SELECT
    ProductName,
    Price * .91 AS SalePrice
FROM Products
WHERE
    SupplierID != 1
ORDER BY SalePrice;


ЗАДАЧА: Вывести контактные имена клиентов,
кроме тех, что из France и USA.
SELECT
	ContactName
FROM Customers
WHERE
    Country NOT IN ('France', 'USA')