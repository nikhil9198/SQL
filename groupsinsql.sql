show databases;
use sql_intro;
show tables;
create table employees(Emp_Id int primary key, Emp_name varchar(25), Age int, Gender char(1), Doj date, Dep varchar(20), City varchar(15), Salary float);
describe employees;
insert into employees
values(101, 'Jimmy', 36, 'M', '2005-05-30', 'Sales', 'Chicago', 70000),
(102, 'Shane', 35, 'M', '1999-06-25', 'Marketing', 'Seattle', 55000),
(103, 'Marry', 28, 'F', '2012-07-14', 'Product', 'Boston', 62000),
(104, 'Dwayne', 32, 'M', '2017-12-17', 'Tech', 'Austin', 57000),
(105, 'Sana', 40, 'F', '2018-07-28', 'IT', 'New York', 72000),
(106, 'Amy', 31, 'F', '2008-02-10', 'Sales', 'Houston', 80000),
(107, 'Jack', 46, 'M', '2011-03-11', 'Finance', 'Houston', 100000),
(108, 'Angela', 29, 'F', '2013-01-25', 'HR', 'Miami', 75000),
(109, 'Marcus', 38, 'M', '2010-06-18', 'Sales', 'Boston', 92000),
(110, 'David', 24, 'M', '2009-07-09', 'Product', 'Miami', 75000),
(111, 'Rose', 25, 'F', '2011-03-25', 'Product', 'Chicago', 72000),
(112, 'Sophia', 26, 'F', '2018-05-15', 'Finance', 'Houston', 65000),
(113, 'Amelia', 33, 'F', '2013-12-08', 'IT', 'Austin', 58000),
(114, 'Will', 35, 'M', '2012-09-10', 'Tech', 'Detroit', 74000),
(115, 'William', 30, 'M', '2007-04-04', 'Marketing', 'Chicago', 67000),
(116, 'Alex', 32, 'M', '2009-03-23', 'IT', 'Miami', 76000),
(117, 'Maya', 41, 'F', '2011-08-12', 'IT', 'Houston', 70000),
(118, 'Riya', 36, 'F', '2010-05-03', 'HR', 'Seattle', 80000),
(119, 'Jacob', 37, 'M', '2014-09-15', 'Finance', 'Austin', 78000),
(120, 'Joseph', 45, 'M', '2016-11-23', 'Sales', 'Chicago', 115000);
select*from employees;
select distinct city from employees;
select distinct dep from employees;
select avg(age)as average_age from employees;

#avg age in each dep

select dep, round(avg(age),1)as dep_by_avg_age from employees group by dep;
select dep, sum(salary)as dep_wise_sum_of_salary from employees group by dep;
select count(Emp_Id),city from employees 
group by city 
order by count(Emp_Id);

select year(Doj)as year, count(Emp_Id)as number_of_emp from employees group by year(Doj);

create table Sales(Product_id int, sell_price float, quantity int, state varchar(25));

insert into Sales values
(121, 320.0, 3, 'California'),
(121, 320.0, 6, 'Texas'),
(121, 320.0, 4, 'Alaska'),
(122, 290.0, 2, 'Texas'),
(123, 298.0, 7, 'California'),
(123, 298.0, 4, 'Washington'),
(123, 298.0, 5, 'Ohio'),
(123, 298.0, 3, 'Arizona'),
(123, 298.0, 8, 'Colorado');
show tables;
describe Sales;
select*from Sales;
select Product_id, sum(sell_price*quantity)as revnue from Sales group by Product_id;
create table c_product(Product_id int, cost_price float);
select*from c_product;
insert into c_product 
values(121,270.0),
(123,250.0);
select c.product_id,sum((s.sell_price-c.cost_price)*s.quantity)as profit 
from sales as s inner join c_product as c 
where s.product_id=c.product_id 
group by c.product_id;

select*from employees;
select dep, avg(salary)as average_sal 
from employees
group by dep
having avg(Salary)>70000;

select city, sum(salary)as total
from employees
group by city
having sum(salary)>200000;

select dep, count(*)as emp_count
from employees
group by dep
having count(*)>2;

select city, count(*)as emp_count
from employees
where city!="Houston"
group by city
having count(*)>2;

select dep, count(*)as emp_count
from employees
group by dep
having avg(salary)>70000;
