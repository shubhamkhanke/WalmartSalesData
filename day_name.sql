-- Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
alter table sales add column day_name varchar(10);

select date, dayname(date) as day_name from sales;

select * from sales limit 20;

update sales set day_name = dayname(date);