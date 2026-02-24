 create database flipcart;
 
 use flipcart;
 create table customers(
	customers_id int primary key auto_increment,name varchar(100) not null,
    mobile_no varchar (15) not null unique,
    email varchar(100) not null unique,
    address varchar (200) not null,
    signup_date datetime default current_timestamp);
    
    insert into customers (name, mobile_no, email, address) values
    ("hiral patel",7878989898,"hiralp@gmail.com","bopal");
    use flipcart;
	insert into customers (name, mobile_no, email, address) values
    ("Raj sharma",5676543379,"rams@gmail.com","Satellite"),
    ("Amit patel",2345676543, "pamit@gmail.com", "Vastrapur"),
    ("Kiran joshi",2334578765,"kiranj@gmail.com", "Naroda"),
    ("Rohit verma",9875435775,"rverma@gmail.com", "Vastral"),
    ("Ankita roy",7658987436,"roy.a@gmail.com", "Gota"),
    ("Neha patel",8768960545,"patelneha@gmail.com", "iscon"),
    ("Priya nair",8643298076,"nair.priya@gmail.com","Sarkhej"),
    ("Vikas singh",9878065478,"vikas.s@gmail.com","narol"),
    ("Pooja desai",7864321670,"poojadesai2gmail.com","Ghuma");
    
select * from customers; 



 use flipcart;
create table products(
product_id int primary key auto_increment,
product_name varchar(100),
price decimal(10,2),
categories varchar(100),
stock int);
insert into products( product_name, price,categories,stock) values
 ("nike shoes",8000.00,"Footwear",12),
 ("Samsung s25",70000.00,"Mobile",24),
 ("Dell laptop",45000.00,"Laptop",5),
 ("Boat headphones",1500.00,"Accessories",30),
 ("Boat airbuds", 1000.00,"Accesories",50),
 ("Spyker jeans",1800.00,"Clothing",20),
 ("nike tshirt",2000.00,"Clothing",20),
 ("Lenevo tablet",50000.00,"Laptop",12);
 
  use flipcart;
  insert into products( product_name, price,categories,stock) values
 ("iphone 17",830000.00,"Mobile",10),
 ("Mattresss",15000.00,"Furniture",15);

select * from products; 

 use flipcart;
 create table Payments(
 Payment_id int primary key auto_increment,
 payment_methode varchar(100),
 payment_status varchar(50),
 payment_date datetime default current_timestamp);
 
 insert into payments(Payment_id,payment_methode,payment_status) values
 (1,"Cod","Pendind"),
 (2,"UPI","Success"),
 
  use flipcart;
 insert into payments(Payment_id,payment_methode,payment_status) values
 (3,"Gift card","Success"),
 (4,"credit card","Success"),
 (5,"EMI","Pending"),
 (6,"Cod","Pending"),
 (7,"UPI","Success"),
 (8,"Debit card", "Success"),
 (9,"EMI","Success"),
 (10,"UPI","Success");
 
 select * from  Payments;
 
 use flipcart;
 create table Reviews(
 Review_id int auto_increment primary key,
 product_id int,
 Rating int,
 Reviews varchar(200),
 Foreign key (product_id) References products(product_id));
 
use flipcart;
insert into Reviews(product_id,Rating,Reviews) values
(1,3,"Execellent quality!"),
(2,2,"Nice oroducts"),
(3,5,"Very Good Products"),
(4,2,"Nice"),
(5,1,"Easy to use"),
(6,4,"Nice Products"),
(7,2,"Super"),
(8,1,"Good"),
(9,5,"Nice Products"),
(10,2,"Good");

select * from Reviews;


 use flicart;
 create table Orders(
 order_id int primary key auto_increment ,
 payment_id int,
 order_item varchar(200),
 Delivery_date Date,
 Deliver_time Time,
 Foreign key (payment_id) References payments(Payment_id));
 
 insert into Orders(payment_id,order_item,Delivery_date,Deliver_time)values
 (1,"Shoes","2025-01-21","07:00:00"),
 (2,"Watch","2025-01-10","12:00:12"),
 (3,"Tshirt","2025-01-03","03:12:09"),
 (4,"laptop","2025-01-10","02:23:12"),
 (5,"airpods","2025-01-08","02:12:12"),
 (6,"Tshirt","2025-01-03","03:12:09"),
 (7,"Watch", "2025-01-15","12:23:45"),
 (8,"Smart watch","2025-01-20","12:34:23"),
 (9,"Bag","2025-01-12","03:03:12"),
 (10,"Samsung phone","2025-01-10","10:02:45");


select * from Orders;

create table  seller(
seller_id int primary key auto_increment,
seller_name varchar(100),
seller_rating int);
insert into seller(seller_name,seller_rating)values
("shree fashion",4),
("ravi electronics",5),
("shree fashion",4),
("shree fashion",5),
("ravi electronics",2),
("shree fashion",5),
("ravi electronics",4),
("ravi electronics",3),
("shree fashion",3),
("ravi electronics",2);
select*from seller;


CREATE TABLE deliveries
    (delivery_id INT PRIMARY KEY auto_increment,
    order_id INT,
    delivery_partner VARCHAR(50),
    shipment_mode VARCHAR(50),
    delivery_days INT,
    delivery_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id));
    insert into deliveries(order_id,delivery_partner,shipment_mode,delivery_days,delivery_status )values
(1,"delivery","road",2,"delivered"),
(2,"blue dart","air",7,"pending"),
(3,"ecom","road",6,"pending"),
(4,"dtdc","road",3,"delivered"),
(5,"shadowfax","bike",2,"intransit"),
(6,"blue dart","road",4,"delayed"),
(7,"ecom express","air",2,"delivered"),
(8,"india post","road",3,"pending"),
(9,"ecom","road",6,"pending"),
(10,"dtdc","road",3,"delivered");
select*from deliveries;

-- ---------------------------------------group by ------------------------------------------

