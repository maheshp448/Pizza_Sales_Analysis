--   1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


--   2. Avg. Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;


--   3. Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;


--   4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;


--   5. Average Pizza Per Order
SELECT
    CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS Avg_Pizza_Per_Order
FROM pizza_sales;


--   6. Daily Trend For Total Order
SELECT
    DAYNAME(order_date) AS Order_Day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);


--   7. Monthly Trend For Total Order
SELECT
    MONTHNAME(order_date) AS Order_Month,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date);


--   8. Percentage OF Sales By Pizza Category (In January)
SELECT
    pizza_category,
    SUM(total_price) AS Total_Sales,
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;


--   9. Percentage OF Sales By Pizza Size (For Quarter - 1)
SELECT
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE QUARTER(order_date) = 1) AS DECIMAL(10, 2)) AS PCT
FROM pizza_sales
WHERE QUARTER(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;


--   10. Top 5 Best Seller By Revenue
SELECT
    pizza_name,
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;


--   11. Bottom 5 Best Seller By Revenue
SELECT
    pizza_name,
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;


--   12. Top 5 Best Seller By Quantity
SELECT
    pizza_name,
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;


--   13. Bottom 5 Best Seller By Quantity
SELECT
    pizza_name,
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;


--   14. Top 5 Best Seller By Order
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC
LIMIT 5;


--   15. Bottom 5 Best Seller By Order
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC
LIMIT 5;


