create database institute_db;

-- student table
create table students
(
    s_id serial primary key ,
    name varchar(150) not null
);

-- course table
create table courses
(
    c_id serial primary key ,
    c_name varchar not null ,
    c_fees numeric not null default  1000
);

-- enrollment
create table  emrollments
(
    enroll_id serial primary key ,
    s_id int not null ,
    c_id int not null,
    enroll_date date not null ,
    foreign key (s_id)references students(s_id),
    foreign key (c_id)references courses(c_id)
);

insert  into students(name)
values
    ('Raju'),
    ('Sham'),
    ('Alex');

insert into courses(c_name, c_fees)
values
    ('Math',500),
    ('Physics',600),
    ('Chem',700);

insert into emrollments(S_ID, C_ID, ENROLL_DATE)
values
    (1, 1, '2024-01-01'), -- Raju enrolled in Mathematics
    (1, 2, '2024-01-15'), -- Raju enrolled in Physics
    (2, 1, '2024-02-01'), -- Sham enrolled in Mathematics
    (2, 3, '2024-02-15'), -- Sham enrolled in Chemistry
    (3, 3, '2024-03-25'); -- Student 3 enrolled in Chemistry


select
    s.name ,
    c.c_name ,
    e.enroll_date,
    c.c_fees
from emrollments as e

join  students as s on e.s_id = s.s_id
join courses as c on e.c_id = c.c_id;