Create database HR
CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);
CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INT  PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);


CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);


CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO regions(region_id,region_name) 
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) 
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) 
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) 
VALUES (4,'Middle East and Africa');

select* from regions
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);

Select * from countries
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

select * from locations
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);

select * from jobs
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);


select * from departments

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

 select * from employees

 INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);

select * from dependents

---TASK 1:
---1)WRITE A QUERY FOR  SELECT STATEMENTS :-

---A.	To get data from all the rows and columns in the employees table:
select * from employees

---B.	select data from the employee id, first name, last name, and hire date of all rows in the employees table:
select employee_id,first_name,last_name,hire_date from employees

---C.	to get the first name, last name, salary, and new salary:

alter table employees
add New_Salary decimal(10,2) 

---D.	Increase the salary two times and named as New_SALARY from employees table
select salary,2*salary 'New Salary' from employees
--OR
update employees
set New_salary = 2*salary

----2)WRITE A QUERY FOR ORDER BY  STATEMENTS :-
---A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
select employee_id, first_name, last_name, hire_date,salary from employees

---B.	to sort employees by first names in alphabetical order:
select First_name from employees
order by first_name

---C.	to sort the employees by the first name in ascending order and the last name in descending order:
select * from employees
order by first_name , last_name desc

---D.	to sort employees by salary from high to low:
select * from employees
order by salary desc

---E.	to sort the employees by values in the hire_date column from:
select * from employees
order by hire_date

---F.	sort the employees by the hire dates in descending order:
select * from employees
order by hire_date desc

---3)WRITE A QUERY FOR DISTINCT  STATEMENTS 

---A.selects the salary data from the salary column of the employees table and sorts them from high to low:
select salary from employees
order by salary desc


---B.	select unique values from the salary column of the employees table:
select distinct salary from employees


---C.selects the job id and salary from the employees table:
select job_id , salary from employees


---D.	to remove the duplicate values in job id and salary:
select distinct (job_id ) from employees


select distinct salary from employees
select distinct job_id from employees


---E.	returns the distinct phone numbers of employees:
select * from employees

select distinct phone_number from employees

---4)WRITE A QUERY FOR TOP N  STATEMENTS :-

---A.	returns all rows in the employees table sorted by the first_name column.
select * from employees
order by first_name


---B.to return the first 5 rows in the result set returned by the SELECT clause:
select top 5 * from employees


---C.	to return five rows starting from the 4th row:

SELECT TOP 5 *FROM employeesWHERE employee_id NOT IN (    SELECT TOP 4 employee_id    FROM employees    ORDER BY employee_id)ORDER BY employee_id;


---D.	gets the top five employees with the highest salaries.
select top 5 * from employees
order by salary desc

---E.	to get employees who have the 2nd highest salary in the company
select * from employees where salary= 170000 and new_salary=34000

---5)WRITE A QUERY FOR WHERE  CLAUSE and COMPARISON OPERATORS :-

---A. query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
select * from employees
where salary>14000 
order by salary desc


---B. query finds all employees who work in the department id 5.
select * from employees
where department_id=5


---C. query finds the employee whose last name is Chen
select * from employees
where last_name='Chen'


---D. To get all employees who joined the company after January 1st, 1999
select * from employees
where hire_date > '1999-01-01'


---E. to find the employees who joined the company in 1999,
select * from employees
where year(hire_date)= '1999'



---F.  statement finds the employee whose last name is Himuro
select * from employees
where last_name='Himuro'


---G. the query searches for the string Himuro in the last_name column of the employees table.
select * from employees
where last_name='Himuro'


---H. to find all employees who do not have phone numbers:
select * from employees
where phone_number is null


---I. returns all employees whose department id is not 8.
select * from employees
where department_id  != 8


---J. finds all employees whose department id is not eight and ten.
select * from employees
where department_id  != 8 and department_id !=10


---K. to find the employees whose salary is greater than 10,000,
select * from employees
where salary >10000


---L. finds employees in department 8 and have the salary greater than 10,000:
select * from employees
where department_id=8 and salary>10000


---M.	the statement below returns all employees whose salaries are less than 10,000:
select * from employees
where  salary<10000


---N.	finds employees whose salaries are greater than or equal 9,000:
select * from employees
where  salary>=9000


---O.	finds employees whose salaries are less than or equal to 9,000:
select * from employees
where  salary<=9000

---6)WRITE A QUERY FOR:-

