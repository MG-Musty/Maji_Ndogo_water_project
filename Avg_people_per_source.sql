-- How many people share particular types of water sources on average?

SELECT 
    type_of_water_source,
    ROUND(AVG(number_of_people_served), 0) AS avg_people_per_source
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;