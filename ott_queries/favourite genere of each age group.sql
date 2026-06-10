-- favourite genere by each age group category 

select age_group , fav_genre,
round(sum(avg_watch_hrs_week),2)as watch_hour,
dense_rank() over(partition by age_group order by round(sum(avg_watch_hrs_week),2) ) rnk 
from ott_customer_churn
group by age_group, fav_genre;