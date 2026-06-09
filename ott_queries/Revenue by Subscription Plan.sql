-- Which subscription plans generate the most revenue?
SELECT 
subscription_plan,
SUM(monthly_charge_inr) AS total_revenue
FROM ott_customer_churn
GROUP BY subscription_plan
ORDER BY total_revenue DESC;