-- VHow many people are getting water from each type of source?

SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS population_served
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;