---A.	to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables.
CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);


CREATE  TABLE  project_milestones(
    milestone_id  INT  primary key,
    project_id   INT foreign key references projects(project_id),
    milestone_name VARCHAR(100)
);



---B.	Suppose the project_milestones already exists without any predefined foreign key and you want to define a 
---FOREIGN KEY constraint for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table
alter table project_milestones
alter column project_id int not null

alter table project_milestones
add constraint fk_  foreign key (project_id)

---TASK 2:

---1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
---Part 1:-

---A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:
select * from employees
where salary >5000 and salary<7000

---B.	finds employees whose salary is either 7,000 or 8,000:
select * from employees
where salary =7000 or salary=8000



---C.	finds all employees who do not have a phone number:
select * from employees
where phone_number is null


---D.	finds all employees whose salaries are between 9,000 and 12,000.
select * from employees
where salary between 9000 and 12000


---E.	finds all employees who work in the department id 8 or 9.
select * from employees
where department_id = 8 or department_id=9


---F.	finds all employees whose first name starts with the string jo
select * from employees
where first_name like 'jo%'


---G.	finds all employees with the first names whose the second character is  h
select * from employees
where first_name like '_h%'


---H.	finds all employees whose salaries are greater than all salaries of employees in the department 8:
select * from employees
where salary>(select max(salary) from employees where department_id =8)



---Part 2:- 
---A.	finds all employees whose salaries are greater than the average salary of every department:
select e.employee_id,e.salary,d.department_name from employees as e inner join departments as d on
e.department_id=d.department_id
where salary>(select AVG(salary) from employees)


---B.	finds all employees who have dependents:
select e.employee_id,e.first_name from employees as e inner join dependents as d
on e.employee_id=d.employee_id

select * from dependents

---C.	to find all employees whose salaries are between 2,500 and 2,900:
select * from employees
where salary between 2500 and 2900


---D.	to find all employees whose salaries are not in the range of 2,500 and 2,900:
select * from employees
where salary not between 2500 and 2900


---E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
select * from employees
where hire_date between '1999-01-01' and '2000-12-31'


---F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
select * from employees
where hire_date not between '1989-01-01' and '1999-12-31'


---G.	to find employees who joined the company between 1990 and 1993:
select * from employees
where year(hire_date) between '1990' and '1993'




---Part 3:-

---A.	to find all employees whose first names start with Da
select * from employees
where first_name like 'Da%'


---B.	to find all employees whose first names end with er
select * from employees
where first_name like '%er'


---C.	to find employees whose last names contain the word an:
select * from employees
where last_name like '%an%'


---D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
select * from employees
where first_name like 'Jo__'


---E.	to find employees whose first names start with any number of characters and are followed by at most one character:
select * from employees
where first_name like '_%'


---F.	to find all employees whose first names start with the letter S but not start with Sh:
select * from employees
where first_name like 's%' and 
first_name not like 'sh%'


---Part 4:-
--A.	retrieves all employees who work in the department id 5.
select * from employees 
where department_id=5


---B.	To get the employees who work in the department id 5 and with a salary not greater than 5000.
select * from employees 
where department_id=5 and salary <5000


---C.	statement gets all the employees who are not working in the departments 1, 2, or 3.
select * from employees 
where department_id  not in (1,2,3)


---D.	retrieves all the employees whose first names do not start with the letter D.
select * from employees
where first_name not like 'D%'


---E.	to get employees whose salaries are not between 5,000 and 1,000.
select * from employees
where salary not between 1000 and 5000




---Part 5:- 
select * from employees
select * from dependents

---A.	Write a query to get the employees who do not have any dependents 
select e.employee_id ,e.first_name,e.last_name from employees as e left join dependents as d on e.employee_id=d.employee_id
where d.employee_id is null


---B.	To find all employees who do not have the phone numbers
select * from employees
where phone_number is null


---C.	To find all employees who have phone numbers
select * from employees
where phone_number is not null



----TASK 3:

select * from employees
select * from departments

---1)	Write a Query to 
---A.	To get the information of the department id 1,2, and 3
select * from departments
where department_id in (1,2,3)


---B.	To get the information of employees who work in the department id 1, 2 and 3
select * from employees as e inner join departments as d on e.department_id=d.department_id
where d.department_id in (1,2,3)


select * from jobs
select * from employees
select * from departments

---Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3.

