-- Types of Join

-- 1.Cross Join
-- 2.Inner Join
-- 3.Left Join
-- 4.Right Join

select * from orders;
select * from customers;

-- CROSS JOIN
-- Every row from one table is combined with every row from another table.

SELECT * from customers cross join orders ;

-- INNER JOIN
-- Returns only the rows where there is a match
-- between the specified columns in both the
-- left (or first) and right (or second) tables.

SELECT * from
customers
inner join
orders
on customers.cust_id = orders.cust_id ;
-- we can also create alias for this like customers as  client
-- client.cust_id == customers.cust_id


SELECT c.cust_name, COUNT(o.ord_id) AS total_orders
FROM customers as c
INNER JOIN orders as o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;


SELECT c.cust_name, sum(o.price) AS total_orders
FROM customers as c
INNER JOIN orders as o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;


-- LEFT JOIN
-- Returns all rows from the left (or first) table
-- and the matching rows from the right (or
-- second) table.

SELECT * from customers
left join orders
on customers.cust_id = orders.cust_id;