-- Total Records Count (Health Check)
SELECT COUNT(*) AS total_rows
FROM brazilian_e_commerce_public_dataset_by_olist;

-- Understanding columns 
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'brazilian_e_commerce_public_dataset_by_olist';

-- Total Revenue Query
SELECT 
    SUM(price) AS total_revenue
FROM brazilian_e_commerce_public_dataset_by_olist
WHERE order_status = 'delivered';

-- Total Orders (Business Size)
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM brazilian_e_commerce_public_dataset_by_olist
WHERE order_status = 'delivered';

-- Top Selling Categories
SELECT 
    product_category_name,
    COUNT(*) AS total_sales
FROM brazilian_e_commerce_public_dataset_by_olist
WHERE order_status = 'delivered'
GROUP BY product_category_name
ORDER BY total_sales DESC
LIMIT 10

-- Monthly Sales Trend
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp::timestamp) AS month,
    SUM(price) AS monthly_revenue
FROM brazilian_e_commerce_public_dataset_by_olist
WHERE order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Top Customers
SELECT 
    customer_unique_id,
    SUM(price) AS total_spent
FROM brazilian_e_commerce_public_dataset_by_olist
WHERE order_status = 'delivered'
GROUP BY customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;