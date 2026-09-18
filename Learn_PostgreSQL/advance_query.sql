-- STORED Routine
-- An SQL statement or a set of SQL
-- Statement that can be stored on
-- database server which can be call no. of
-- times.

-- Types of STORED Routine
-- 1. STORED Procedure
-- 2. User defined Functions

-- STORED PROCEDURE
-- Set of SQL statements and procedural logic that can perform operations such as inserting, updating, deleting, and querying data.

CREATE OR REPLACE PROCEDURE update_emp_salary(
    p_employee_id INT,
    p_new_salary NUMERIC
)
    LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_employee_id;
END;
$$;

call update_emp_salary(3,71000);

select * from employees;


CREATE OR REPLACE PROCEDURE add_employee(
    p_fname VARCHAR,
    p_lname VARCHAR,
    p_email VARCHAR,
    p_dept VARCHAR,
    p_salary NUMERIC
)
    LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employees (fname, lname, email, dept, salary)
    VALUES (p_fname, p_lname, p_email, p_dept, p_salary);
END;
$$;

call add_employee('Partha','Paul','parthapaul2705@gmail.com','MLE',90000);


-- USER DEFINED FUNCTIONS
-- custom function created by the user to perform specific operations and return a value

CREATE OR REPLACE FUNCTION dept_max_sal_emp1(dept_name VARCHAR)
    RETURNS TABLE(emp_id INT, fname VARCHAR, salary NUMERIC)
AS $$
BEGIN
    RETURN QUERY
        SELECT
            e.emp_id, e.fname, e.salary
        FROM
            employees e
        WHERE
            e.dept = dept_name
          AND e.salary = (
            SELECT MAX(emp.salary)
            FROM employees emp
            WHERE emp.dept = dept_name
        );
END;
$$ LANGUAGE plpgsql;

select *from dept_max_sal_emp1('HR');

-- Windows function

-- Window functions, also known as analytic
-- functions allow you to perform calculations
-- across a set of rows related to the current row.
-- Defined by an OVER() clause.


select employees.fname, employees.salary, sum(employees.salary) over (order by salary) from employees;-- it called running sum called



-- ROW_NUMBER()

select
    row_number() over (order by fname),
    employees.fname ,
    employees.dept,
    employees.salary
from employees;

select
            row_number() over (partition by dept),
            employees.fname ,
            employees.dept,
            employees.salary
from employees;


-- RANK()

select employees.fname , employees.salary,
       rank()  over (order by employees.salary DESC )
from employees;

select employees.fname , employees.salary,
       dense_rank()  over (order by employees.salary DESC )
from employees;