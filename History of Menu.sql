create database HistoricalMenu;
use HistoricalMenu;
create table dish(
id int not null primary key,
name varchar(100),
description text,
menus_appeared int,
times_appeared int,
first_appeared int,
last_appeared int,
lowest_price float,
highest_price float);

create table menu (
id int primary key,
name varchar(100),
sponsor varchar(100),
event varchar(100),
venue varchar(100),
place varchar(100),
physical_description varchar(100),
occasion varchar(100),
notes text,
call_number varchar(100),
keywords varchar(100),
language varchar(50),
date date,
location varchar(100),
location_type varchar(100),
currency varchar(20), currenct_symbol varchar(10),
status varchar(30), page_count int, dish_count int);

create table menu_item (
id int primary key,
menu_page_id int,
price float,
high_price float,
dish_id int,
created_at datetime,
updated_at datetime,
xpos float,
ypos float);

create table menu_page (
id int primary key,
menu_id int,
page_number int,
image_id int,
full_height int,
full_weight int,
uuid varchar(50));


load data local infile  '/Users/yezhuang/Desktop/Dish.txt' into table dish; 
load data local infile  '/Users/yezhuang/Desktop/Menu.txt' into table menu;
load data local infile  '/Users/yezhuang/Desktop/MenuItem.txt' into table menu_item;
load data local infile  '/Users/yezhuang/Desktop/MenuPage.txt' into table menu_page;


select * from dish limit 100 ;
select * from menu limit 100;
select * from menu_item limit 100;
select * from menu_page limit 100;



update dish 
set first_appeared = null
where first_appeared in (0,1,2928);

update dish 
set last_appeared = null
where last_appeared in (0,1,2928);

select * from dish
where first_appeared is not null 
order by first_appeared
limit 10;

select * from  dish
order by times_appeared desc
limit 10;

/*most popular food top 10*/
select name ,menus_appeared, times_appeared from dish
order by menus_appeared desc, times_appeared desc
limit 10;


/* Most longivety food*/
select name, first_appeared, last_appeared, last_appeared-first_appeared as longtitude from dish
order by longtitude desc
limit 10;

/*Most expensivefood. Can you believe it?!!! */
select * from dish
where highest_price = (select max(highest_price) from dish);

/*Which restraunt has most menus*/
select sponsor as restraunt, count(sponsor) as num_of_menus from menu
group by restraunt
order by num_of_menus desc;





















