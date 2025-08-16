-- Also counted the records per province:

SELECT 
    province_name,
    COUNT(*) AS records_per_province
FROM 
    md_water_services.location
GROUP BY 
    province_name;