-- Count products per category
select categories ,count(*)
from products
group by categories;

-- Avg price per category
select categories, avg (price) as avg_price
from products
group by categories; 

-- Orders per payment method
select payment_methode, count(*)
from payments
group by payment_methode;

-- Categories with more than 1 product
select categories, count(*)
from products
group by categories;

-- Payment methods with more than 2 orders
select payment_methode,count(*)
from payments
group by payment_methode
having count(*)>2;

-- Product distribution by category
select categories, count(*)
from products
group by categories;

-- Avg price per category
select categories, avg(price) as avg_price
from products
group by categories;

-- Most used payment method
select payment_methode ,count(*)
from payments
group by payment_methode
order by count(*) desc;


-- Categories with high average price
 select categories, avg(price) as avg_price
from products
group by categories
order by avg_price desc;
 
 
-- Order distribution analysis
alter table orders
add order_status varchar(50);
 
 update orders
 set order_status="delivered"
 where order_id=1;
 update orders
 set order_status="delivered"
 where order_id=2;
update orders
 set order_status="pending"
 where order_id=3;
 update orders
 set order_status="delivered"
 where order_id=4;
 update orders
 set order_status="pending"
 where order_id=5;
 update orders
 set order_status="delivered"
 where order_id=6;
 update orders
 set order_status="transit"
 where order_id=7;
 update orders
 set order_status="delivered"
 where order_id=8;
 update orders
 set order_status="transit"
 where order_id=9;
 update orders
 set order_status="pending"
 where order_id=10;

select*from orders

-- Order distribution analysis

 select order_status, count(*) as delivered_order
 from orders
 group by order_status;
 
 
select * from deliveries;
select*from payments;
 
-- Delivered orders per payment method
select p.payment_methode,
count(o.order_id)as delivered_orders
from orders o
join payments p
on o.payment_id = p.payment_id
where o.order_status="delivered"
group by p.payment_methode;


-- List customers with their orders----------------

alter table orders
add customers_id int;
UPDATE orders SET customers_id = 1 WHERE order_id = 1;
UPDATE orders SET customers_id = 2 WHERE order_id = 2;
UPDATE orders SET customers_id = 3 WHERE order_id = 3;
UPDATE orders SET customers_id = 4 WHERE order_id = 4;
UPDATE orders SET customers_id = 5 WHERE order_id = 5;
UPDATE orders SET customers_id = 6 WHERE order_id = 6;
UPDATE orders SET customers_id = 7 WHERE order_id = 7;
UPDATE orders SET customers_id = 8 WHERE order_id = 8;
UPDATE orders SET customers_id = 9 WHERE order_id = 9;
UPDATE orders SET customers_id = 10 WHERE order_id = 10;


alter table orders
add orders_date date;
UPDATE orders SET orders_date ="2025-03-12" WHERE order_id = 1;
UPDATE orders SET orders_date ="2023-02-01" WHERE order_id = 2;
UPDATE orders SET orders_date ="2022-11-08" WHERE order_id = 3;
UPDATE orders SET orders_date ="2020-05-22" WHERE order_id = 4;
UPDATE orders SET orders_date ="2024-10-17" WHERE order_id = 5;
UPDATE orders SET orders_date ="2020-10-30" WHERE order_id = 6;
UPDATE orders SET orders_date ="2021-07-12" WHERE order_id = 7;
UPDATE orders SET orders_date ="2022-09-17" WHERE order_id = 8;
UPDATE orders SET orders_date ="2023-03-15" WHERE order_id = 9;
UPDATE orders SET orders_date ="2025-11-07" WHERE order_id = 10;


select*from customers;
select*from orders;

-- add product_id in orders
alter table orders
add product_id int;

update orders set product_id = 1 where order_id = 1;
update orders set product_id = 2 where order_id = 2;
update orders set product_id = 3 where order_id = 3;
update orders set product_id = 4 where order_id = 4;
update orders set product_id = 5 where order_id = 5;
update orders set product_id = 6 where order_id = 6;
update orders set product_id = 7 where order_id = 7;
update orders set product_id = 8 where order_id = 8;
update orders set product_id = 9 where order_id = 9;
update orders set product_id = 10 where order_id =10;

-- --------------------------------------------join-------------------------------------------
 
-- List customers with their orders
 select c.customers_id,c.name, o.order_id
  from customers c
  left join orders o
  on c.customers_id = o.customers_id;
  
  
  
-- Find customers with no orders
 select c.customers_id,o.order_id, c.name, o.order_id
  from customers c
  left join orders o
  on c.customers_id = o.customers_id
  where o.order_id is null;
  
-- Show order delivery details
select o.order_id, d.delivery_id,d.order_id, d.delivery_status
from orders o
left join deliveries d 
on o.order_id=d.order_id;


-- Find products without reviews

select*from reviews;
select*from products;

select p.product_id,r.product_id,p.product_name ,r.Reviews
from products p 
left join reviews r 
on p.product_id=r.product_id;
where r.product_id is null;


-- Customer order report

select *from customers;
select*from orders;
select c.customers_id,c.name,o.customers_id,o.order_id,order_item
from customers c 
right join   orders o 
on  c.customers_id=o.customers_id;


-- Product-seller mapping
select*from products;
select*from seller;

 alter table products
add seller_id int;
UPDATE products SET seller_id = 1 WHERE product_id = 1;
UPDATE products SET seller_id = 2 WHERE product_id = 2;
UPDATE products SET seller_id = 3 WHERE product_id = 3;
UPDATE products SET seller_id = 4 WHERE product_id = 4;
UPDATE products SET seller_id = 5 WHERE product_id = 5;
UPDATE products SET seller_id = 6 WHERE product_id = 6;
UPDATE products SET seller_id = 7 WHERE product_id = 7;
UPDATE products SET seller_id = 8 WHERE product_id = 8;
UPDATE products SET seller_id = 9 WHERE product_id = 9;
UPDATE products SET seller_id = 10 WHERE product_id = 10;

