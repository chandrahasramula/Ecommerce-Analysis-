-- 15. Market Basket Analysis — Products Frequently Purchased Together


SELECT 
    a.product_id AS product_a,
    b.product_id AS product_b,
    COUNT(*) AS times_bought_together
FROM df_orderitems a
JOIN df_orderitems b
    ON a.order_id = b.order_id
   AND a.product_id < b.product_id
GROUP BY a.product_id, b.product_id
ORDER BY times_bought_together DESC;
