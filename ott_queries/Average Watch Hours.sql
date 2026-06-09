-- How engaged are customers on the platform?
SELECT 
ROUND(AVG(avg_watch_hrs_week),2) AS avg_watch_hours
FROM ott_customer_churn;