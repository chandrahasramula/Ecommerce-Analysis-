-- 5. Popular Payment Types

SELECT 
    payment_type,
    COUNT(*) AS total_payments,
    SUM(payment_value) AS total_value
FROM df_payments
GROUP BY payment_type
ORDER BY total_payments DESC;
