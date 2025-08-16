-- How many people did we survey in total?

SELECT 
    SUM(number_of_people_served) AS total_people_served
FROM 
    md_water_services.water_source;