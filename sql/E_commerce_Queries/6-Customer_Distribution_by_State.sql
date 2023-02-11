-- 6. Customer Distribution by State

SELECT 
    customer_state,
    COUNT(*) AS total_customers
FROM df_customers
GROUP BY customer_state
ORDER BY total_customers DESC;