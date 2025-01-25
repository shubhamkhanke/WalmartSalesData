-- Business Questions To Answer
-- How many unique cities does the data have?
select distinct city from sales;

select city from sales group by city having count(city) > 1;

-- In which city is each branch?
select distinct branch from sales;

-- How many unique product lines does the data have?
select distinct count(product_line) from sales;
select * from sales limit 5;

-- What is the most common payment method?
select distinct payment, count(payment) as most_common_payment 
from sales group by payment 
order by most_common_payment desc;

-- What is the most selling product line?
select distinct product_line, count(product_line) as most_product_line 
from sales group by product_line 
order by most_product_line desc;

-- What is the total revenue by month?
select * from sales limit 5;
select month_name, sum(total) as total_revenue 
from sales group by month_name 
order by total_revenue DESC;

-- What month had the largest COGS?
select * from sales limit 5;
select month_name, sum(cogs) as largest_COGS from sales
group by month_name order by largest_COGS DESC;

-- What product line had the largest revenue?
select * from sales limit 5;
select product_line, sum(total) as largest_rev
from sales group by product_line
order by largest_rev desc;

-- What is the city with the largest revenue?
select * from sales limit 5;
select city, sum(total) as largest_rev
from sales group by city
order by largest_rev desc;

-- What product line had the largest VAT?
select * from sales limit 5;
select product_line, avg(tax_pct) as largest_VAT
from sales group by product_line
order by largest_VAT desc;

-- Which branch sold more products than average product sold?
select branch, sum(quantity)
from sales group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- What is the most common product line by gender?
select * from sales limit 5;
select gender, product_line, count(gender) as most_common_gender
from sales group by product_line,gender
order by most_common_gender desc;

-- What is the average rating of each product line?
select * from sales limit 5;
select product_line, round(avg(rating),2) as average_rating 
from sales group by product_line
order by average_rating desc;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales.
select * from sales limit 5;

with cte1 as 
(select product_line, sum(total) as sum_sales , round(avg(total),2) as average_sale 
from sales group by product_line)
select product_line, average_sale,
(
CASE 
	when average_sale >= 322.67 then 'Good'
    else 'Bad'
END 
)  as Performance FROM cte1;


-- Sales
-- Number of sales made in each time of the day per weekday.
select * from sales limit 5;
select time_of_day, count(*) as total_sales 
from sales
where day_name = 'Monday'
group by time_of_day
order by total_sales;

-- Which of the customer types brings the most revenue?
select customer_type, sum(total) as most_revenue
from sales
group by customer_type
order by most_revenue DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select * from sales limit 5;
select city, avg(tax_pct) as largest_tax_per
from sales
group by city
order by largest_tax_per DESC;

-- Which customer type pays the most in VAT?

select customer_type , avg(tax_pct) as tax_pay
from sales
group by customer_type
order by tax_pay DESC;


-- Customer
-- How many unique customer types does the data have?
select * from sales limit 5;
select distinct customer_type from sales;

-- How many unique payment methods does the data have?
select * from sales limit 5;
select distinct payment as unique_payment from sales;

-- Which customer type buys the most?
select customer_type, count(*) as most_buy
from sales group by customer_type
order by most_buy desc;

-- What is the gender of most of the customers?
select gender, count(customer_type) as most_customer
from sales group by gender
order by most_customer;
-- What is the gender distribution per branch?
select gender, count(gender) as cnt_gender
from sales
where branch = 'C'
group by gender
order by cnt_gender;
-- Which time of the day do customers give most ratings?
select * from sales limit 5;
select time_of_day, round(avg(rating),2) as most_ratings
from sales
group by time_of_day
order by  most_ratings desc;
-- Which time of the day do customers give most ratings per branch?
select time_of_day, round(avg(rating),2) as most_ratings
from sales
where branch = 'C'
group by time_of_day
order by  most_ratings desc;
-- Which day fo the week has the best avg ratings?
select * from sales limit 5;
select day_name, avg(rating) as avg_rating
from sales
group by day_name
order by avg_rating desc;
-- Which day of the week has the best average ratings per branch?
select day_name, round(avg(rating),2) as avg_rating
from sales
where branch = 'A'
group by day_name
order by avg_rating desc;
