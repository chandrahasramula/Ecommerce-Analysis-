-- 7. Customer Repeat Purchase Rate
SELECT 
    ROUND(100 * COUNT(DISTINCT customer_id)/(SELECT COUNT(DISTINCT customer_id) FROM df_orders), 2) AS repeat_customer_percentage
FROM (
    SELECT customer_id
    FROM df_orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS repeat_customers;