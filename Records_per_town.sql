/*
Looking at the location table, let’s focus on the province_name, town_name and location_type to understand where the water sources are in Maji Ndogo.

I created a query that counts the number of records per town:
*/

SELECT 
    town_name,
    COUNT(*) AS records_per_town
FROM 
    md_water_services.location
GROUP BY 
    town_name;