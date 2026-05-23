create database customer_db;
use customer_db;
select * from customer_data 
limit 10;
-- Step1 : Data Cleaning
-- Check Duplicates(for 2 columns)
select customer_id, item_purchased, count(*) from customer_data
group by customer_id, item_purchased
having count(*) > 1;
-- Check Duplicates (more columns)
select customer_id, item_purchased, category, purchase_amount_usd,
count(*) from customer_data
group by customer_id, item_purchased, category, purchase_amount_usd
having count(*)>1;
-- Step 2 : Customer Demographics
-- Average Age
select avg(age) from customer_data;
-- Gender Distribution
select gender,count(*) from customer_data
group by gender;
-- Step 3 : Revenue Analysis
select gender, sum(purchase_amount_usd) as revenue from customer_data
group by gender;
-- Step 4 : Subscription Status
select subscription_status, count(*) as customers, sum(purchase_amount_usd) as revenue,
 avg(purchase_amount_usd) as avg_usd 
from customer_data
group by subscription_status;
-- Step 5 : Product Performance
-- Most Purchased Items
select item_purchased, count(*) as purchase from customer_data
group by item_purchased
order by item_purchased desc;
-- High Rated Items
select item_purchased, avg(review_rating) as rating from customer_data
group by item_purchased
order by rating desc;
-- Step 6: Customer Segmentation
select 
   case 
     when previous_purchases > 10 then 'Loyal'
     when previous_purchases between 4 and 10 then 'Returning'
     else 'New'
	end as customer_segment,
    count(*)
from customer_data
group by customer_segment;
-- Step 7 : Shipping Type & Spending Pattern
select shipping_type, avg(purchase_amount_usd) as avg_spend from customer_data
group by shipping_type;
-- Step 8 : Age Group Revenue
select 
 case 
    when age < 30 then 'Young'
    when age between 30 and 50 then 'Adult'
    else 'Senior'
  end as age_group,
  sum(purchase_amount_usd) as revenue
from customer_data
group by age_group;





 
