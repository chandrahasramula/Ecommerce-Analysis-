-- 13. Average Processing Time

SELECT
    ROUND(AVG(TIMESTAMPDIFF(HOUR, order_purchase_timestamp, order_approved_at)),2) AS avg_processing_time_hours
FROM df_orders
WHERE order_approved_at IS NOT NULL;
