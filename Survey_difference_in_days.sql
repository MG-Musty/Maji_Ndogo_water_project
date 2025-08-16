/*
To calculate how long the survey took, we need to get the first and last dates (which functions can find the largest/smallest value), 
and subtract them. Remember with DateTime data, we can't just subtract the values. We have to use a function to get the difference in days.
*/

SELECT 
    MIN(time_of_record) AS first_date,
    MAX(time_of_record) AS last_date,
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS survey_difference_in_days
FROM 
    md_water_services.visits;