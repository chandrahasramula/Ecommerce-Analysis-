-- 9. Average Basket Size (Items per Order)

SELECT 
    order_id,
    COUNT(product_id) AS items_in_order
FROM df_orderitems
GROUP BY order_id;