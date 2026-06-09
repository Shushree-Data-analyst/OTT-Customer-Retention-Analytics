-- What percentage of customers are leaving the platform?
SELECT 
ROUND(AVG(churned) * 100,2) AS churn_rate
FROM ott_customer_churn;