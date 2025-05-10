SELECT 
    op.product_id,
    SUM(op.quantity * p.weight) AS totalWeight
FROM 
    orders o
JOIN orders_products op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
JOIN route_segments rs ON o.order_id = rs.order_id
WHERE 
    o.customer_id = 32
    AND rs.segment_type = 'STOP'
    AND DATE(rs.segment_start_time) = '2024-02-13'
GROUP BY 
    op.product_id
ORDER BY 
    totalWeight ASC;
