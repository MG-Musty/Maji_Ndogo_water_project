/*
Let's write a query that retrieves all records from this table where the time_in_queue is more than some crazy time, say 500 min. 
How would it feel to queue 8 hours for water?
*/

SELECT
    *
FROM
   visits
WHERE
   time_in_queue > 500;