#Stored Procedure in Sql
show databases;
create database sql_iq;
create table players(player_id int, name varchar(20), country varchar(15), goals int );
insert into players values
('101', "Sam", "USA", '6'),
('102', "Daniel", "England", '7'),
('103', "Anthony", "France", '10'),
('104', "Bruno", "Sweden", '6'),
('105', "Alex", "Wales", '5'),
('106', "Matt", "Scotland", '3');

select*from players;

delimiter &&
create procedure top_player()
begin
select name, country, goals
from players where goals>6;
END &&
delimiter ;

call top_player();

#SP using IN parameter
delimiter //
create procedure sp_sortBySalary(IN var int)
begin
select name, Age, Salary from emp_details
order by salary desc limit var;
end //
delimiter ;
call sp_sortBySalary(3);

delimiter //
create procedure update_salary(IN temp_name varchar(20), in
new_salary float)
begin
update emp_details set
salary = new_salary where name = temp_name;
end; //

select*from emp_details;

call update_salary('Amit Verma',80000);

#SP using OUT parametre

delimiter //
create procedure sp_CountEmployees(OUT Total_Emps int)
begin
select count(name) into Total_Emps from emp_details
where sex='F';
end //
delimiter ;

call sp_CountEmployees(@F_emp);
select @F_emp as FemaleEmps;

#Triggers in SQL

create table student(st_roll int, age int, name varchar(30), marks float);

delimiter //
create trigger marks_verify
before insert on student
for each row
if new.marks<0 then set new.marks=50;
end if //

insert into student 
values(501,10,'Ruth',75.0),
(502,8,'Abhi',-66.3),
(503,13,'Dave',90.0),
(504,10,'Jacobs',-12.5);

SELECT 
    *
FROM
    student;

# drop trigger marks_verify

#Views in SQL

 use classicmodels;
 
SELECT 
    *
FROM
    customers;

CREATE VIEW cust_details AS
    SELECT 
        customerName, phone, city
    FROM
        customers;

SELECT 
    *
FROM
    cust_details;

SELECT 
    *
FROM
    productlines;

CREATE VIEW product_description AS
    SELECT 
        productName, quantityinstock, msrp, textdescription
    FROM
        products AS p
            INNER JOIN
        productlines AS pl ON p.productline = pl.productline;

SELECT 
    *
FROM
    product_description;

#Rename description

rename table product_description 
to vehicle_description;

#Display views

show full tables
where table_type = 'VIEW';

#Delete Views

drop view pruduct_description

#Windows functionm

use sql_intro;

SELECT 
    *
FROM
    employees;

select emp_name,age,dep,
sum(salary) over(partition by dep)as totale_salary
from employees;

#Row Number

select row_number() over(order by salary)as row_num,
emp_name,salary from employees order by salary;

CREATE TABLE demo (
    st_id INT,
    st_name VARCHAR(30)
);

insert into demo 
values(101,'Shane'),
(102,'Bredley'),
(103,'Herath'),
(103,'Herath'),
(104,'Nethan'),
(105,'Kevin'),
(105,'Kevin');

SELECT 
    *
FROM
    demo;

select st_id,st_name, row_number() over
(partition by st_id,st_name order by st_id)as row_num
from demo;

CREATE TABLE demo1 (
    var_a INT
);

insert into demo1
values(101),(102),(103),(103),(104),(105),(106),(106),(107);

select var_a,
rank() over (order by var_a)as test_rank
from demo1;

# First values

select emp_name,age,salary, first_value(emp_name)
over (order by salary desc)as highest_salary from employees;

select emp_name,dep,salary, first_value(emp_name)
over(partition by dep order by salary desc)as highest_salary
from employees;