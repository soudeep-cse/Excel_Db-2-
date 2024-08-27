select *
from pizza_sales;

-- 1
select cast(sum(total_price) as decimal(10,2)) as total_revenue
from pizza_sales

-- 2
select cast(sum(total_price) / count(distinct(order_id)) as decimal(10,2)) as average_order_value
from pizza_sales;

-- 3
select sum(quantity) as total_pizza_sold
from pizza_sales;

-- 4
select count(distinct(order_id)) as total_orders
from pizza_sales;

-- 5
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct(order_id)) as decimal(10,2)) as decimal(10,2)) as average_pizza_sold
from pizza_sales;

-- 1
select datename(dw,order_date) as daily_trend, count(distinct(order_id))as total_order
from pizza_sales
group by datename(dw,order_date)

-- 2
select datepart(hour,order_time) as hourly_trend, count(distinct(order_id))as total_order
from pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time)

-- 3
select pizza_category, sum(total_price)*100 / (select(sum(total_price)) from pizza_sales 
where datepart(quarter,order_date) = 1) as percentage_sale
from pizza_sales
where datepart(quarter,order_date) = 1
group by pizza_category

-- 4
select pizza_size, sum(total_price) * 100 / (select(sum(total_price)) from pizza_sales
where datepart(quarter,order_date) = 1) as percentage_sale
from pizza_sales
where datepart(quarter,order_date) = 1
group by pizza_size

-- 5
select pizza_category, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_category

--6
select top 5 pizza_name, sum(quantity) as best_sell
from pizza_sales
group by pizza_name
order by sum(quantity) desc

-- 7
select top 5 pizza_name, sum(quantity) as best_sell
from pizza_sales
group by pizza_name
order by sum(quantity)
