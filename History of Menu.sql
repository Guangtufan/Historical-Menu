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

/*Restraunts have most menus*/
select sponsor as restraunt, count(sponsor) as num_of_menus from menu
group by restraunt
order by num_of_menus desc;

select distinct substring_index(physical_description, ';',1) as type, count(*) as amount from menu
group by type
order by amount desc;

alter table menu add physical varchar(20) after physical_description;

/*Tidy data of physical type*/
update menu 
set physical = 'card'
where physical_description regexp 'card' or physical_description like '%ca%';

update menu 
set physical = 'folder'
where physical_description regexp 'folder' or physical_description like '%fo%' or physical_description like '%der%';


update menu 
set physical = 'broadside'
where physical_description like 'BROADSIDE' or physical_description like '%ide%';

update menu 
set physical = 'booklet'
where physical_description like '%booklet%' or physical_description like '%boo%' or physical_description like '%bok%';

update menu 
set physical = 'broadsheet'
where physical_description like '%broadsheet%' and physical_description like 'roadsheet';

update menu 
set physical = 'folded'
where physical_description regexp 'folded' or physical_description regexp 'fold$';

update menu 
set physical = 'paper'
where physical_description regexp 'paper';



update menu 
set physical = 'others'
where physical is null and physical_description <> '';

/*count of each physical type*/
select physical, count(physical) as amount from menu
group by physical
order by amount desc;

/*Menu with most pages*/
select *from menu order by page_count desc limit 1;
/*menu containing most dishes*/
select *from menu order by dish_count desc limit 1;

select distinct place from menu
where place regexp 'china$';

select distinct place from menu
where place like '%shanghai%';


select * from menu where event like '%christmas%';
select * from dish limit 50;

/*How many times a dish appeared in christmas menu*/
select d.name, count(d.name) as appeared_times from menu m
left join menu_page on m.id = menu_page.menu_id
left join menu_item on menu_page.id = menu_item.menu_page_id
left join dish d on d.id = menu_item.dish_id
where m.event like '%christmas%'
group by d.name
order by appeared_times desc;

/*21590 dishes are made with potato*/
select count(*) from dish where name like '%potato%';

select * from menu where place like '%empress of china%';

/*1471 menus collected from restraunts in NY state*/
select count(place) as Count from menu
where (place regexp 'NY' and place not regexp '[:alpha:]ny') or place like 'new york';


/*About Tiramisu*/
select * from dish where name like '%tiramisu%';

select sum(menus_appeared) as menus_appeared, 
	   sum(times_appeared) as times_appeared, 
	   min(first_appeared) as first_appeared, 
	   max(last_appeared) as last_appeared
from dish where name like '%tiramisu%';

select d.name, m1.price, m1.high_price, m2.page_number, m.event from dish d
left join menu_item m1 on d.id = m1.dish_id
left join menu_page m2 on m1.menu_page_id = m2.id
left join menu m       on m.id = m2.menu_id  
where d.name like '%tiramisu%';




