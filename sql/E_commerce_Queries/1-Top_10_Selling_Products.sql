-- 1. Top 10 selling products : Find products with the highest sales volume or revenue.

SELECT 
    p.product_id,
    p.product_category_name,
    COUNT(oi.product_id) AS total_units_sold,
    SUM(oi.price) AS total_revenue
FROM df_orderitems AS oi
JOIN df_products AS p 
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;
