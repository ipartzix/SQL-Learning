-- create a table with this columns

CREATE TABLE person (
    id INT,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Insert data in table
INSERT INTO person(id, name, city)
VALUES (101,'Raju','Delhi ')

-- see the entire table
SELECT * FROM person;

-- see the specific column
SELECT id FROM person;
-- see those specifics columns
SELECT id , city FROM person;

SELECT * FROM person;

-- update --
UPDATE  person
SET  city= 'Kalkata'
WHERE  person.name = 'Raju' ;

SELECT * FROM person;

-- delete --
DELETE FROM person
WHERE id = 101