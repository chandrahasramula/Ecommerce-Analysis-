-- 12. Customer Lifetime Value (CLV) Estimation
-- CLV = Average Order Value × Purchase Frequency × Average Customer Lifespan
	-- Average Order Value
	-- Purchase Frequency (number of orders / months active)
	-- Lifespan (in months)

SELECT 
    c.customer_id,
    -- Average Order Value
    AVG(order_totals.order_value) AS avg_order_value,
    -- Purchase Frequency (number of orders / months active)
    COUNT(order_totals.order_id) / 
        (IF(DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) > 0,
            DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) / 30.0,
            1
        )) AS purchase_frequency,
    -- Lifespan (in months)
    (IF(DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) > 0,
            DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) / 30.0,
            1
        )) AS customer_lifespan_months,
    -- CLV Estimate
    AVG(order_totals.order_value) * 
        (COUNT(order_totals.order_id) / 
        (IF(DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) > 0,
            DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) / 30.0,
            1
        ))) *
        (IF(DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) > 0,
            DATEDIFF(MAX(order_totals.first_order_date), MIN(order_totals.first_order_date)) / 30.0,
            1
        )  ) AS estimated_clv
FROM (
    SELECT
        o.customer_id,
        o.order_id,
        SUM(oi.price + COALESCE(oi.shipping_charges, 0)) AS order_value,
        MIN(o.order_purchase_timestamp) OVER (PARTITION BY o.customer_id) AS first_order_date,
        MAX(o.order_purchase_timestamp) OVER (PARTITION BY o.customer_id) AS last_order_date
    FROM df_orders o
    JOIN df_orderitems oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id, o.order_purchase_timestamp
) AS order_totals
JOIN df_customers c ON order_totals.customer_id = c.customer_id
GROUP BY c.customer_id;
