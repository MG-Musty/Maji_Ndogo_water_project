/*
To make it a bit simpler to interpret, let's use percentages. 
First, we need the total number of citizens then use the result of that and divide each of the SUM(number_of_people_served) by that number, times 100, to get percentages.
*/

SELECT 
    type_of_water_source,
    ROUND((SUM(number_of_people_served) / 27000000) * 100, 0) AS percentage_people_per_source
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;