/*
 find records where the subject_quality_score is 10-- only looking for home taps-- and where the source was visited a second time.
 */
 
SELECT
     *
FROM
     water_quality
WHERE
     subject_quality_score = 10
  AND source = 'home tap'
  AND visit_count >= 2;