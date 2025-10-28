#Subqueries
show databases;
use sql_intro;
show tables;
select*from employees;
select emp_name, dep, salary
from employees where salary>(select avg(salary) from employees);

select emp_name, gender, dep, salary 
from employees where salary >
 (select salary from employees where emp_name='william');
 
 use classicmodels;
 show tables;
 select*from products;
 select*from orderdetails;
 
 select productcode,productname, msrp from products
 where productcode in(select productcode from orderdetails
 where priceeach<100);
 