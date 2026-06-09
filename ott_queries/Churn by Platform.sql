-- Which OTT platforms have the highest customer churn?
SELECT 
platform,
ROUND(AVG(churned) * 100,2) AS churn_rate
FROM ott_customer_churn
GROUP BY platform
ORDER BY churn_rate DESC;