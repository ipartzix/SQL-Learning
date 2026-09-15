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

-- DISTINCT
-- use it for find unique values

SELECT DISTINCT dept from employees;

-- Order by

SELECT * FROM employees ORDER BY fname;
-- by default order by make it accenting
SELECT * FROM  employees ORDER BY fname DESC ;
-- now it become descending


-- LIMIT

SELECT * FROM employees LIMIT 3;
-- it just shows top 3



-- LIKE

SELECT * FROM employees WHERE fname LIKE 'A%';
-- name start with A

SELECT * FROM employees WHERE fname LIKE '%a';
-- name end with
-- it case-sensitive

SELECT * FROM employees WHERE fname LIKE '%i%';


SELECT * FROM employees WHERE dept LIKE '__';

SELECT * FROM employees WHERE fname LIKE '_a%';



-- aggregate function

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX


-- COUNT
-- COUNT use for counting
SELECT count(emp_id) FROM employees;

SELECT count(fname) FROM employees;

-- SUM
-- sum of a column

SELECT  sum(employees.salary) FROM employees;

-- AVG
-- average of a column
SELECT  avg(employees.salary) FROM employees;

-- MIN
-- minimum from the table
SELECT  min(employees.salary) FROM employees;

-- MAX
-- maximum from the table
SELECT  max(employees.salary) FROM employees;

-- GROUP BY

SELECT dept FROM employees GROUP BY dept;

SELECT dept,count(employees.emp_id),sum(salary) FROM employees GROUP BY dept;


-- STRING FUNCTION
-- CONCAT
-- , work as separator for diff columns
SELECT concat(employees.fname,employees.lname) from employees;

SELECT concat(employees.fname,employees.lname) AS Fullname from employees;

SELECT employees.emp_id , concat(employees.fname,employees.lname) AS Fullname , employees.salary,employees.email from employees;

-- CONCATE_WS

SELECT concat_ws(' ' ,employees.fname,employees.lname) AS Fullname from employees;
SELECT concat_ws(',' ,employees.fname,employees.lname) AS Fullname from employees;

-- SUBSTRING
SELECT substr('Hello Friend',1 ,4);

-- REPLACE

SELECT replace('Hello Friend ','Hello','Hey');

SELECT replace (employees.dept,'IT','TECH')from employees;

-- REVERSE

SELECT reverse(employees.email) from employees ;

-- LENGTH

SELECT length(employees.email), employees.email from employees;

SELECT * from employees where length(employees.fname)>5 ;

-- UPPER & LOWER
SELECT upper(employees.fname) from employees ;
SELECT lower(employees.fname) from employees ;

-- LEFT & RIGHT
SELECT left(employees.dept,4) from employees ;

SELECT right(employees.fname, 3) from employees ;

--TRIM

SELECT length('           world          ');

SELECT trim('           world          ');
SELECT length(trim('           world          '));

-- POSITION

SELECT position('om'in 'thomous');

-- practices

-- 1:Raj:Sharma:IT
SELECT concat_ws(':',employees.emp_id,employees.fname,employees.lname,employees.dept)from employees WHERE emp_id=1;

-- 1:Raj Sharma:IT:50000.00
SELECT concat_ws(':',employees.emp_id,concat_ws(' ',employees.fname,employees.lname),employees.dept,employees.salary)from employees WHERE emp_id=1;

-- 4:Suman:FINANCE
SELECT concat_ws(':',employees.emp_id,employees.fname,upper(employees.dept) ) from employees where  emp_id=4;

-- I1 Raju
-- H2 Priya

SELECT concat(left(employees.dept, 1),employees.emp_id) from employees;

select * from employees;

-- find highest salary paying
SELECT * FROM employees where salary=(select max(employees.salary) from employees);

-- find lowest salary paying
SELECT * FROM employees where salary=(select min(employees.salary) from employees);