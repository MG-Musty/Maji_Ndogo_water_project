/*
Let's see how long people have to queue on average in Maji Ndogo. Keep in mind that many sources like taps_in_home have no queues. 
These are just recorded as 0 in the time_in_queue column, so when we calculate averages, we need to exclude those rows. 
Try using NULLIF() do to this.
*/

SELECT 
    AVG(NULLIF(time_in_queue, 0)) AS avg_time_in_queue
FROM 
    md_water_services.visits;