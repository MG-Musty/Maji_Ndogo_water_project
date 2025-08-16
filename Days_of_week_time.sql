/*
So let's look at the queue times aggregated across the different days of the week.
DAY() gives you the day of the month. It we want to aggregate data for each day of the week, we need to use another DateTime function, DAYNAME(column). As the name suggests, it returns the day from a timestamp as a string. 
Using that on the time_of_record column will result in a column with day names, Monday, Tuesday, etc., from the timestamp.
To do this, we need to calculate the average queue time, grouped by day of the week. 
Remember to revise DateTime functions, and also think about how to present the results clearly.
*/

SELECT 
    DAYNAME(time_of_record) AS day_of_week,
    ROUND(AVG(NULLIF(time_in_queue, 0)), 0) AS avg_time_in_queue
FROM 
    md_water_services.visits
GROUP BY 
    day_of_week
ORDER BY 
    FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');