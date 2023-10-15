create database Customers_Orders_Products 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100))
   INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')
  select * from Customers
  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT)
  INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);
  select * from Orders
  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2))
  INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)

select * from Products
---Task 1 :-
---1.	Write a query to retrieve all records from the Customers table..
 select * from Customers
 ---2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
select name, email from customers where name like 'j%'
---3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
select Orderid, Productname, Quantity from orders
---4.	Write a query to calculate the total quantity of products ordered.
select sum(Quantity) 'Total Qantity' from orders
---5.	Write a query to retrieve the names of customers who have placed an order.
select Orders.OrderID,Customers.Name from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID
---6.	Write a query to retrieve the products with a price greater than $10.00.
select Productname,Price from Products where Price>10
---7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'
select C.Name,O.OrderDate from Customers as c full join Orders as o on C.CustomerID=O.CustomerID where OrderDate >= '2023-07-05'
---8.	Write a query to calculate the average price of all products.
select AVG(price) 'Average price' from Products
---9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
select C.Name,O.Quantity from Customers as c inner join Orders as o on C.CustomerID=O.CustomerID
---10.	Write a query to retrieve the products that have not been ordered.
select O.OrderID,P.ProductName from Orders as o inner join Products as p on O.OrderID is null
select * from Customers
select * from Orders
select * from Products
---Task 2 :-
---1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
select top 5 C.Name,O.Quantity from Customers as c inner join Orders as o on C.CustomerID=O.OrderID order by Quantity desc
---2.	Write a query to calculate the average price of products for each product category.
select O.ProductName,AVG(O.Quantity*P.Price)'Average price' from Orders as o inner join Products as p
on O.OrderID=P.ProductID  group by O.ProductName 
---3.	Write a query to retrieve the customers who have not placed any orders.
select O.OrderID,C.Name from Orders as o full join Customers as c on O.CustomerID=C.CustomerID where O.OrderID is null
---4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
select O.OrderID,O.ProductName,O.Quantity,C.Name from Orders as o full join Customers as c on O.CustomerID=C.CustomerID
where C.Name like 'M%'
---5.	Write a query to calculate the total revenue generated from all orders.

select sum(o.Quantity*p.Price) 'Total Revenue' from Orders as o inner join Products as p on O.OrderID=P.ProductID
---6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.

select c.Name, sum(o.Quantity*products.Price) 'Total Revenue' from Customers as c inner join Orders as o
on c.CustomerID=O.CustomerID 
inner join Products on 
c.CustomerID=products.ProductID
group by c.Name
---7.Write a query to retrieve the customers who have placed at least one order for each product category.

select * from Customers
select * from Orders
select * from Products
select C.CustomerID ,  C.Name,O.ProductName
from Customers As C
inner join Orders AS O
on C.CustomerID=O.CustomerID
INNER JOIN Products p 
ON p.ProductName = o.ProductName
group by C.Name,O.ProductName , C.CustomerID
having count (Distinct p.ProductID) >=1;
---8.	Write a query to retrieve the customers who have placed orders on consecutive days.

---9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.

select top 3 Productname, avg(Quantity) 'Average Quantity' from Orders
group by ProductName
order by [Average Quantity] desc
---10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity

SELECT 
	(COUNT(CASE  WHEN O.Quantity > Avg.Quantity THEN 1 END)*100.0)/COUNT(*) AS Percentage FROM  Orders AS O
CROSS JOIN 
	(SELECT AVG(Quantity) AS Quantity FROM  Orders) AVG
	select * from Customers
select * from Orders
select * from Products
---Task 3:-

---1.	Write a query to retrieve the customers who have placed orders for all products.

select C.Name from Customers as C inner join Orders as O
on C.CustomerID=O.CustomerID
group by C.Name
having count(distinct O.OrderID ) = (select count (*)  from Orders)
---2.	Write a query to retrieve the products that have been ordered by all customers.

select O.ProductName from Orders as o inner join Customers as c
on C.CustomerID=O.CustomerID
group by o.ProductName
having count(distinct C.Name ) = (select count (*)  from Customers)
--OR
SELECT p.ProductName 
FROM Products p 
	WHERE NOT EXISTS ( SELECT 1 FROM Customers c 
		WHERE NOT EXISTS ( SELECT 1 FROM Orders o 
			WHERE o.CustomerID = c.CustomerID AND o.ProductName = p.ProductName ) );
			---3.Write a query to calculate the total revenue generated from orders placed in each month.
select  o.orderdate,MONTH(OrderDate) 'month',
O.Quantity* p.price 'Total Revenue' from Orders as o inner join Products p
on O.orderid=p.productid
order by Month
---4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.

select O.ProductName from Orders as O
inner join Customers as c on O.OrderID=C.CustomerID
group by ProductName
--HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(*)*0.5 FROM Customers)
having count(distinct o.CustomerID)/COUNT(*)>0.5 
---5.	Write a query to retrieve the customers who have placed orders for all products in a specific category.
select C.Name,O.ProductName from Customers as C full join Orders as O on c.CustomerID=O.CustomerID
where ProductName='Product A'
---6.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.

select top 5 C.Name,O.Quantity*Products.Price 'highest amount' from Customers as c inner join Orders as o 
on C.CustomerID=O.CustomerID inner join Products on O.OrderID=Products.ProductID
order by [highest amount] desc
---7.Write a query to calculate the running total of order quantities for each customer.

select C.Name,O.Quantity from Customers as c inner join Orders as o on C.CustomerID=O.CustomerID
order by Quantity 
---8.	Write a query to retrieve the top 3 most recent orders for each customer.
select top 3 OrderID,OrderDate from Orders 
order by OrderDate desc
---9.	Write a query to calculate the total revenue generated by each customer in the last 30 days.

select c.Name, O.Quantity * (P.Price) 'total revenue' from Customers as c inner join Orders as o on C.CustomerID=O.CustomerID
inner join Products as p on O.OrderID=P.ProductID
---10.	Write a query to retrieve the customers who have placed orders for at least two different product categories.
select C.Name,O.ProductName from Customers as c inner join Orders as o on C.CustomerID=O.CustomerID
order by Name
---11.	Write a query to calculate the average revenue per order for each customer.

select AVG(O.Quantity*P.Price) 'average revenue' from Orders as o inner join Products as p on O.OrderID=P.ProductID
---12.	Write a query to retrieve the products that have been ordered by customers from a specific country.

----13.	Write a query to retrieve the customers who have placed orders for every month of a specific year.

select C.Name from Customers as c inner join Orders as o on C.CustomerID=O.CustomerID
where YEAR(orderdate)=2023
group by NAME
having count (distinct month(orderdate))=12

---14.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
SELECT c.Name FROM Customers c 
INNER JOIN 
Orders o1 
ON c.CustomerID = o1.CustomerID
INNER JOIN Orders o2 
ON c.CustomerID = o2.CustomerID 
WHERE 
o1.ProductName = 'ProductName' AND o2.ProductName = 'ProductName' AND DATEDIFF(MONTH, o1.OrderDate, o2.OrderDate) = 1;






---15.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.
SELECT p.ProductName FROM Products p 
INNER JOIN 
Orders o
ON p.ProductName = o.ProductName
WHERE o.CustomerID = 1 
GROUP BY p.ProductName 
HAVING COUNT(*) >= 2;





 






