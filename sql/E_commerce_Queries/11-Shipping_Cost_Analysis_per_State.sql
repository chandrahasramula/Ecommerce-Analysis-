-- 11 Shipping Cost Analysis per State

SELECT 
    c.customer_state,
    ROUND(AVG(oi.shipping_charges), 2) AS avg_shipping_cost
FROM df_orderitems oi
JOIN df_orders o ON oi.order_id = o.order_id
JOIN df_customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_shipping_cost DESC;