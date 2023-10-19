
USE pizza_db;

select *
from pizza_sales



--Hourly Trend for Pizzas Sold

 select DATEPART(HOUR, order_time) AS Order_Hour, sum(quantity) AS Total_Pizzas_Sold
 from pizza_sales
 GROUP BY DATEPART(HOUR, order_time)
 ORDER BY DATEPART(HOUR, order_time)

 --Weekly Order Trend
 select DATEPART(ISO_WEEK, order_date) AS Week_Number, Year(order_date) AS Order_Year, 
 count(distinct order_id) AS Total_orders
 from pizza_sales
 GROUP BY DATEPART(ISO_WEEK, order_date),Year(order_date)
 ORDER BY DATEPART(ISO_WEEK, order_date),Year(order_date)


 --Percentage of Sales by Pizza Category
 SELECT pizza_category, sum(total_price)*100/ (select sum(total_price)from pizza_sales WHERE  MONTH(order_date) =1) AS PCT
 from pizza_sales
 WHERE  MONTH(order_date) =1
 GROUP BY pizza_category


  --Percentage of Sales by Pizza Size
 SELECT pizza_size, sum(total_price) AS Total_Price, cast(sum(total_price)*100/ (select sum(total_price)from pizza_sales  WHERE DATEPART(QUARTER, order_date) =1)AS decimal(10,2)) AS PCT
 from pizza_sales
 WHERE DATEPART(QUARTER, order_date) =1
 GROUP BY pizza_size
 ORDER BY PCT DESC

 --Top 5 Best sellers by Revenue, Total Quantity and Total Orders

 Select TOP 5 pizza_name, sum(total_price) AS Total_Revenue
 From pizza_sales
 Group By pizza_name 
 ORDER BY Total_Revenue DESC


 Select TOP 5 pizza_name, sum(quantity) AS Total_Quantity
 From pizza_sales
 Group By pizza_name 
 ORDER BY Total_Quantity DESC

 Select TOP 5 pizza_name, sum(quantity) AS Total_Quantity
 From pizza_sales
 Group By pizza_name 
 ORDER BY Total_Quantity DESC

 Select TOP 5 pizza_name, count(distinct order_id) AS Total_Order
 From pizza_sales
 Group By pizza_name 
 ORDER BY Total_Order DESC