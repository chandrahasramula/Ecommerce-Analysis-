-- 8. Best Selling Product Categories by State

SELECT 
    c.customer_state,
    p.product_category_name,
    COUNT(*) AS units_sold
FROM df_orderitems AS oi
JOIN df_orders AS o ON oi.order_id = o.order_id
JOIN df_customers AS c ON o.customer_id = c.customer_id
JOIN df_products AS p ON oi.product_id = p.product_id
GROUP BY c.customer_state, p.product_category_name
ORDER BY units_sold DESC;