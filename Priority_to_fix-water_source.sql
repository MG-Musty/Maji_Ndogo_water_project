/*
Ok, so we should fix shared taps first, then wells, and so on. But the next question is, which shared taps or wells should be fixed first? We can use the same logic; 
the most used sources should really be fixed first.
So let's create a query to do this, and keep these requirements in mind:
1. The sources within each type should be assigned a rank.
2. Limit the results to only improvable sources.
3. Think about how to partition, filter and order the results set.
4. Order the results to see the top of the list.
*/

SELECT 
    source_id,
    type_of_water_source,
    number_of_people_served,
    RANK() OVER (
        PARTITION BY type_of_water_source
        ORDER BY number_of_people_served DESC
    ) AS priority_rank
FROM 
    md_water_services.water_source
WHERE 
    type_of_water_source IN ('shared_tap', 'river')  -- improvable sources
ORDER BY 
    type_of_water_source,
    priority_rank;