SELECT current_user;

SELECT rolname, rolcreatedb, rolsuper
FROM pg_roles
WHERE rolname = current_user;

CREATE DATABASE bank_db;

CREATE TABLE employees(
    emp_id SERIAL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL ,
    lname VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL  UNIQUE ,
    dept  VARCHAR(50),
    salary DECIMAL(10,2) DEFAULT  30000.00,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date)

      VALUES

(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),

(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),

(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),

(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),

(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),

(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),

(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),

(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),

(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),

(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');



SELECT * FROM employees ;


-- clauses
-- Where
-- Distinct
-- Order By
-- limit
-- Like


-- WHERE

SELECT * FROM employees where emp_id = 5;

SELECT * FROM employees where dept ='HR';

SELECT * FROM employees WHERE salary >= 50000 ;

SELECT * FROM employees where dept ='HR'or dept='IT';

SELECT * FROM employees where dept ='IT' and salary > 50000;

--  convenient way to represent
SELECT * FROM employees WHERE dept IN('IT','HR','Finance');

SELECT * FROM employees WHERE dept NOT IN('IT','HR','Finance');

SELECT * FROM employees WHERE  salary BETWEEN  40000 and 60000;

