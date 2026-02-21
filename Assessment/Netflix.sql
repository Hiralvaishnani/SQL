

-- ---------------------------------------ASSESSMENT --------------------------------------------

select*from review;create database netflix;

use netflix;
create table Users(
user_id int primary key auto_increment,
user_name varchar(100),
email varchar(100),
Gender varchar(100),
Age int,
Country varchar(100),
Subscription_plan varchar(100),
Signup_date date,
device_type varchar(100),
Active_user boolean  default True);

insert into Users(user_name,email,Gender,Age,Country,Subscription_plan,Signup_date,device_type,Active_user)values
("Rahul Patel","rahul.patel@gmail.com","Male","30","India","1 year","2025-05-12","Tv","1"),
("Hetvi Shah","s.hetvi@gmail.com","Female","25","Canada","3 Months","2026-02-09","Laptop","0"),
("Raj Roy","roy.raj@gmail.com","Male","19","USA","6 Months","2026-01-15","Mobile","0"),
("Shakshi Maru","shakshi.maru@gmail.com","Female","75","UK","1 Year","2025-01-12","Mobile","0");
 
use netflix;
insert into Users(user_name,email,Gender,Age,Country,Subscription_plan,Signup_date,device_type,Active_user)values
 ("Kiran joshi","kiranj@gmail.com","Male","20","Japan","1 Years","2025-09-12","Laptop","1"),
 ("Rohit verma","rverma@gmail.com","Male","30","Germany","6 Months","2026-02-12","Mobile","0"),
 ("Priya nair","nair.priya@gmail.com","Female","34","France","3 Months","2026-01-23","Tv","0"),
 ("Vikas singh","vikas.s@gmail.com","Male","55","Brazil","1 Year","2026-03-12","Tv","1"),
 ("Amit patel","pamit@gmail.com","Male","25","India","3 Months","2025-01-30","Laptop","1"),
 ("Pooja desai","poojadesai2gmail.com","Female","36","India","1 Years","2025-09-12","Laptop","0");
Select * from Users;

use netflix;
create table Movies(
Movies_id int primary key auto_increment,
Title varchar(100),
Relese_Year int,
Duration_minutes int,
Languge varchar(50),
Country varchar(50),
Rating int,
Release_date Date);
 
 insert into Movies(Title,Relese_year,Duration_minutes,Languge,Country,Rating,Release_date)values
 ("RRR",2015,140,"Telugu","India",5,"2015-05-12"),
 ("3idiots",2010,120,"Hindi","India",5,"2010-02-12"),
 ("Dangle",2008,180,"Hindi","India",4,"2003-09-17"),
 ("Pathan",2018,180,"Hindi","India",3,"2020-10-19"),
 ("Jawan",2015,120,"Hindi","India",2,"2012-05-14"),
 ("inception",2008,220,"English","USA",5,"2022-08-22"),
 ("Interstellar",2010,180,"English","USA",5,"2024-06-30"),
 ("Avengers:Endgame",2014,140,"English","USA",3,"2012-08-21"),
 ("Parasite",2025,140,"English","India",5,"2018-03-31"),
 ("Squid Game",2025,140,"English","India",5,"2025-02-28");
 
 select*from Movies;
 
 use netflix;
 create table Watch(
 watch_id int primary key auto_increment, 
 movies_id int,
 watch_time time,
 watch_date date,
 foreign key (movies_id) references Movies(Movies_id));
 
 use netflix;
  insert into Watch(movies_id,watch_time,watch_date)values
  (1,"09:12:00","2024-01-01"),
  (2,"02:12:10","2024-03-31"),
  (3,"01:10:00","2012-08-12"),
  (4,"01:08:00","2024-02-21"),
  (5,"00:45:23","2024-12-31"),
  (6,"01:00:00","2022-01-25"),
  (7,"00:45:00","2025-04-21"),
  (8,"02:00:02","2025-02-15"),
  (9,"01:00:00","2025-06-12"),
  (10,"01:02:12","2021-09-16");
  
select*from Watch;


alter table  watch
add user_id int;
update watch set user_id= 1 where watch_id= 51;
update watch set user_id= 2 where watch_id= 52;
update watch set user_id= 3 where watch_id= 53;
update watch set user_id= 4 where watch_id= 54;
update watch set user_id= 5 where watch_id= 55;
update watch set user_id= 6 where watch_id= 56;
update watch set user_id= 7 where watch_id= 57;
update watch set user_id= 8 where watch_id= 58;
update watch set user_id= 9 where watch_id= 59;
update watch set user_id= 10 where watch_id= 60;



