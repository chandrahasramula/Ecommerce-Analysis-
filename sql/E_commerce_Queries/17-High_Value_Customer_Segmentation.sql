-- 17. High-Value Customer Segmentation

SELECT
    o.customer_id,
    SUM(oi.price + COALESCE(oi.shipping_charges, 0)) AS total_spent,
    COUNT(DISTINCT o.order_id) AS order_count
FROM df_orders o
JOIN df_orderitems oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING total_spent > 1000  -- Set your definition of 'high value' here
ORDER BY total_spent DESC;