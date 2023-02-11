-- 16. Price Sensitivity — Correlate Product Price with Sales Volume

SELECT
    p.product_id,
    p.product_category_name,
    AVG(oi.price) AS avg_price,
    COUNT(oi.product_id) AS units_sold
FROM df_orderitems oi
JOIN df_products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY avg_price ASC;