USE netflix;

create table Review(
review_id int primary key auto_increment,
user_id int,
movie_id int,
rating int,
review_text varchar(200),
review_datetime  datetime default current_timestamp);
 insert into Review(user_id,movie_id,rating,review_text)values
 (1,1,5,"Amazing movie"),
 (2,2,4,"Good movie"),
 (3,3,2,"Average movie"),
 (4,4,5,"Superb performance"),
 (5,5,4,"Family movie"),
 (6,6,3,"Story predictable"),
 (7,7,1,"Not impressive"),
 (8,8,2,"Avarage movie"),
 (9,9,5,"Superb movie"),
 (10,10,3,"Not impressive");
 
select*from Review;

use netflix;
create table Geners(
geners_id int primary key auto_increment,
geners_name varchar(100));

insert into Geners(geners_name)values
("Action"),
("Comedy"),
("Drama"),
("Romance"),
("Thriller"),
("Horror"),
("Sci-fi"),
("Fantacy"),
("Documentry"),
("Animation");
select*from Geners;

alter table  Geners
add user_id int; 
update geners set user_id = 1 where geners_id=1;
update geners set user_id = 2 where geners_id=2;
update geners set user_id = 3 where geners_id=3;
update geners set user_id = 4 where geners_id=4;
update geners set user_id = 5 where geners_id=5;
update geners set user_id = 6 where geners_id=6;
update geners set user_id = 7 where geners_id=7;
update geners set user_id = 8 where geners_id=8;
update geners set user_id = 9 where geners_id=9;
update geners set user_id = 10 where geners_id=10;
 

-- -------------------------------------Assessment Tasks--------------------------------------
--  1 Top 3 most-watched genres per country. 

select*from geners;
select*from users;
 
with most_watched as(select u.country,g.geners_name, count(*) as watch_count
from users u
join geners g 
on u.user_id = g.user_id
group by u.country,g.geners_name
order by country,watch_count desc)
select*from most_watched;


-- 2 Identify users who rated more than 20 movies. 

select*from review;
select u.user_id, u.user_name,count(r.review_id) as total_rating
from users u 
join review r 
on u.user_id = r.user_id 
group by u.user_id,u.user_name
having count(r.review_id)>20;


-- 3 Find movies released after 2020 that have never been watched.
select*from watch;

select m.movies_id,m.title,m.relese_year,w.movies_id
from movies m
left join watch w 
on m.movies_id = w.movies_id
where m.relese_year > 2020
and w.movies_id is null
limit 3;

 -- 4 Compute the average rating per genre. 
 
 select*from geners;
 select*from review;
with average_rating as (select g.user_id, g.geners_name,avg(r.rating) as avg_rating
                        from geners g 
                        left join review r 
					    on g.user_id = r.user_id
						group by g.geners_name,g.user_id)
select*from average_rating;

-- 5 List users who gave 5-star ratings to all movies in a genre. 

select*from users;
select*from review;

select u.user_id,u.user_name
from users u 
join review r 
on u.user_id = r.user_id 
group by u.user_name,u.user_id
having min(r.rating) = 5;


-- 6 Identify movies watched by users from at least 5 different countries. 

select*from users;
select m.movies_id, m.Title, count(distinct u.country) as country_count
from watch w 
join users u  on w.user_id = w. user_id
join movies m  on w.movies_id = m.movies_id
group by m.movies_id, m.Title
having count(distinct u.country) >= 5;

select*from movies;
select*from users;

-- 7  Find the average number of movies watched per user per month.

select distinct u.user_id,date_format(w.watch_date," %Y-%M") as month,
       count(w.movies_id) over(partition by u.user_id, date_formate(w.watch_date," %Y-%M")) as movies_per_month,
  avg(count(w.movies_id)) over() as avg_movies_per_user_per_month     
  from users u 
  join watch w 
  on  u.user_id = w.user_id
  
-- 8 List users who watched the same movie more than once.

select user_id, movies_id,count(*) as watch_count
from watch 
group by user_id, movies_id
having count(*)>1;

-- 9 Count how many movies have ratings but were never watched.

select count(r.movie_id) as movies_not_watched
from review r
left join watch w 
on r.movie_id = w.movies_id
where w.movies_id is null;

-- 10 Identify the genre with the highest average 5-star rating count.------ 

select*from geners;
select*from review;

select g.geners_name,count(r.rating) as five_star_rating
from geners g 
join review r 
on g.user_id = r.user_id
where r.rating = 5 
group by g.geners_name
order by  five_star_rating desc;





