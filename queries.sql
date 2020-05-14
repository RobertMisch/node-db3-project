-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
-- select c.CategoryName, p.ProductName
-- from categories as c
-- join products as p on c.categoryId = p.categoryId
select c.CategoryName, p.ProductName
from category as c
join product as p on c.Id = p.categoryId
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id, s.ShipperName, o.orderdate
from [order] as o
join Shipper as s on o.shipvia = s.id
where o.orderdate < '2012-08-09'
order by o.orderdate desc
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select o.quantity, p.productname
from [orderdetail] as o 
join product as p on o.productid = p.id
where o.orderid= 10251
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
-- order, customer, employee
-- order: customerid,customer:id
-- order: employeeid, employee:id
select o.orderid, c.companyname, e.lastname
from [order] as o
join customer as c on o.customerid=c.id
join employee as e on o.employeeid=e.id