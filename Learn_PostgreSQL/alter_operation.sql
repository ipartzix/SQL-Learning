SELECT * from employees ;

-- add two column age and phone_no its default is Null

ALTER TABLE  employees add column  age INT ;
ALTER TABLE employees add column  phone_no INT ;

-- drop (delete) column
ALTER TABLE employees DROP phone_no ;
-- create a column with default value 0
ALTER TABLE employees add column  phone_no INT default 0;

-- RENAME TABLE
ALTER  TABLE  employees RENAME COLUMN phone_no TO  ph_number ;

-- rename table
ALTER TABLE employees RENAME TO emp_data ;

select * from emp_data;

ALTER TABLE emp_data  RENAME TO  employees ;
