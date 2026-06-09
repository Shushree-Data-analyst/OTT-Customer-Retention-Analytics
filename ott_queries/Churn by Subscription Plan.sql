-- Which subscription plans have the highest churn?
SELECT 
subscription_plan,
ROUND(AVG(churned) * 100,2) AS churn_rate
FROM ott_customer_churn
GROUP BY subscription_plan
ORDER BY churn_rate DESC;