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