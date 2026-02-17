
create database MarketCo; 

use MarketCo;

create table contact(
           contact_id int primary key auto_increment,
           company_id int ,
           first_name varchar (50),
           last_name varchar(50),
           street varchar(50),
           city varchar(50),
           state varchar(50),
           zip varchar(50),
           ismain boolean,
           email varchar(50),
           phone varchar(12));
           
insert into contact(company_id,first_name,last_name,street,city,state, zip, ismain,email,phone)values
(101,"meet","patel","m.g road","ahmedabad","gujarat","380001",true,"meetp@gmailcom",9897654656),
(102,"rahul","sharma","c.g.road","ahmedabad","gujarat","320004",false,"rahul@sharma@gmail.com",7874324598),
(103,"amit","verma","ring road","surat","gujarat","394101",false,"amit.verma@gmail.com",9898765412),
(104,"karan"," mehata","rajpath","ahmedabad","gujarat","320011",true,"karan.mehata@gmail.com",8989876709),
(105,"neha","joshi","marinr drive","mumbai","maharashtra","400002",true,"neha.joshi@gmail.com",9876362220),
(106,"sneha","reddy","banjara hill","hydrabad","telangana","230001",true,"snehar@gmail.com",9898687457),
(107,"pooja","kapoor","law garden","ahmedabad","gujarat","10009",true,"pooja.kaoor@gmail.com",9898768767),
(108,"rohit","yadav","gandhinagar","delhi","delhi","380098",true,"rohit.yadav@gmail.com",7865348990),
(109,"anjali","desai","alkapuri","vadodara","gujarat","120002",false,"anjali.desai@gmail.com",8787673421),
(110,"vikram","singh","setelite","ahmedabad","gujarat","120003",true,"vikramsingh@gmail.com",8988234451);



select*from contact;

create table employee (
               employee_id int ,
               first_name varchar(50),
			   last_name varchar(50),
               salary decimal(10,2),
               hire_date date,
               job_title varchar(50),
               email varchar(50),
               phone varchar(12));
               
 insert into employee(employee_id,first_name,last_name,salary, hire_date,job_title,email, phone) values
 (1,"raj","shah",45000,"2022-01-15","manager","raj.shah@gmailcom",786765467),
 (2,"priya","patel",38000,"2024-03-12","devloper","priyapatel@gmailcom",987689083),
 (3,"neha","desai",23000,"2022-03-01","tester","neha.desai@gmail.com",9876767600),
 (4,"riya","trivedi",40000,"2021-01-15","analyst","riya.trivedi@gmail.com",8798767865),
 (5,"vishal","modi",32000,"2021-01-15","support","vishal.modi@gmail.com",8654356779),
 (6,"harsh", "raval",23000,"2023-05-01","cousultant","harsh.raval@gmail.com",9876989809),
 (7,"amit","roy",50000,"2021-01-01","team lead","amit.roy@gmail.com",8092365432),
 (8,"karan","mehra",42000,"2021-01-15","hr","karan.mehra@gmail.com",8978989890),
 (9,"parth","bhatt",20000,"2022-01-12","tester","parth.bhatt@gmail.com",8989765659),
 (10,"mona","singh",30000,"2024-01-12","devloper","monas@gmailcom",9023223346);


alter table employee
add primary key (employee_id);
select*from employee;


create table company(
			company_id int auto_increment primary key,
            company_name varchar(50),
            street varchar(50),
            city varchar(50),
            state varchar(50),
            zip varchar(50));
            


insert into company(company_name,street, city,state,zip)values
("techno pvt ltd","m.g road","ahmedabad","GJ","380001"),
("skyline solution","c.g road","ahmedabad","GJ","340002"),
("bright future","nehru street","mumbai","MH","400001"),
("global mart","sector15","gandhinagar","GJ","380213"),
("nextgen system","90 park","pune","MH","382015"),
("IT Park","lake view","udaipur","RJ","310001"),
("sunrice enterprice","civil lines","jaipur","RJ","340002"),
("metro trades","nehru street","vadodara","GJ","23002"),
("silver line","sector 2","delhi","dL","10002"),
("techno hub","s.g highway","ahmedabad","GJ","38002");