-- Product-seller mapping
select p.product_id,p.product_name,p.seller_id,s.seller_id,s.seller_name
from products p 
left join seller s 
on p.seller_id = s. seller_id;


-- Delivery performance report

select *from orders;
select*from deliveries;


select delivery_status,count(*) as total_deliveries
from deliveries
where delivery_status = "delivered"
group by delivery_status;

select d.delivery_id,d.order_id,d.delivery_partner,d.delivery_status,o.order_id,o.order_status,o.delivery_date
from deliveries d 
left join orders o 
on d.delivery_id = o.order_id;


-- Customers with no orders
select*from customers;
select*from orders;

select c.customers_id, c.name, o.order_id,o.customers_id,o.order_status
from customers c 
right join orders o 
on c.customers_id= o.customers_id
where o.order_id is null;

-- Order count per customer
select*from customers;
select*from orders;

select c.customers_id,c. name,
count(o.order_id)as order_count
from customers c
left join orders o 
on c.customers_id = o. customers_id
group by c.customers_id,c.name;


-- Show all customers & orders (FULL JOIN logic)

select c.customers_id,c.name,o.order_id,o.order_item
from customers c 
left join orders o 
on c.customers_id=o.customers_id

union

select c.customers_id,c.name,o.order_id,o.order_item
from customers c 
right join orders o 
on c.customers_id=o.customers_id;

-- Find customers without orders
select c.customers_id,c.name
from customers c 
left join orders o 
on c.customers_id=o.customers_id
where order_id 

-- Find orders without delivery
select*from deliveries;
select o.order_id,o.order_item,o.order_status,d.order_id,d.delivery_status
from orders o
left join deliveries d
on o.order_id=d.order_id
where d.delivery_status is null;


-- Find products without reviews
select*from products;
select *from reviews;

select p.product_id,p.product_name,r.product_id,r.reviews
from products p 
left join reviews r 
on p.product_id = r.product_id
where p. product_id is null;

-- Compare products in same category----------------




-- Create customer city comparison------------------







-- Create product × seller combinations

select p.product_id,p.product_name,s.seller_id,s.seller_name
from products p 
left join seller s 
on  p.product_id = s.seller_id;

-- Count unmatched rows in JOIN
select *from customers;
select*from  orders;
select count(*) as unmatched_customers
from customers c 
left join orders o 
on c.customers_id= o.customers_id
where o.customers_id is null;


-- Find delivery records without orders
select*from deliveries;
select d.delivery_id,d.delivery_status
from deliveries d 
left join orders o 
on  d.delivery_id = o.order_id
where o.order_id is null;


-- Show cross join output count

select count(*) as output_count
from customers
Cross join products;


-- Replace RIGHT JOIN with LEFT JOIN

select c.customers_id,c.name,o.order_id,o.order_item
from customers c 
left join orders o 
on c.customers_id=o.customers_id;

select c.customers_id,c.name,o.order_id,o.order_item
from customers c 
right join orders o 
on c.customers_id=o.customers_id;

-- Identify orphan records-------------------


-- Mini Project 1: Data Quality Audit

-- 1 Find missing orders

select c.customers_id,c.name
from customers c 
left join orders o 
on c.customers_id= o.customers_id
where o.customers_id is null;


-- 2 Missing deliveries

 select o.order_id,o.order_status,d.delivery_id,d.order_id
 from orders o 
 left join deliveries d 
 on o.order_id = d.order_id
 where o.order_id is null;


-- 3 Missing reviews
select p.product_id,p.product_name,r.product_id,r.Review_id,r.reviews
from products p 
left join reviews r 
on  p.product_id = r.product_id
where r.Review_id  is null;



-- Mini Project 2: Customer Coverage Report

-- 1 customers with orders

select c.customers_id,c.name 
from customers c 
left join orders o 
on c.customers_id = o.customers_id;

-- 2 Customers without orders

select c.customers_id,c.name 
from customers c 
left join orders o 
on c.customers_id = o.customers_id
where order_id is null;


-- 3 % conversion


-- ---------------------------------unon & union all--------------------------------------------

-- Combine customer & seller names
select name as name
from customers
union
select seller_name as name
from seller;

select*from seller;


-- Combine delivered & cancelled orders
select*from orders;
select order_id, customers_id,order_status
from orders
where order_status = "delivered"
union
select order_id,customers_id,order_status
from orders
where order_status ="transit";


-- Create activity log using orders + deliveries
select*from orders;
select*from deliveries;

select  order_id,order_status as activity_type 
from orders
union all 
select order_id,delivery_status as activity_type
from deliveries;

-- Combine multiple order statuses

select  order_id,customers_id, order_status as activity_type ,delivery_date as activity_date
from orders
where order_status in ("delivered","pendind","transit");


-- Show customer count & order count in one result
select (select count(*) from customers) as total_customers,
       (select count(*) from orders) as total_orders;


-- Use UNION ALL for faster report

select order_id,order_status
from orders
where order_status = "delivered"
union all
select order_id,order_status
from orders
where order_status ="transit";


-- Sort UNION result alphabetically


select order_id,order_status as activity_type
from orders
where order_status = "delivered"
union all
select order_id,order_status as activity_type
from orders
where order_status ="transit"
order by activity_type desc;


-- Combine products & sellers names

select product_id,product_name 
from products
union
select seller_id, seller_name
from seller;


-- Create combined city list (customers + sellers)

select customers_id,address
from customers
union 
select seller_id,seller_name
from seller;


-- Find duplicate rows using UNION vs UNION ALL----------------
select*from products;
select*from seller;

select product_name,seller_id count(*) as duplicate_count
from (select  product_name,seller_name from products
      union all
       select seller_name,seller_id from seller)

group by product_name,seller_id 
having count(*)>2;


