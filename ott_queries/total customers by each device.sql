-- total customers by each device 


SELECT
    primary_device,
    COUNT(*) AS total_customers
FROM ott_customer_churn
GROUP BY primary_device
ORDER BY total_customers DESC;