В рамках БД "онлайн-магазин" напишите след/запросы:

Найти мин.стоимость товаров для каждой категории
SELECT
    CategoryID,
    MIN(Price) AS min_price
FROM Products

GROUP BY CategoryID
ORDER BY min_price DESC

Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
    Customers.Country,
    COUNT(*) AS total_orders
FROM Orders

JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Country
ORDER BY total_orders DESC
LIMIT 3;

Вывести названия категорий, в которых более 10 товаров
SELECT
    CategoryName
FROM Categories

JOIN Products
    ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
HAVING COUNT(*) > 10;

Очистить тел.номер поставщикам из USA

Вывести имена и фамилии (и ко-во заказов) менеджеров,
у которых ко-во заказов менее 15
SELECT
    Employees.LastName,
    Employees.FirstName,
    COUNT(*) AS orders_amount
FROM Orders

JOIN Employees
     ON Orders.EmployeeID = Employees.EmployeeID

GROUP BY Employees.EmployeeID
HAVING orders_amount < 15;


Вывести товар, который находится на втором месте по ко-ву заказов
SELECT
    Products.ProductName,
    COUNT(*) AS orders_amount
FROM OrderDetails

JOIN Products
    ON OrderDetails.ProductID = Products.ProductID

GROUP BY Products.ProductID
ORDER BY orders_amount DESC
LIMIT 1 OFFSET 1;