select*from company;


create table contactemployee( 
                  contactemployee_id int, 
                  contact_id int,
                  empolyee_id int,
                  contractdate date,
                  description varchar(100));
              

alter table contactemployee
 add constraint fk_contact
 foreign key (contact_id) references contact(contact_id);   
 
alter table contactemployee
change empolyee_id employee_id int;

 alter table contactemployee
 add constraint fk_employee
 foreign key (employee_id) references employee(employee_id);
     
  insert into contactemployee( contactemployee_id, contact_id ,employee_id, contractdate,description)values
                            (1,1,1,"2024-01-01","Full time employee"),
                            (2,2,2,"2024-01-15","Temporary contract"),
                            (3,3,3,"2024-06-12","project base work"),
                            (4,4,4,"2021-04-10","hr agreement"),
                            (5,5,5,"2024-07-12","on probation"),
                            (6,6,6,"2025-12-12","internal transfer"),
                            (7,7,7,"2023-08-18","part time contact"),
                            (8,8,8,"2024-02-13","sales department"),
                            (9,9,9,"2021-01-10","remote employee"),
                            (10,10,10,"2023-05-12","consultant role");
                            
select*from contactemployee;   


       
-- 1) Statement to create the Contact table   
-- 2) Statement to create the Employee table  
-- 3) Statement to create the ContactEmployee table  
-- HINT: Use DATE as the datatype for ContactDate. 
-- It allows you to store the date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014). 


-- ------------------------------------------------------------------------------------------------                       
-- 4) In the Employee table, the statement that changes neha’s phone number to 215-555-8800

update employee
set phone = "2155558800"
where first_name = "neha" 
and last_name = "desai"
limit 1;

select*from employee;

-- 5) In the Company table, 
-- the statement that changes the name of “global mart” to “Urban Outfitters” .

select*from company;

update company
set company_name ="Urban Outfitters"
where company_name ="global mart"
limit 1;

 -- 6)  In ContactEmployee table, 
-- the statement that removes "rahul sharma" s contact event with "vishal modi"(one statement).
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove. 

select*from employee;
select*from contactemployee;
select*from contact;

delete ce
from contactemployee ce
join contact c 
on ce.contact_id = c.contact_id
join employee e 
on ce.employee_id = e.employee_id
where c.first_name = "rahul"
and   c.last_name = "sharma"  -- 5 row delet
and   e.first_name = "vishal" -- 5 row delet
and   e.last_name = "modi";
 
 
-- 7) Write the SQL SELECT query 
-- that displays the names of the employees that have contacted " bright future" (one statement). 
-- Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.  

select*from company; -- 3
select*from contactemployee;
select*from employee;



select distinct e.first_name,e.last_name
from employee e 
join contactemployee ce on e.employee_id = ce. employee_id
join contact c on  ce.contact_id = c.contact_id
join company co on c.company_id = co.company_id
where co.company_name = " bright future" ;


-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 

-- Like operator is use pattern matching 
--  % - 0,1 unlimited character match 
--  _ - exactly one character match

  
-- 9) Explain normalization in the context of databases.  

-- it is process of database to properly organize 
-- remove duplicate data 
-- data consistency maintain


-- 10) What does a join in MySQL mean? 

-- join means join multiple tables with using related data combine


-- 11) 19.What do you understand about DDL, DCL, and DML in MySQL?  

-- DDL(DATA DEFINATION LANGUAGE):  create & change or delete database structure 

                   -- CREATE, ALTER, DROP, TRUNCATE
                   
-- DML(DATA MANIPULATION LANGUAGE): store and delet data in structure      
                 
                    -- INSERT,UPDATE,DELETE
                    
-- DCL() DATA CONTROLL LANGUAGE): controll,acess,permission in database

                    -- GRANT, REVOKE                    

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 

-- join clause is used to combine rows from two or more tables based on related column between them
-- commom types
-- 1. inner join : matchin records from both tables
-- 2. left join : return all records from left table + match records
-- 3. right join : return all records from right table + match records
-- 4. full join : return all records of table OF RIGHT, LEFT and match data
-- 5. cross join : reurns all possible combination of rows from two tables  