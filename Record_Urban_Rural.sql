-- Finally, look at the number of records for each location type:

SELECT 
    location_type,
    COUNT(*) AS num_sources
FROM 
    md_water_services.location
GROUP BY 
    location_type
ORDER BY 
    num_sources DESC;