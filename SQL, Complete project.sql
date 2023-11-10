select * from orders;

-- KPIs Total Revenue, Profit, Number of Orders, Profit margin

Select 
		round(sum(revenue),2) as Total_revenue
	,	sum(profit) as Total_profit
	,	count(order_id) as Number_of_Orders
	,	round(sum(profit)/sum(revenue) * 100,2) as profit_margin
From
	Orders;

-- 2. Total Revenue, Profit, Number of Orders, Profit margin for each sport

Select 
		sport
	,	round(sum(revenue),2) as Total_revenue
	,	sum(profit) as Total_profit
	,	count(order_id) as Number_of_Orders
	,	round(sum(profit)/sum(revenue) * 100,2) as profit_margin
from
	Orders
Group by 
	Sport
Order by 
	Total_revenue desc;

-- 3. Number of customers ratings and the average rating

Select
		(select count(*) from orders where rating is not null) as #_rating
	,	round(AVG(rating),2) as AVG_rating
from 
	orders;

-- 4. Number of people for each rating and it's revenue, profit, profit margin

Select 
		rating
	,	sum(revenue) as Total_profit
	,	sum(profit) as Total_profit
	,	round(sum(profit)/sum(revenue) * 100,2) as Profit_margin
from 
	orders
where 
	rating is not null
Group by 
	rating
Order by
	rating desc;

-- 5. State revenue, profit, profit margin

Select 
		State
	,	sum(revenue) as Total_revenue
	,	sum(profit) as Total_profit
	,	round(sum(profit)/sum(revenue)* 100,2) as Profi_margin
from 
	orders
join
	customers 
		ON orders.customer_id = customers.customer_id
Group by 
	State
Order by 
	Total_profit desc;

-- 6. Monthly Profits

Select
		Month(date) as month
	,	sum(profit) as Total_profit
from
	orders
Group by 
	month(date)
Order by
	Total_profit desc;