select e.first_name,e.last_name,j.job_title,d.department_name from jobs as j inner join departments as d
on j.job_id=d.department_id inner join employees as e on d.department_id=e.department_id
where d.department_id in(1,2,3)



---Write a Query :--
---SQL left join
---A.	To query the country names of US, UK, and China
select * from countries
select * from locations

select * from countries
where country_id in ('US','UK','China')



---B.	query retrieves the locations located in the US, UK and China:
select location_id,street_address,postal_code,city,state_province,country_id from locations
where country_id in ('US','UK','China')

---C.	To join the countries table with the locations table
select * from countries left join locations on countries.country_id=locations.country_id


---D.	to find the country that does not have any locations in the locations table
select c.country_name from countries as c left join locations as l on c.country_id=l.country_id
where location_id is null


---Write a query to join 3 tables: regions, countries, and locations
select * from regions
select * from countries
select * from locations

select * from regions as r full join countries as c on r.region_id=c.region_id 
full join locations on c.country_id=locations.country_id
--OR
select * from regions as r inner join countries as c on r.region_id=c.region_id 
inner join locations as l on c.country_id=l.country_id



select * from employees
--- SQL self-join
----Write a query  statement to  joins the employees table to itself to query the information of who reports to whom












----SQL FULL OUTER JOIN clause

CREATE  TABLE  fruits (
	fruit_id  INT PRIMARY KEY,
	fruit_name  VARCHAR (255) NOT NULL,
	basket_id  INTEGER
);

CREATE TABLE baskets (
	basket_id  INT PRIMARY KEY,
	basket_name  VARCHAR (255) NOT NULL
);


INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');


INSERT  INTO  fruits (
	fruit_id,
	fruit_name,
	basket_id
)
VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);

select * from fruits
select * from baskets


----A.	Write a query to  returns each fruit that is in a basket and each basket that has a fruit, 
---but also returns each fruit that is not in any basket and each basket that does not have any fruit.

select f.fruit_name,b.basket_name from fruits as f full outer join baskets as b
on f.basket_id=b.basket_id


---B.	Write a query to find the empty basket, which does not store any fruit
select f.fruit_name,b.basket_name from fruits as f full outer join baskets as b
on f.basket_id=b.basket_id
where fruit_name is null


---C.	Write a query  which fruit is not in any basket
select f.fruit_name,b.basket_name from fruits as f full outer join baskets as b
on f.basket_id=b.basket_id
where basket_name is null




----SQL CROSS JOIN clause

CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255)
);

 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255)
);


INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');


INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');

select * from sales_organization
select * from sales_channel

---Write a Query To find the all possible sales channels that a sales organization 
select * from sales_organization cross join sales_channel




---TASK 4:

select * from employees
select * from departments

---A.	to group the values in department_id column of the employees table:
select department_id , count(department_id) 'count' from employees
group by department_id


---B.	to count the number of employees by department:
select count(e.employee_id)'count',d.department_name from employees as e inner join departments as d on e.department_id=d.department_id
group by department_name


---C.	returns the number of employees by department
select count(e.employee_id)'count',d.department_name from employees as e inner join departments as d on e.department_id=d.department_id
group by department_name

---D.	to sort the departments by headcount:
select department_name, count(department_id) 'headcount'  from departments
group by department_name


---E.	to find departments with headcounts are greater than 5:
select department_name, count(department_id) 'headcount'  from departments
group by department_name 
having count(department_id) > 5


---F.	returns the minimum, maximum and average salary of employees in each department.
select min(e.salary)'Minimun salary',max(e.salary)'Maximum salary',AVG(e.salary)'Average salary',d.department_name from employees as e inner join departments as d
on e.department_id=d.department_id
group by department_name


---G.	To get the total salary per department,
select sum(e.salary)'Total salary',departments.department_name from employees as e inner join departments
on e.department_id=departments.department_id
group by department_name


---H.	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups
select * from departments
select * from jobs

select * from departments inner join  jobs on department_id=job_id





------------------------
select * from employees
select * from dependents

---A.	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports.



---B.	To find the managers who have at least five direct reports




---C.calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.
select d.department_name,sum(e.salary)'sum of salary' from departments as d inner join employees as e on d.department_id=employees.department_id
group by department_name
having sum(e.salary) between 20000 and 30000



---D.	To find the department that has employees with the lowest salary greater than 10000
select d.department_name, min(e.salary)'lowest but>10000' from departments as d inner join employees as e on d.department_id=e.department_id
group by d.department_name
having min(e.salary)>10000


