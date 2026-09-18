create database shopping_dtore_db ;

-- customers table
CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (cust_name)
VALUES
    ('Raju'),
    ('Sham'),
    ('Paul'),
    ('Alex')
;
-- orders table
CREATE TABLE orders (
    ord_id SERIAL PRIMARY KEY,
    ord_date DATE NOT NULL,
    cust_id INTEGER NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders (ord_date, cust_id)
VALUES
    ('2024-01-01', 1),  -- Raju first order
    ('2024-02-01', 2),  -- Sham first order
    ('2024-03-01', 3),  -- Paul first order
    ('2024-04-04', 2);  -- Sham second order

-- order_items table
CREATE TABLE order_items (
                             item_id SERIAL PRIMARY KEY,
                             ord_id INTEGER NOT NULL,
                             p_id INTEGER NOT NULL,
                             quantity INTEGER NOT NULL,
                             FOREIGN KEY (ord_id) REFERENCES orders(ord_id),
                             FOREIGN KEY (p_id) REFERENCES products(p_id)
);


INSERT INTO order_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard

-- products
CREATE TABLE products (
                          p_id SERIAL PRIMARY KEY,
                          p_name VARCHAR(100) NOT NULL,
                          price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00)
;

create view  billing_info as
select
    c.cust_name,
    p.p_name,
    o.ord_date,
    oi.quantity,
    p.price,
    (oi.quantity*p.price) as total_price
from order_items as oi
    join
    products as p on oi.p_id = p.p_id
    join
    orders as o on o.ord_id = oi.ord_id
    join
    customers c on o.cust_id = c.cust_id
;
-- create view of existing query

select * from  billing_info ;

--  HAVING Clause

-- The SQL HAVING clause is used to filter the results of a query after rows have been grouped
-- and aggregated by a GROUP BY clause. It was specifically introduced because the WHERE clause
-- cannot be used to filter conditions based on aggregate functions (like SUM(), COUNT(), AVG(), MAX(), or MIN()).

select p_name,
       sum(total_price)
from  billing_info
group by p_name
having sum(total_price)> 1500 ;

-- when we use group by we can not uss where we use having


select p_name,
       sum(total_price)
from  billing_info
group by rollup (p_name)--  ROLLUP extension tells the database to calculate standard groups plus a grand total for the entire table.
order by sum(total_price);


SELECT
    COALESCE(p_name, 'Grand Total') AS product_name,
    SUM(total_price) AS total_revenue
FROM
    billing_info
GROUP BY
    ROLLUP (p_name)
ORDER BY
    SUM(total_price);
