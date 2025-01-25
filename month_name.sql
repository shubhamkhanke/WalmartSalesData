-- Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar).
Alter table sales add column month_name varchar(20);

select date,
monthname(date) as month_name
 from sales;
 
update sales set month_name = monthname(date);

select * from sales;