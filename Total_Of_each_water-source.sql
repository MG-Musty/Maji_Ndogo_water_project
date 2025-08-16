-- How many wells, taps and rivers are there?

SELECT 
    type_of_water_source,
    COUNT(*) AS number_of_sources
FROM 
    md_water_services.water_source
GROUP BY
	type_of_water_source;