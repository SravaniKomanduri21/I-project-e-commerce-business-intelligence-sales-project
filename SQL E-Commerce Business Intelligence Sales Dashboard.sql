#Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;
#Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;
#Total Revenue
SELECT SUM(total_amount) AS Total_Revenue
FROM Orders;
#Total Products
SELECT COUNT(*) AS Total_Products
FROM Products;
#Total Categories
SELECT COUNT(*) AS Total_Categories
FROM Categories;
#Total Quantity Sold
SELECT SUM(quantity) AS Total_Quantity_Sold
FROM Order_Items;
#Average Order Value
SELECT AVG(total_amount) AS Avg_Order_Value
FROM Orders;
#Maximum Order Value
SELECT MAX(total_amount) AS Highest_Order
FROM Orders;
#Minimum Order Value
SELECT MIN(total_amount) AS Lowest_Order
FROM Orders;
#Customers by Gender
SELECT gender,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY gender;
#Customers by State
SELECT state,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY state
ORDER BY Total_Customers DESC;
#Customers by City
SELECT city,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY city
ORDER BY Total_Customers DESC;
#Orders by Status
SELECT order_status,
       COUNT(*) AS Total_Orders
FROM Orders
GROUP BY order_status;
#Payment Method Analysis
SELECT payment_method,
       COUNT(*) AS Transactions
FROM Payments
GROUP BY payment_method;
#Payment Status Analysis
SELECT payment_status,
       COUNT(*) AS Total_Payments
FROM Payments
GROUP BY payment_status;
#Top 10 Selling Products
SELECT p.product_name,
       SUM(oi.quantity) AS Quantity_Sold
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Quantity_Sold DESC
LIMIT 10;
#Top Categories by Quantity Sold
SELECT c.category_name,
       SUM(oi.quantity) AS Quantity_Sold
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY Quantity_Sold DESC;
#Revenue by Category
SELECT c.category_name,
       SUM(oi.quantity * oi.unit_price) AS Revenue
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY Revenue DESC;
#Revenue by Brand
SELECT brand,
       SUM(price) AS Revenue
FROM Products
GROUP BY brand
ORDER BY Revenue DESC;
#Top 10 Customers by Spending
SELECT customer_id,
       SUM(total_amount) AS Spending
FROM Orders
GROUP BY customer_id
ORDER BY Spending DESC
LIMIT 10;
#Monthly Sales Trend
SELECT YEAR(order_date) AS Year,
       MONTH(order_date) AS Month,
       SUM(total_amount) AS Revenue
FROM Orders
GROUP BY Year, Month
ORDER BY Year, Month;
#Revenue by State
SELECT c.state,
       SUM(o.total_amount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY Revenue DESC;
#Revenue by City
SELECT c.city,
       SUM(o.total_amount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY Revenue DESC;
#Most Used Courier Service
SELECT courier_name,
       COUNT(*) AS Deliveries
FROM Shipping
GROUP BY courier_name
ORDER BY Deliveries DESC;
# Average Shipping Cost
SELECT AVG(Shipping_cost) AS Avg_Shipping_Cost
FROM Shipping;


 