-- Constraint check
select * from employees;

alter table employees drop ph_number;

alter table  employees add column mobile_no varchar(20) unique check ( length(mobile_no)= 10);


insert  into employees values(11, 'raghu', 'Sharma', 'work.raghu101@gmail.com', 'IT', 50000.00, '2020-01-15',23,1234567839);
insert  into employees values(12, 'ranu', 'Sharma', 'isklem@gmail.com', 'IT', 50000.00, '2020-01-15',23,1286804999);

--  Name Constraint
alter table employees add constraint  email_at_list_5_words check ( length(email)>=5 );


insert  into employees values(13, 'ritu', 'Sharma', 'riyu.work@gmail.com', 'IT', 54100.00, '2020-01-15',31,1245678391);

insert into  employees (emp_id, fname, lname, email) values (14,'Kushal','Das','kusal@gmail.com');


-- case expression

select employees.fname ,employees.salary ,case when employees.salary>= 50000 then 'high'
else 'low'end as sal_catagory from employees;

-- salary low , mid , high cases

select employees.fname ,employees.salary ,case
    when employees.salary > 50000 then 'high'
    when employees.salary between 45000 and 50000 then 'mid'
    else 'low'end as sal_catagory from employees;


SELECT
    fname,
    salary,
    (salary * 0.10) AS bonus
FROM employees;