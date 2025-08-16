-- We can also look at what time during the day people collect water.

SELECT 
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    COUNT(time_in_queue) AS avg_queue_time
FROM 
    md_water_services.visits
GROUP BY 
    hour_of_day
ORDER BY 
    hour_of_day;