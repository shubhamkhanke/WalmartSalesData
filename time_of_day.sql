-- Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. 

SELECT time FROM walmartsales.sales;

alter table sales drop column time_of_day;

select time,
(CASE
	WHEN time BETWEEN '00:00:00' and '12:00:00' THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    else
    'Evening'
end
) as time_of_day from sales;

Alter table sales add column time_of_day varchar(20);

UPDATE sales set time_of_day = (CASE
	WHEN time BETWEEN '00:00:00' and '12:00:00' THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    else
    'Evening'
end
);


select * from sales limit  20;