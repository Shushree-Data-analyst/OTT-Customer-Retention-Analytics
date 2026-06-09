-- Which cities have the highest number of subscribers?
SELECT 
city,
COUNT(*) AS total_customers
FROM ott_customer_churn
GROUP BY city
ORDER BY total_customers DESC
LIMIT 10;