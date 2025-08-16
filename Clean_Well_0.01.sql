/*
In the well pollution table, the descriptions are notes taken by our scientists as text, so it will be challenging to process it. 
The biological column is in units of CFU/mL, so it measures how much contamination is in the water. 0 is clean, and anything more than 0.01 is contaminated. Let's check the integrity of the data. 
The worst case is if we have contamination, but we think we don't. People can get sick, so we need to make sure there are no errors here.

Lets write a query that checks if the results is Clean but the biological column is > 0.01.
*/

SELECT 
     *
FROM
 	  well_pollution
WHERE
    results = 'Clean'
    AND biological > 0.01;