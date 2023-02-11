-- 2. Most frequent product categories purchased.

SELECT 
    p.product_category_name,
    COUNT(*) AS total_units_sold
FROM df_orderitems AS oi
JOIN df_products AS p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_units_sold DESC;
