--to check all the column names in my data 
-- to check the data types in my data 
select *
from sales.retail.bright_coffee_shopp
limit 10;
-- i want to chheck categorial columns
select distinct store_location
from sales.retail.bright_coffee_shopp;

select distinct product_category
from sales.retail.bright_coffee_shopp;

select min(transaction_date) as opening_date
from sales.retail.bright_coffee_shopp;

SELECT MIN(TRANSACTION_TIME) AS earliest_time
from sales.retail.bright_coffee_shopp;

SELECT MAX(TRANSACTION_TIME) AS latest_date
from sales.retail.bright_coffee_shopp;
select max(transaction_date) as last_operating_date
from sales.retail.bright_coffee_shopp;

---
select transaction_date, dayname(transaction_date) as day_name,
CASE
WHEN day_name in ('SUN','SAT') THEN 'WEEKEND'
ELSE 'WEEKDAY'
END AS DAY_CLASSIFICATION,
monthname(transaction_date) as month_name,
case 
when TRANSACTION_TIME between '06:00:00' and '11:59:59' then 'Morning'
when TRANSACTION_TIME between'12:00:00' and '16:59:59' then 'Afternoon'
when TRANSACTION_TIME >= '17:00:00' then 'Evening'
end as time_classification,
HOUR(TRANSACTION_TIME) AS HOUR_OF_DAY,
--categorial data
store_location,product_category,product_detail,product_type,
--IDS--
count(distinct transaction_id)as number_of_sales,
---Revenue--
sum(transaction_qty*unit_price) as revenue,
from sales.retail.bright_coffee_shopp
Group by all;
