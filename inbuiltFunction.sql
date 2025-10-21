show databases;
use sql_intro;
show tables;
show databases;
describe emp_detaile;
insert into emp_detaile
values("Jimmy", "35", "M", "2005-05-30", "Chicago", "70000"),
("Shane", "30", "M", "1999-06-25", "Seattle", "55000"),
("Marry", "28", "F", "2009-03-10", "Boston", "62000"),
("Dwayne", "37", "M", "2011-07-12", "Austin", "57000"),
("Sara", "32", "F", "2017-10-27", "New York", "72000"),
("Ammy", "35", "F", "2014-12-20", "Seattle", "80000");

SELECT*FROM emp_detaile;
select distinct city from emp_detaile;

select count(name) as count_name from emp_detaile;

select sum(salary) as sum_salary from emp_detaile;
select avg(salary) as avg_salary from emp_detaile;

select name, age, city from emp_detaile;
select*from emp_detaile where age>30;
select name, age, city, sex from emp_detaile where sex = 'F';
select*from emp_detaile where city in('Chicago','Seattle');
select*from emp_detaile where city ='Chicago' or city='Austin';
select*from emp_detaile where doj between '2000-01-01' and '2010-12-31';
select*from emp_detaile where age>30 and sex='M';
select sex, sum(salary) as total_salary from emp_detaile group by sex;
select *from emp_detaile order by salary desc;
select(20+20) as addition;
select(20-15) as subtraction;
select(20*20) as multiplication;
select(20%3) as Remender;
select(20/5) as Modulus;
select length('India')as total_length;
select repeat('N ',8) as N8;
select upper('India')as upper_case;
select lower('India')as Lower_case;

select curdate()as Todays_date;
select current_time() Now_time;
select current_timestamp()as Todays_time_date;
select day(curdate());
select now()as current_date_time;

#String Functions
select upper('india')as upper_case;
select lower('INDIA')as lower_case;
select lcase('INDIA')as lower_case;
SELECT UCASE('india') AS upper_case;

select character_length('India')as total_length;
select name, char_length(name) as total_length from emp_detaile;
select concat("india ", "is ", "in Asia")as merged;
select name, city, concat(city, " ", age)as city_age from emp_detaile;
select reverse('India')as reverse_ord;
select reverse(name)as reverse_ord from emp_detaile;

select replace("Mango is a vegitable", "vegitable","fruit")as replace_vtof;
select length("      India      ")as lengthI;
select length(ltrim("      India      "))as lengthI;
select length(Rtrim("     India               "))as lengthI;
select length(trim("     India               "))as lengthI;
select position("India" in "My country India is great")as name;
select ascii("A")as asci;
select ascii("w")as asci;
SELECT ASCII('0') AS asci;