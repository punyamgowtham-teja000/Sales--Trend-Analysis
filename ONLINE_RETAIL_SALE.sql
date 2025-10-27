-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS ONLINE_RETAIL_SALE;
DROP TABLE sales_data;
CREATE TABLE sales_data (
    Product_ID INT,
    Sale_Date DATE,
    Sales_Rep VARCHAR(50),
    Region VARCHAR(50),
    Sales_Amount DECIMAL(10, 2),
    Quantity_Sold INT,
    Product_Category VARCHAR(50),
    Unit_Cost DECIMAL(10, 2),
    Unit_Price DECIMAL(10, 2),
    Customer_Type VARCHAR(50),
    Discount DECIMAL(4, 2),
    Payment_Method VARCHAR(50),
    Sales_Channel VARCHAR(50),
    Region_and_Sales_Rep VARCHAR(100)
);
SELECT * FROM sales_data LIMIT 5;
-- 1. Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Sale_Year,
    EXTRACT(MONTH FROM Sale_Date) AS Sale_Month,
    SUM(Sales_Amount) AS Total_Revenue,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY Sale_Year, Sale_Month
ORDER BY Sale_Year, Sale_Month;

-- 2. Monthly Revenue for a Specific Year 

SELECT 
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Revenue
FROM sales_data
WHERE EXTRACT(YEAR FROM Sale_Date) = 2023
GROUP BY Month
ORDER BY Month;

-- 3. Monthly Quantity Sold

SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Quantity_Sold) AS Total_Quantity
FROM sales_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- 4. Average Sales per Order Monthly
SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    AVG(Sales_Amount) AS Avg_Sale_Per_Order
FROM sales_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- 5. Revenue by Payment Method per Month
SELECT 
    Payment_Method,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Total_Revenue
FROM sales_data
GROUP BY Payment_Method, Month
ORDER BY Month, Total_Revenue DESC;

-- 6. Monthly Revenue by Region
SELECT 
    Region,
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Revenue
FROM sales_data
GROUP BY Region, Year, Month
ORDER BY Region, Year, Month;

-- 7. Monthly Revenue by Product Category
SELECT 
    Product_Category,
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Revenue
FROM sales_data
GROUP BY Product_Category, Year, Month
ORDER BY Product_Category, Year, Month;

-- 8. Highest Revenue Month Overall

SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Total_Revenue
FROM sales_data
GROUP BY Year, Month
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 9. Top 5 Sales Reps by Monthly Revenue

SELECT 
    Sales_Rep,
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    SUM(Sales_Amount) AS Revenue
FROM sales_data
GROUP BY Sales_Rep, Year, Month
ORDER BY Revenue DESC
LIMIT 5;

--  10. Monthly Discount Analysis
SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    AVG(Discount) AS Avg_Discount,
    SUM(Sales_Amount) AS Total_Revenue
FROM sales_data
GROUP BY Year, Month
ORDER BY Year, Month;





