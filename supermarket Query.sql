SELECT * FROM inec_data.inec_admin;

drop database inec_data;
create schema supermarket;
select * from supermarket.test;
use supermarket;
create table test_me(
Store int,	
Dept int,
Date date,
IsHoliday bool

);

create table train(
Store int,	
Dept int,
Date date,
Weekly_Sales decimal(7,2),
IsHoliday bool
);
-- upload dataset from computer to MySql

show variables like 'local_infile';
set global local_infile = 1;

load data local infile 'C:/Users/HP/Desktop/portfolio/train.csv'
into table train
fields terminated by ','
ignore 1 rows;

-- Analyzing the data and functions

-- get the distinct productLine
select distinct productLine from supermarket_data;

-- get the Total sum and average sum of productline group by productLine 

select productLine, sum(total) as Total_revenue_per_product, avg(total) as Avg_revenue
from supermarket_data
group by productLine;

-- calculate the total revenue of the store in each branch
select branch, sum(total) as Total_revenue
from supermarket_data
group by branch;

-- Get the number of city and branches of each city
select city, count(branch) as No_of_branch
from supermarket_data
group by city;

-- Get the total revenue generated from each city
select city, sum(total) as Toatal_revenue_for_city
from supermarket_data
group by city;
 
-- get the cus_type with the highest raring, productLine with date
select cus_type, productLine, Date, max(rating) as Highest_rating
from supermarket_data
group by cus_type, productLine, Date;

-- categories per revenue
select distinct productLine, sum(total) as Total_sum_per_ProductLine
from supermarket_data
group by productLine;