-- Mini Project 1: Flipkart User Directory
-- Goal:
-- Create a combined list of:
-- Customers
-- Sellers
-- Include role column (Customer / Seller)

select name as name
from customers
union
select seller_name as name
from seller;

-- --------------------------- 88888888888888---------------------------------------

-- Products above average price
select*from products;

SELECT product_id, product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);


-- Latest order details---------------------
select order_id,order_item,deliver_time,delivery_date
from orders
order by deliver_time desc,delivery_date desc;


-- Customers with orders
SELECT c.customers_id, c.name, c.email ,o.order_id
FROM customers c
INNER JOIN orders o
ON c.customers_id = o.customers_id;


-- Products with reviews

SELECT  p.product_id, p.product_name,r.Reviews
FROM products p
INNER JOIN reviews r
ON p.product_id = r.product_id;

-- ---------------------------------------subquery------------------------------------------

-- Products priced above category average------------3

select*from products;
select*FROM products P
where price > ( select avg(price) from products
                 where categories = P. categories) ;


-- Orders after average order date

select*from orders
where Delivery_date > ( select avg (Delivery_date) from orders);

-- Customers without orders

select*from orders;
SELECT c.customers_id, c.name, c.email
FROM customers c
LEFT JOIN orders o
ON c.customers_id = o.customers_id
WHERE o.order_id IS NULL;


-- Products with max price per category

SELECT p.product_id, p.product_name, p.categories, p.price
FROM products p
WHERE p.price = (SELECT MAX(p2.price)FROM products p2 WHERE p2.categories = p.categories);

-- Count orders using subquery

select count(*) as total_orders
from(select order_id from orders)
as order_count;

-- count order per customers--------------------------------

select customers_id
from (select customers_id, count(order_id) as total_count from orders
      group by customers_id);


-- Mini Project 1: Premium Product Identification

-- Find products priced above category average

SELECT p.product_id, p.product_name, p.categories, p.price
FROM products p
WHERE p.price = (SELECT MAX(p2.price)FROM products p2 WHERE p2.categories = p.categories);


-- Segment premium vs normal products--------------------------

select*from products;