---E.	To find the departments that have the average salaries of employees between 5000 and 7000
select d.department_name,avg(e.salary)'Average salary' from departments as d inner join employees as e on d.department_id=e.department_id
group by department_name
having sum(e.salary) between 20000 and 30000



-------
---Write a Query to combine the first name and last name of employees and dependents
select * from employees


select employee_id, concat(employees.first_name,' ',employees.last_name)'full name' from employees
union all
select employee_id ,concat(dependents.first_name,' ' ,dependents.last_name)'full name' from dependents


------------------------------
---A.	finds all employees who have at least one dependent.


select employee_id, concat(employees.first_name,' ',employees.last_name)'full name' from employees
intersect
select concat(dependents.first_name,' ' ,dependents.last_name)'full name' from dependents


---B . finds employees who do not have any dependents:






---B.	Write a Query  If the salary is less than 3000, the CASE expression returns “Low”.
---If the salary is between 3000 and 5000, it returns “average”. 
---When the salary is greater than 5000, the CASE expression returns “High”.

select salary,
case
when salary<3000 then 'Low'
when salary between 3000 and 5000 then 'Average'
else 'High' 
end 'Salary range'
from employees



------
select * from employees
select * from dependents

---Suppose the employee id 192 Sarah Bell changed her last name from Bell to Lopez and you need to update her record in the  employees table.
---Write a Query to update Sarah’s last name from  Bell to Lopez

update employees set last_name= 'Lopez' where employee_id='192' 


---How to  make sure that the last names of children are always matched with the last name of parents in the  employees table
select e.first_name,e.last_name , d.first_name,d.last_name from employees as e inner join dependents as d
on e.employee_id =d.employee_id 
where e.last_name=d.last_name






----FINAL TASK  
select * from employees
select * from departments



--A. Combine two queries using subquery inorder find all departments located at the location whose id is 1700 and
-----find all employees that belong to the location 1700 by using the department id list of the previous query

select * from departments
where location_id =1700

select e.employee_id,e.first_name,e.last_name,departments.department_id, departments.department_name,departments.location_id from employees as e join
(select * from departments
where location_id =1700) departments
on e.department_id=departments.department_id


---B.	to find all employees who do not locate at the location 1700:
select e.employee_id,e.first_name,e.last_name,departments.department_name,departments.location_id from employees as e join
(select * from departments
where location_id != 1700 ) departments
on e.department_id=departments.department_id


---C.	finds the employees who have the highest salary:
select top 1 employee_id,first_name, last_name, salary from  employees
order by salary desc


---D.	finds all employees who salaries are greater than the average salary of all employees:
select employee_id, first_name, last_name , salary from employees
where salary > (select AVG(salary) from employees) 


---E.	finds all departments which have at least one employee with the salary is greater than 10,000:

select e.employee_id , e.salary,d.department_name from employees as e inner join departments as d on 
e.department_id=d.department_id
where salary > 10000 



---F.	finds all departments that do not have any employee with the salary greater than 10,000:

select e.employee_id , e.salary,d.department_name from employees as e full join departments as d on 
e.department_id=d.department_id
where salary <= 10000






---G.	to find the lowest salary by department:
select min(e.salary)'Lowest salary',d.department_name  from employees as e inner join departments as d
on e.department_id=d.department_id
group by department_name




---H.	finds all employees whose salaries are greater than the lowest salary of every department:
select e.employee_id,e.first_name,e.last_name,e.salary,d.department_name from employees as e join
departments as d on e.department_id=d.department_id
where salary>(select min(salary)'Lowest salary' from employees)



---I.	finds all employees whose salaries are greater than or equal to the highest salary of every department
select min(e.salary)'Lowest salary',d.department_name  from employees as e inner join departments as d
on e.department_id=d.department_id
group by department_name




---J.	returns the average salary of every department
select d.department_name, avg(e.salary)'Average salary'  from departments as d inner join employees as e
on e.department_id=d.department_id
group by d.department_name



---K.	to calculate the average of average salary of departments :
select avg(employees.[Average salary])'Average salary' from (select d.department_name, avg(e.salary)'Average salary'  from departments as d inner join employees as e
on e.department_id=d.department_id
group by d.department_name) employees



---L.	finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.
select  salary, AVG(salary) 'Average salary',
salary-AVG(salary)'Salary Difference' from employees
group by salary









