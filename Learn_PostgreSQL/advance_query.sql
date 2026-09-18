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


