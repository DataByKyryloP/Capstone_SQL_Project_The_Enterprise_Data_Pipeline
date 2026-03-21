-- Create database
-- DROP DATABASE IF EXISTS parks_and_recreation;
-- CREATE DATABASE parks_and_recreation;

-- Connect to database (run separately in VS Code or psql)
-- \c parks_and_recreation


-- Tables


/*
CREATE TABLE employee_demographics (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE
);

CREATE TABLE employee_salary (
  employee_id INT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

CREATE TABLE parks_departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL
);


-- Data inserts
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);


INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');




SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

*/

SELECT LENGTH('skyfall');



SELECT first_name, UPPER(first_name)
FROM employee_demographics



SELECT UPPER('sky')
SELECT LOWER('SKY')

SELECT ('   sky   ' ) AS trimmed_string



SELECT first_name, 
LEFT(first_name, 4) AS first_four_letters,
RIGHT(first_name, 4) AS last_four_letters,
SUBSTRING(first_name, 2, 3) AS middle_three_letters,
birth_date,
SUBSTRING(birth_date:: TEXT, 6, 2) AS birth_month
FROM employee_demographics



SELECT first_name, REPLACE(first_name, 'a', 'z') AS replaced_name
FROM employee_demographics



SELECT STRPOS ('concatenate', 'cat');



SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics; 





SELECT dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;






SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;




SELECT 
dem.first_name, 
dem.last_name, 
gender, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;


