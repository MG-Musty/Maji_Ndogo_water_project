/*
Pivot tables are not widely used in SQL, despite being useful for interpreting results. So there are no built-in functions to do this for us. 
Sometimes the dataset is just so massive that it is the only option.
For rows, we will use the hour of the day in that nice format, and then make each column a different day!
To filter a row we use WHERE, but using CASE() in SELECT can filter columns. We can use a CASE() function for each day to separate the queue time column into a column for each day. Let’s begin by only focusing on Sunday. 
So, when a row's DAYNAME(time_of_record) is Sunday, we make that value equal to time_in_queue, and NULL for any days.
We create separate columns for each day with a CASE() function.
*/

SELECT
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,

    -- Sunday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Sunday,

    -- Monday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Monday,

    -- Tuesday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Tuesday,

    -- Wednesday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Wednesday,

    -- Thursday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Thursday,

    -- Friday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Friday,

    -- Saturday
    ROUND(AVG(CASE
        WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
        ELSE NULL
    END), 0) AS Saturday

FROM
    visits
WHERE
    time_in_queue != 0 -- Exclude sources like tap_in_home with no queue

GROUP BY
    hour_of_day
ORDER BY
    hour_of_day;