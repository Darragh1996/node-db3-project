-- Multi-Table Query Practice
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select
  CategoryName,
  ProductName
from Category c
join Product p on c.Id = p.CategoryId;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
  o.id,
  s.CompanyName
FROM [Order] o
JOIN Shipper s ON o.ShipVia = s.id
WHERE
  o.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
  p.productname,
  o.quantity
FROM product p
JOIN orderdetail o ON p.Id = o.ProductId
WHERE
  o.OrderId = 10251;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
  o.id order_id,
  c.companyname customer_company_name,
  e.LastName employee_last_name
FROM [order] o
JOIN customer c ON o.CustomerId = c.Id
JOIN employee e ON e.Id = o.EmployeeId;
--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT
  c.categoryname,
  count(p.categoryid)
FROM Categories c
join products p on p.categoryid = c.categoryid
group by
  c.categoryname;
--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT
  orderid,
  sum(quantity) itemCount
from orderdetails
group by
  orderid;
--Find the number of shipments by each shipper
select
  s.shippername,
  sum(od.quantity) total_shipments
from shippers s
join orders o on o.shipperid = s.shipperid
join orderdetails od on od.orderid = o.orderid
group by
  s.shippername