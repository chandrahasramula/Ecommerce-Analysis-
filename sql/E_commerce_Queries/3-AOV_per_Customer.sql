-- 3. Average Order Value (AOV) per customer

SELECT 
    c.customer_id,
    ROUND(SUM(order_totals.order_value) / COUNT(order_totals.order_id), 2) AS avg_order_value
FROM (
    SELECT 
        o.order_id,
        o.customer_id,
        SUM(oi.price + COALESCE(oi.shipping_charges, 0)) AS order_value
    FROM df_orders AS o
    JOIN df_orderitems AS oi 
        ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id
) AS order_totals
JOIN df_customers AS c 
    ON order_totals.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY avg_order_value DESC;
