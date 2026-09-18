--Types of Relationship
-- One  to One
-- One to Many
-- Many to Many

create database store_db;

--
CREATE TABLE customers
(
    cust_id   SERIAL PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

CREATE  TABLE orders(
    ord_id SERIAL PRIMARY KEY ,
    order_date DATE NOT NULL ,
    price NUMERIC NOT NULL ,

    cust_id INTEGER NOT NULL ,
    FOREIGN KEY(cust_id) REFERENCES customers(cust_id)
);