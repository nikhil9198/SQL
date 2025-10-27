create database sql_joins;
show databases;
use sql_joins;

create table cricket(cricket_id int auto_increment,name varchar(30),primary key(cricket_id));

create table football(football_id int auto_increment,name varchar(30),primary key(football_id));

insert into cricket(name)
values ('Stuart'), ('Micheal'), ('Johnson'), ('Heyden'), ('Fleming');
select*from cricket;

insert into football(name)
values ('Stuart'), ('Johnson'), ('Heyden'), ('Lenger'),('Astle');
select*from football;

select*from cricket as c inner join
football as f on c.name=f.name;

#another way to find out the same name of two table

select c.cricket_id, c.name, f.football_id,f.name from cricket as c inner join football as f on c.name=f.name;

use classicmodel;