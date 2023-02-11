-- 14. Cohort Analysis — Group Customers by Join Month and Track Repeat Rates 

SELECT
    cohort_month,
    order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(order_purchase_timestamp), '%Y-%m') AS cohort_month
    FROM df_orders
    GROUP BY customer_id
) first_orders
JOIN df_orders o
    ON first_orders.customer_id = o.customer_id
    -- Extract month of each order
    AND DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') >= first_orders.cohort_month
CROSS JOIN (
    SELECT DISTINCT DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month FROM df_orders
) months
WHERE DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') = months.order_month
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;