select product_id,product_name,price,
case when price >(select avg(price) from products 
where avg_price > 50000 then "premium"
else "normal"
end as categories
from products;


-- Mini Project 2: Active Customer Analysis

-- Identify customers with orders

select customers_id ,name 
from customers
where customers_id in (select customers_id from orders);


-- Customers without orders
-- Latest active customers

-- ----------------------------------CTE(commom table expression)-------------------------------------
-
-- Create CTE for delivered orders

with delivered_order as(
                select*from orders 
                where order_status = "delivered")
select*from delivered_order;



-- Count delivered orders using CTE
 
with delivered_order as(
                select*from orders 
                where order_status = "delivered")
 select count(*) as total_order
 from delivered_order;
 select*from delivered_order;
 
-- Orders per payment method using CTE
select*from payments;

with payment_summery as( select payment_methode,count(*) from payments
                         group by payment_methode)
select*from  payment_summery;                        

-- Customer order count using CTE
select*from orders;
with customer_order as (select c.customers_id,c.name,count(o.order_id) as total_order
                        from customers c 
                        left join orders o
                        on c.customers_id = o.customers_id
                        group by c.customers_id)

select*from customer_order;


-- Products above average price using CTE
select*from products;


with avg_price  as (select avg(price) as total_price
                        from products)
select*from products
where price >(select total_price from avg_price);


-- Avg delivery days using CTE
select*from deliveries;
 with avg_days  as(select avg (delivery_days) as total_days
					from deliveries)
select*from avg_days;


-- Multiple CTEs in one query





-- Replace subquery using CTE
-- Products priced above category average

                 
with pprice as ( select categories, avg (price) as avg_price
from  products
group by categories)
select*from  pprice;
where avg_price > price;


-- Sort CTE result

with pprice as ( select categories, avg (price) as avg_price
from  products
group by categories)
select*from  pprice;
where avg_price > price
order by avg_price asc;
-- order by avg_price desc

-- Join inside CTE

select*from orders;
with customer_order as (select c.customers_id,c.name,count(o.order_id) as total_order
                        from customers c 
                        left join orders o
                        on c.customers_id = o.customers_id
                        group by c.customers_id)

select*from customer_order;

-- Create KPI report using CTE------------------

-- Recursive CTE to generate numbers-----------------


-- Mini Project 1: Flipkart KPI Layer
-- Goal: Use CTE to calculate:

-- Total customers
with total_customers as (select count(customers_id) as total
from customers)
select*from total_customers;

-- Total orders
with total_order as (select count(order_id) as total
from orders)
select*from total_order ;

-- Delivered orders
select*from orders;

with delivered_order as(
                select*from orders 
                where order_status = "delivered")
 select count(*) as total_order
 from delivered_order;
 select*from delivered_order;
 
 
-- Avg delivery days
select*from deliveries;
with avg_days as (select avg (delivery_days) as avg_d
from deliveries)
select*from avg_days;



-- Mini Project 2: Customer Activity Segmentation
-- Goal: Using CTE:

-- Customers with orders
select*from orders;

with c_order as (select c.customers_id,c.name, count(o.customers_id) as total_order
from customers c
left join orders o
on c.customers_id = o.customers_id
group by c.customers_id)
select*from c_order;


-- Customers without orders

with c_order as (select c.customers_id,c.name, count(o.customers_id) as total_order
from customers c
left join orders o
on c.customers_id = o.customers_id
where order_status is null
group by c.customers_id)
select*from c_order;


-- Order count per customer

with c_order as (select c.customers_id,c.name, count(o.customers_id) as total_order
from customers c
left join orders o
on c.customers_id = o.customers_id
group by c.customers_id)
select*from c_order;


-- Mini Project 3: Product Price Benchmark Goal:(using CTE instead of subquery)

-- Category avg price
select*from products;
with avg_price as (select categories, avg (price) as a_price
from products
group by categories)
select*from avg_price;

-- Products above benchmark-----------------


-- Mini Project 4: Delivery Performance Report Goal:

-- Delivered orders

with delivered_orders as (select count(order_status) as total_count
						from orders 
                         where order_status = "delivered" )
select*from delivered_orders;


-- Avg delivery days 

with avg_days as (select delivery_partner, avg (delivery_days) as avg_ddays
                  from deliveries
                  group by delivery_partner)
select*from avg_days;


-- Fast vs slow delivery classification

with avg_days as (select delivery_partner, round (avg (delivery_days),2) as avg_ddays
                  from deliveries
                  group by delivery_partner)
select*from avg_days
order by avg_ddays asc;
-- order by avg_ddays desc;



-- -------------------------------------window function-----------------------------------------------


-- Show avg product price with each product

select product_name ,price,round(avg(price) over(),2) as avg_price
from products;


-- Avg price per category using window function

select product_name,categories,price, avg(price) over(partition by categories)  as avg_price
from products;


-- Count products per category using window function

select product_name,categories,count(*) over (partition by categories) as products_category
from products;


-- Show total orders per customer (row-level)
 
 select  c.customers_id,c.name, count(o.order_id) 
		 over(partition by c.customers_id) as  order_customer
from customers c
left join orders o
on c.customers_id = o.customers_id;


-- Compare price vs category average

select product_name,categories,price,avg(price) over (partition by categories) as category_avg
from products;



-- Show avg delivery days per partner

select*from deliveries;
select delivery_id,delivery_partner, delivery_days,avg(delivery_days) over(partition by delivery_partner)
from deliveries; 

-- Show category stock value

select product_name,categories,price,stock,(price* stock) as stock_value, sum(price*stock) over (partition by categories)
from products;


-- Window function without PARTITION BY

select product_name,price,avg(price) over() as avg_price
from products;


-- Use window function with JOIN----------

select c.customers_id,c.name,count(o.order_id) as total_orders,
rank() over (order by count (o.order_id) desc) as customer_rank
from customers c 
left join orders o 
on c.customers_id = o.customers_id
group by c.customers_id,c.name;


-- Filter rows using window output----------------------------




-- Window function vs GROUP BY example

select customers_id,COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

SELECT order_id,customers_id,COUNT(order_id) OVER(PARTITION BY customers_id) AS total_orders
FROM orders;


-- Create inventory analytics query


SELECT product_id,product_name,categories,price,stock,

    -- Product stock value
    (price * stock) AS stock_value,

    -- Category total stock value
    SUM(price * stock) OVER(PARTITION BY categories) AS category_stock_value,

    -- Overall stock value
    SUM(price * stock) OVER() AS total_inventory_value,

    -- Category average stock
    AVG(stock) OVER(PARTITION BY categories) AS category_avg_stock,

    -- Stock rank inside category
    RANK() OVER(PARTITION BY categories ORDER BY stock DESC) AS stock_rank

   FROM products;


-- Mini Project 1: Product Price Intelligence

-- Show product price

select*from products;
       
-- Category average price

select product_id, product_name,categories,price,
       avg (price) over (partition by categories) as categories_avg_price
from products;

-- Difference from average

select product_name,categories,price,
       avg (price) over (partition by categories) as categories_avg_price,
       price - avg (price) over (partition by categories)as price_difference 
       from products;

-- Mini Project 2: Customer Order Strength

-- Order count per customer (row-level)

select ( o.order_id,c.customer_id, count(o.order_id) over (partition by o.customer_id) as total_orders
from orders o
left join customers c 
on o.customers_id = c.customers_id
group by c.name;
 

-- Identify repeat customers----------

select*from deliveries;

select delivery_partner,delivery_status,avg(delivery_days) over() as avg_days
from deliveries;
 
--  Rank products by price

select product_name,price,rank() over(order by price desc) as price_rank
from products;

-- Dense rank products by price

select product_name,price ,dense_rank() over(order by price desc) as price_dense
from products;

-- Assign row number to products

select*from products;
select product_name,price, categories, row_number() over (partition by categories) as row_num
from products;


-- Rank products per category

select product_name,price,categories, rank() over (order by price desc) as rnk
from products;

-- Top 3 products per category

select*from(select product_name,price,categories, rank() over ( partition by categories order by price desc) as rnk  
             from products)t
where rnk <=2;


-- Rank customers by order count-----------------------

select*from (
   select c.name , count(o.order_id) as total_orders,
   rank() over(order by count (o.order_id)desc) as customer_rank
   from customers c 
   left join orders o 
   on c.customers_id = o.customers_id
   group by c.name )t;


-- Rank deliveries by speed

select*from deliveries;

select delivery_partner, avg (delivery_days) over (partition by delivery_partner)as avg_days
from deliveries;

-- Ranking without PARTITION BY

select product_name,price, categories, row_number() over () as row_num
from products;


-- Ranking with JOIN







-- Compare RANK vs DENSE_RANK output

select product_name,price,rank() over (order by price desc) as price_rank
from products;

select product_name,price ,dense_rank() over (order by price desc) as price_rank
from products;


-- Create leaderboard query---------
 
 

 -- Mini Project 1: Category Leaderboard
 
 -- Top 3 expensive products per category
 
 select*from products;
select*from (select product_name, categories,price,dense_rank() over(partition by categories order by price desc) as rnk
              from products)t
where rnk<3 ; 
 
 
 -- Ranking logic

 select product_name,price,rank() over (order by price  desc) as price_rank 
 from products;
 
 select product_name,price,dense_rank() over (order by price desc) as pdense_rank
 from products;


-- Mini Project 2: Customer Power Users

-- Rank customers by number of orders--------

select*from ( select c.name,count (o.order_id) as total_orders,
              rank() over(order by count (o.order_id) desc) as customer_rank
 from customers c 
 left join orders o 
 on c.customers_id = o.customers_id
 group by c.name)t;


-- Identify top buyers

select*from (select c.customers_id, c.name, count(o.order_id) as total_orders,
             rank() over(order by(o.order_id) desc) as buyers_rank
             from customers c 
             left join orders o 
             on o.order_id = c. customers_id
             group by c.name);
			

-- Mini Project 3: Delivery Performance Ranking

-- Fastest delivery partners

select delivery_partner, avg (delivery_days) over (partition by delivery_partner)as avg_days
from deliveries;

-- Order-wise delivery ranking

select*from (
  select o.order_item, d.delivery_days,count(o.order_id)as total_orders,
          rank() over (partition by count (o.order_id) desc) as delivery_rank
   from orders o 
   left join deliveries d 
   on o.order_id = d.order_id
   group by order_item)t;
   
   SELECT*FROM ORDERS;
   
 
 -- ----------------------------------------date/time-------------------------------------------------
 select*from orders;
-- Extract year from orders

select  order_item, year(delivery_date) as year_order
from orders; 

-- Extract month from orders

select order_item, monthname(delivery_date) as month_order
from orders; 

-- Show today’s date
select now();

-- Add 10 days to order date
 
 select orders_date ,date_add(orders_date, interval 10 day) as 10days_orderdate
 from orders;
 
-- Find orders from last 15 days

select now() - interval 15 day as last15_days_date;

-- Calculate days since each order

select order_id,orders_date,datediff(curdate(),orders_date) as days_each_order
from orders;

-- Extract year from orders

select order_id, year(orders_date) as year_order
from orders;

-- Extract month from orders

select order_id, monthname(orders_date) as year_order
from orders;

-- Show today’s date

select now();

-- Add 10 days to order date

select order_id,orders_date , date_add(orders_date,interval 10 day) as expected_days
from orders;

-- Find orders from last 15 days

select  orders_date ,subdate(orders_date,interval 15 day) AS last_15days_orders
from orders;

select  orders_date ,subdate(curdate(),interval 15 day) AS last_15days_orders
from orders;

-- Calculate days since each order

select order_id,orders_date,datediff(curdate(),orders_date) as days_since_order
from orders;

-- Mini Project 1: Monthly Order Dashboard
select*from orders;

-- Orders per month-----------------------------------

 select  order_id , orders_date,month(orders_date) as month_orders,
        count (order_id) as total_orders
from orders
group by month(orders_date)
order by month_orders; 


-- Latest month sales---------------------------------------------

select *from orders;



-- Growth trend-----------------------------------------------------





-- Mini Project 2: Delivery SLA Report

-- Avg delivery days

 select avg(datediff(delivery_date,orders_date)) as avg_delivery_days
 from orders;


-- Fast vs slow deliveries-------------------

select


-- Delay classification------------------



-- Mini Project 3: Customer Recency Analysis
-- Days since last order

select *from orders;

-- select max(orders_date)
-- from orders;

select c.customers_id, c.name, datediff(curdate(),max(o.orders_date)) as days_last_order
from customers c 
left join orders o 
on c.customers_id = o.customers_id
group by c.customers_id,c.name;


-- Active vs inactive customers-------------------------------


-- Concatenate name & email

select concat (name,"-",email)as name_email
from customers;

-- Convert all product names to uppercase

select upper(product_name) as name_upper
from products;


-- ------------------------------------------------------------------------------------------------------
update products
set product_name = upper(product_name)
where product_id > 0;

select*from products;

start transaction;
update products
set categories = upper(categories)
where product_id >0 ;
commit;


update seller
set seller_name = (select seller_name,length(seller_name) as len_name)
where seller_is >0 ;
commit;

select*from seller;

-- --------------------------------------------------------------------------------------------------------------

-- Extract first 4 letters of product name

select product_name , substring(product_name,1,4)as nick_name
from products;  

-- Extract last 3 letters

select product_name, right(product_name,3) as nick_name
from products;

-- Replace COD with Cash

select*from payments;

select payment_methode, replace(payment_methode,"Cod","CASH") As update_payments
from payments;

-- Trim spaces from names

select trim(name)as clean_name
from customers;

-- Count length of seller names

select seller_name,length(seller_name) as len_name
from seller;

-- Extract email domain

select email,substring_index(email,"@",-1) as email_domain
from customers;

-- Create short product cod-----------------
select*from payments;
select*from products;


-- Combine category + price

select categories,price,concat(categories,"-",price)as category_price
from products;

-- Standardize payment method to lowercase

select payment_methode, lower(payment_methode) as standardize_payment
from payments;

-- Format name properly

select name,concat(upper(left(name,1)),lower (substring(name,2))) as formatted_name
from customers;


-- Mini Project 1: Customer Data Cleaning

-- Standardize names

-- Extract email domains

select email,substring_index(email,"@",-1) as email_domain
from customers;

-- Remove extra spaces

select trim(name) as clean_name
from customers;

-- Mini Project 2: Product Code Generator

-- Generate short code using first 3 letters + price

select product_name,price,concat(upper(left(product_name,3)),price) as product_code
from products;

-- Mini Project 3: Marketing Segmentation

-- Group customers by email domain

select*from customers;

select substring_index(email,"@",-1 )as email_domain,
count(*) as customers_count
from customers
group by email_domain;

-- Identify top domain users

select substring_index(email,"@",-1 )as email_domain,
count(*) as customers_count
from customers
group by email_domain
order by customers_count desc; 
    
    
    
-- ---------------------------------------case,nested,view,replace--------------------------------------    
    
-- Classify products by price

select*from products;
select product_name,price,
case when price >= 50000 then "expensive"
     when price between 10000 and 49999 then "modarate"
     else "affordable"
  end as classify_price
  from products;


-- Segment customers by order count

create view customer_order_count as select c.customers_id,c.name,count(o.order_id)
from customers c 
left join orders o 
on c.customers_id = o.customers_id
group by customers_id;

select*from customer_order_count; 


-- Identify fast/slow deliveries
 
 select*from deliveries;

select order_id, delivery_days,
case when delivery_days <= 3 then "fast"
     when delivery_days between 4 and 6 then "normal"
     else "slow"
end as  delivery_speed
from deliveries;  


-- Count delivered vs non-delivered orders

select 
     sum(case when delivery_status = "delivered" then 1 else 0 end ) as dilevered_orders,
     sum(case when delivery_status <> "delivered" then 1 else 0 end) as non_delivered_orders
from deliveries;
     
-- Categorize sellers by rating

select*from seller;

select seller_name,
case 
     when seller_rating >= 4 then "high rated"
     when seller_rating >= 2 then " average"
     else "low rated"
end as categories_seller
from seller;


-- Classify inventory status

select product_name,stock,
case 
     when stock = 0 then "out of stock"
     when stock between 1 and 10 then "low stock"
     else "in stock"
     end as inventory_status
  from products;   


-- Use CASE in ORDER BY

select*from products;

select product_name,categories,price,
      case 
          when categories = "ACCESORIES" then 1
          when categories = "CLOTHING" then 2
		  when categories = "LAPTOP" then 3
          when categories = "MOBILE" then 4
		  when categories ="FOOTWEAR" then 5
          else 6
          end as numbers
          from products
          order by numbers;

          
-- Use CASE with window function(--Avg price per category using window function)

select product_name,categories,price,  
round (avg(price) over(partition by categories) ,2) as avg_price,
case 
    WHEN AVG(price) OVER(PARTITION BY categories) < 15000 THEN 'Budget'
	WHEN AVG(price) OVER(PARTITION BY categories) BETWEEN 15000 AND 30000 THEN 'Mid Range'
	ELSE 'Premium'
end as price_category
from products;


-- Segment orders by payment type

select*from payments;


select Payment_id, payment_methode,
     case 
        when payment_methode in ("credit card","EMI","UPI","Debit card","EMI")
        Then "Digital payment"
        else "offline payment"
        end as payment_category
from payments;


-- Create revenue band categories
select*from products;

select categories, sum(price * stock) as total_revenue,
case when sum(price * stock) <= 100000 then "low"
     when  sum(price * stock) between 100001 and 200000 then "medium"
     when sum(price * stock) between 200001 and 500000 then "high"
     else "premium"
     end as revenue_category
     from products
    group by categories;
     
     
-- Nested CASE example
  
select*from customers ;

select 
	name, 
    case
		when name like "A%" then "starts with A"
        else 
			case
				when name like "R%" then "start with R"
                else "Other"
			end
		end as name_type
from customers;
    

-- Classify customers by email domain
 
 select  name,email,
 case 
      when email like "%@gmail.com" then "gmail_user"
      when email like "%@yahoo.com" then "yahoo_user"
      else "other_users"
end as email_domain
from customers;

-- Mini Project 1: Customer Segmentation Engine

-- Segment into Inactive / Occasional / Frequent----------------------------------

select*from orders;

select customers_id, order_item,count(order_id) as total_orders,
case 
  when count(order_id) >= 4 then "frequent"
  when count(order_id) between 1 and 3 then "occasional"
  else "inactive"
  end as segment_orders
  from orders
  group by customer_id,order_item;


-- Create summary report------------------------------

select segment,count(*)as total_customers
from ( select customer_id,
      case 
         when count(order_id) >= 4 then "frequent"
		when count(order_id) between 1 and 3 then "occasional"
        else "inactive"
        end as segment
        from orders
    group by customers_id) as segments   
    group by segment;
     

 -- Mini Project 2: Product Price Intelligence
 
-- Low / Medium / High

select*from products;

 select product_id,product_name,price, 
case when price >= 50000 then "High"
     when price between 10000 and 49999 then "Medium"
     else "Low"
     end as product_price_intelligence
     from products;
     
-- Compare  price vs price category average

   select product_id,product_name,categories,price,
       avg (price) over (partition by categories) as avg_categories,
     	case 
        when price > avg(price) over (partition by categories) then "above average"
        when price > avg(price) over (partition by categories) then "below average"
        else "average"
        end as compare
  from products;

-- Mini Project 3: Delivery Performance Scorecard

-- Classify partners

select*from  deliveries;

select delivery_id, delivery_partner,delivery_days,
case 
when delivery_days <= 2 then "fast"
when delivery_days between 3 and 5 then "normal" 
else "slow"
end as delivery_perfomance
from deliveries;


-- Rank by performance

select delivery_id, delivery_partner,delivery_days,

case 
when delivery_days <= 2 then "fast"
when delivery_days between 3 and 5 then "normal" 
else "slow"
end as delivery_perfomance,

rank() over (order by delivery_days) as delivery_rank 
from deliveries;


-- Mini Project 4: Inventory Risk Monitoring

-- Identify out-of-stock

select product_id, product_name, stock,
case 
     when stock = 0 then "out of stock"
     when stock between 1 and 5 then "low stock"
     else "available"
     end as stock_status
     
  from products;   
 
-- High-demand items

select order_item ,count(order_id) as total_orders,
     case
         when count(order_id) >= 5 then "high demand"
         when count(order_id) between 2 and 4 then "medium demand"
         else "low demand"
    end as demand_level
   from orders
   group by order_item; 
  

-- Create delivered orders view

select*from orders;
drop view delivered_orders_view;

create view delivered_orders_view as 
         select order_id,order_item,order_status,orders_date
         from orders
		where order_status = "delivered" ;

select*from delivered_orders_view;


-- Create product performance view

create view product_perfomance as 
 select p.product_id , p.product_name, count(o.order_id ) as total_sales
 from products p
 left join orders o 
 on p.product_id = o.product_id
 group by p.product_id,p.product_name;
 
 select*from product_perfomance;
 
 
-- Modify view using REPLACE

create or REPLACE view product_performance_view as
   select p.product_id,p.product_name,p.categories,p.price,p.stock,
   count(r.Review_id) as total_review
   from products p 
   left join reviews r
   on p.product_id = r.product_id
   group by p.product_id,p.product_name,p.price,p.categories,p.stock;
   
select*from  product_performance_view ;

-- Create view hiding sensitive columns

create view customer_public_view as 
select customers_id, name, address
from customers;

select*from customer_public_view ;

-- Use view in another query

select*from customers;

select name,address
from customer_public_view
where address = "Vastrapur";

-- Count records from view

select address,count(*) as total_customers
from customer_public_view
group by address;


-- Mini Project 1: Flipkart Reporting Layer ,Create views for:

-- Customer summary

select*from customers;

create view customers_orders_summery as 
               select c.customers_id, c.name ,count(o.order_id)
			from customers c 
            left join orders o 
            on c.customers_id = o.customers_id
            group by c.customers_id;
            
select*from customers_orders_summery;


-- Product performance
 
select*from products; 

create view product_perfomance as 
 select p.product_id , p.product_name, count(o.order_id ) as total_sales
 from products p
 left join orders o 
 on p.product_id = o.product_id
 group by p.product_id,p.product_name;
 
 select*from product_perfomance;
 
 
-- Delivery performance

drop view delivery_performance;

create view delivery_performance as 
  select  delivery_partner,
  count(delivery_id) as total_delivery,avg(delivery_days) as avg_days
  from deliveries
  group by delivery_partner;

select * from delivery_performance;

-- Mini Project 2: Executive Dashboard View Single view combining:

-- Orders, customers, delivery info

drop view executive_orders_dashboard ;

create view executive_orders_dashboard as 
             select o.order_id, o.orders_date, c.name , c.mobile_no, c.address,
                    o.order_item,o.order_status,  
                    d.delivery_partner,d.shipment_mode,d.delivery_days,d.delivery_status,d.delivery_id
        from orders o 
        left join customers c 
        on o.customers_id = c.customers_id
        left join deliveries d 
        on o.order_id = d.order_id;

select*from executive_orders_dashboard ;


-- Mini Project 3: Secure Public Data View

-- Create limited access view for reporting team.

create view public_orders_report as 
           select o.order_id,o.orders_date,
                 c.name  as customer_name,
                 c.address as city,
				 o.order_item, o.order_status,
                 d.delivery_status, d.delivery_days

FROM orders o
LEFT JOIN customers c
    ON o.customers_id = c.customers_id
LEFT JOIN deliveries d
    ON o.order_id = d.order_id;

select*from public_orders_report;


-- Mini Project 4: KPI View Layer-------------------------------------------
-- Create one view with:

-- Total orders, Delivered orders, Avg delivery days, Total customers
DESC ORDERS;
select*from orders;

create view KPI_View  as 
    select 
    count( o.order_id) as total_orders,
    count( case 
            when o.order_status = "delivered" then 1 
            end )as delivered_orders, 
              avg (case 
         when o.order_status = "delivered" then datediff(o.Delivery_date, o.orders_date)
         end ) as avg_delivery_days,
             count ( o.customers_id) as total_customers      
    from orders o;


-- -------------------------------------------------index------------------------------------


-- create index on order_date

create index idx_orders_date
on orders (orders_date);
show index from orders;

-- Create index on customer_id

create index idx_customer_id
on customers(customers_id);
show index from customers;

-- Create composite index

create index idx_orders_customer
on orders (orders_date, customers_id);
show index from orders;

-- Drop index 

Drop index idx_orders_customer
on orders ;


-- Use EXPLAIN on SELECT query

explain select*from orders
where customers_id = 5 ;
 show index  from orders;

-- Compare query before & after index

-- -----before
explain select*from orders
where customers_id = 5 
and orders_date>= "2024-10-17";

-- ----after
create index idx_ordes_customer
on orders(customers_id,orders_date);

show index from orders;

-- Optimize date filtering query

create index idx_orders_date
on orders (orders_date);
show index from orders;

-- Identify full table scan



-- Optimize JOIN query



explain
select o.orders_date,c.name
from orders o 
join customers c 
on o.customers_id = c.customers_id
where  o.orders_date>= "2020-05-22";

select*from orders;


-- Test ORDER BY performance
explain
select order_id, customers_id,orders_date
from orders
order by orders_date desc;

-- Show indexes of table
 show index from orders;


--  Remove unnecessary index

Drop index idx_orders_date
on orders ;


-- Mini Project 1: Query Performance Audit

-- Identify slow queries

select*from orders
where year(orders_date) = "2022";

-- Use EXPLAIN

explain select*from orders
where customers_id = "1";

-- Add indexes

create index idx_customers_id
on orders (customers_id); 

-- Compare performance

-- before

explain select* from orders 
where customers_id ="1";

-- after
-- Drop index idx_customer_id on orders ;

create index idx_customer_id
on orders(customers_id);

explain select* from orders 
where customers_id ="1";


-- Mini Project 2: JOIN Optimization

-- 	Optimize customer-order join

explain
select customer_id,c.name,o.order_id,o.order_date
from customers c 
join orders o 
on c.customers_id = o.customers_id;

-- Add index on foreign keys

create index idx_orders_customers_id
on orders(customers_id);


-- Mini Project 3: Date Filtering Optimization

-- Replace YEAR() filtering

select*from orders
where year (orders_date) = "2021";

-- Improve performance

-- Mini Project 4: Index Strategy Design
-- Design indexing plan for:

-- Orders table

CREATE INDEX idx_orders_customer
ON orders(customers_id);

-- Products table

CREATE INDEX idx_products_category
ON products(categories);
show index from products;

-- Deliveries table

CREATE INDEX idx_delivery_days
ON deliveries(delivery_days);
show index from deliveries;