-- We start by finding all the unique types of water sources.

SELECT DISTINCT
	type_of_water_source 
FROM 
	md_water_services.water_source;