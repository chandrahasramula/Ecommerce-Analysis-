-- 10. Average Product Price per Category

SELECT 
    product_category_name,
    ROUND(AVG(price), 2) AS avg_price
FROM df_orderitems oi
JOIN df_products p ON oi.product_id = p.product_id
GROUP BY product_category_name
ORDER BY avg_price DESC;