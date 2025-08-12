# Maji_Ndogo_water_project_part_1

Maji_Ndogo water project is a water project of a small nation that is face with water scarcity, uncleaned water, contaminated water. In this project we will be looking on how to solve and provide very insightful decision for the nation, which will deliver a permanent solution through  a database of 60,000 records, meticulously collected by the devoted team of engineers, field workers, scientists, and analysts.

In this project I exhibited my `SQL (Structure Query Language)` skills creating a MYSQL database server using open source software for MySql, and I was able to `import, retrieve, manipulate, wrangling and creating ERD (Entity Relational Diagram)` with all of this some great insight for this project was achieved.

# Queries Functions used

* SELECT
* FROM
* UPDATE
* SET
* LOWER
* UPPER
* COUNT
* RANK
* AVERAGE
* ORDER
* WHERE
* AS
* OVER
* PARTITION
* DATETIME
* NULLIF
* IS NOT NULL
* JOIN
* WITH E.T.C.

# Get to know our data

 As a Data Analyst, I've taken a close look at Dataset and have broken it down into a series of tasks that I need to tackle. So, let's roll up our sleeves and get started.

1. **Get to know our data:**

    Before I do anything else, let's take a good look at our data. We'll load up the database and pull up the first few records from each table. It's like getting to know a new city- we need to explore the lay of the land before we can start our journey.

2.  **Dive into the water sources:**

    We've got a whole table dedicated to the types of water sources in our database. Let's dig into it and figure out all the unique types of water sources we're dealing with.

3. **Unpack the visits to water sources:**

   The `'visits'` table in our database is like a logbook of all the trips made to different water
 sources. We need to unravel this logbook to understand the frequency and distribution of these visits. Let's identify which locationshave been visited more than a certain number of times.

4. **Assess the quality of water sources:**

   The quality of water sources is a pretty big deal. We'll turn to the `water_quality` table to find records where the `subjective_quality_score` is within a certain range and the `visit_count` is above a certain threshold. This should help us spot the water sources that are frequently visited and have a decent quality score.

5. **Investigate any pollution issues:**

   We can't overlook the pollution status of our water sources. Let's find those water sources where the `pollution_tests` result came back as `'dirty' or 'biologically contaminated'`. This will help us flag the areas that need immediate attention.

By working through these tasks, I'll not only be answering the solution to Maji_Ndogo problems but also to explore the database and extract meaningful insights, but I'll also be honing my SQL skills. It's a win-win situation! 

# Processing the data

1. **Get to know our data:**
   
   Start by retrieving the first few records from each table. How many tables are there in our database? What are the names of these ta bles? Once you've identified the tables, write a `SELECT` statement to retrieve the first five records from each table. As you look at the data, take note of the columns and their respective data types in each table. What information does each table contain?  but when you access a new database in MySQL, a handy initial query to run is `SHOW TABLES`.

```
SHOW TABLES;
```
 This will give you a list of all the tables in the database:
 
>| **Tables_in_md_water_services_student** |

>| data_dictionary |

>| employee |

>| global_water_access |

>| location |

>| water_quality |

>| visits |

>| water_source |

>| well_pollution |

So let's have a look at one of these tables, Let's use `location` so we can use that killer query, `SELECT *` but I have to limit it and tell it which table we are looking at.

```
SELECT
     *
FROM
     md_water_services.location;
```

Gives the table below:

>| location_id | address |  province_name | town_name | location_type |

>| AkHa00000 | 2 Addis Ababa Road | Akatsi | Harare | Urban |

 So we can see that this table has information on a specific location, with an address, the province and town the location is in, and if it's in a city `(Urban)` or not. We can't really see what location this is but we can see some sort of identifying number of that location.

 Ok, so let's look at the visits table.

 ```
SELECT
     *
FROM
     md_water_services.visits;
```

Gives the table below:

>| record_id | location_id | source_id | time_of_record | visit_count | time_in_queue | assigned_employee_id |

>| 0 | SoIl32582 | SoIl32582224 | 2021-01-01 09:10:00 | 1 | 15 | 12 |

>| 1 | KiRu28935 |  KiRu28935224 | 2021-01-01 09:17:00 | 1 | 0 | 46 |
 
Yeah, so this is a list of `location_id, source_id, record_id,` and a date and time, so it makes sense that someone `(assigned_employee_id)` visited some location `(location_id)` at some time `(time_of_record )` and found a `'source'` there `(source_id)`. Often the `"_id"` columns are related to another table. In this case, the `source_id` in the visits table refers to `source_id` in the `water_source` table. This is what we call a `foreign key`, but we'll get more into this next time.

Ok, so let's look at the `water_source` table to see what a `'source'` is. Normally `"_id"` columns are related to another table.

 ```
SELECT
     *
FROM
     md_water_services.water_source;
```

Gives the table below:

>| source_id | tap_in_home | type_of_water_source | number_of_people_served |

>| AkHa00000224 | tap_in_home | 956 |

>| AkHa00001224 | tap_in_home_broken | 930 |

 2. **Dive into the water sources:**

    Now that you're familiar with the structure of the tables, let's dive deeper. We need to understand the types of water sources we're dealing with. Let's figure out which table contains this information?

We start by finding all the unique types of water sources.

```
SELECT DISTINCT
	type_of_water_source 
FROM 
	md_water_services.water_source;
```

 So I get this when I run it:
 
 >| type_of_water_source |

 >| tap_in_home |
 
 >| tap_in_home_broken |
 
 >| river |
 
 >| well |
 
 >| shared_tap |

1. **River** - People collect drinking water along a river. This is an open water source that millions of people use in Maji Ndogo. Water from a river has a high risk of being contaminated with biological and other pollutants, so it is the worst source of water possible.

![River water Maji](https://github.com/user-attachments/assets/4b6dce50-72c1-492f-9dce-3917ac760014)

This is a river in the province of Sokoto:

2. **Well** - These sources draw water from underground sources, and are commonly shared by communities. Since these are closed water sources, contamination is much less likely compared to a river. Unfortunately, due to the aging infrastructure and the corruption of officials in the past, many of our wells are not clean.

	![Well water Maji](https://github.com/user-attachments/assets/da3f733b-1ee6-4f38-b406-74b59ccd4d48)

This well is at 146 Okapi Road, in my home town of Yaounde:

3. **Shared tap** - This is a tap in a public area shared by communities.

	![Shared-tap Maji](https://github.com/user-attachments/assets/7f6e31d8-fe01-4292-a7e9-11872ab8974a)

This is a shared tap from 18 Twiga Lane, Hawassa, that serves about 2700 people:

4. **Tap in home** - These are taps that are inside the homes of our citizens. On average about 6 people live together in Maji Ndogo, so
 each of these taps serves about 6 people.

	![Tap-in-home Maji](https://github.com/user-attachments/assets/4f1b64cd-cb3f-401f-901b-f52d0c636d13)

This is a tap in my uncle's home in the capital city, Dahabu:

5. **Broken tap in home** - These are taps that have been installed in a citizen’s home, but the infrastructure connected to that tap is not
 functional. This can be due to burst pipes, broken pumps or water treatment plants that are not working.

	![Broken-tap-in-home Maji](https://github.com/user-attachments/assets/53a31486-58c8-4bba-8236-5b249f4e8e42)

This is a water treatment plant in the town of Kintampo that serves about 1000 people:

3. **Unpack the visits to water sources:**
   
 We have a table in our database that logs the visits made to different water sources. Lets identify this table.

Let's write a query that retrieves all records from this table where the time_in_queue is more than some crazy time, say 500 min. How would it feel to queue 8 hours for water?

 ```
SELECT
     *
FROM
    visits
WHERE
    time_in_queue > 500;
```

The following columns will display with the their values each:

>| record_id | location_id | source_id | time_of_record | visit_count | time_in_queue | assigned_employee_id |

After running the above query I discover that some water source took more than a 8hrs waiting on the queue only to get water from that source.  How is this possible? Can you imagine queueing 8 hours for water?

4. **Assess the quality of water sources:**

 The quality of our water sources is the whole point of this survey. We have a table that contains a quality score for each visit made about a water source that was assigned by a Field surveyor. They assigned a score to each source from 1, being terrible, to 10 for a good, clean water source in a home. Shared taps are not rated as high, and the score also depends on how long the queue times are.

I will write a query to find records where the `subject_quality_score` is 10-- only looking for home taps-- and where the source was visited a second time.

```
SELECT
     *
FROM
     water_quality
WHERE
     subject_quality_score = 10
  AND source = 'home tap'
  AND visit_count >= 2;
```

We get the columns below:

>| record_id | subjective_quality_score | visit_count |

5. **Investigate pollution issues:**

There was a table that recorded contamination/pollution data for all of the well sources? I will display the table with the first few rows.

```
SELECT
     *
FROM
    md_water_services.well_pollution;
```

Display the columns with values:

>| source_id | date | description | pollutant_ppm | biological | results |

 In the well pollution table, the descriptions are notes taken by our scientists as text, so it will be challenging to process it. The biological column is in units of CFU/mL, so it measures how much contamination is in the water. 0 is clean, and anything more than 0.01 is contaminated.
Let's check the integrity of the data. The worst case is if we have contamination, but we think we don't. People can get sick, so we need to make sure there are no errors here.

Lets write a query that checks if the results is Clean but the biological column is > 0.01.

```
SELECT 
     *
FROM
 	  well_pollution
WHERE
    results = 'Clean'
    AND biological > 0.01;
```

Gives the below table:

>| source_id | date | description | pollutant_ppm | biological | results |

>| AkRu08936224 | 2021-01-08 09:22:00 | Bacteria: E. coli | 0.0406458 |35.0068 | Clean |

# Maji_Ndogo_water_project_part_2

As we know that having a data there will be some inconsistence that come either through wrongly records or errors from the surveyors that took the records of all the datas inputted.

1. **Cleaning our data**

 	Updating Employee data, bring up the employee table. It has info on all of the workers, but note that the email addresses have not been added. We will have to send them reports and figures, so let's update it. Luckily the emails for our department are easy: `first_name.last_name@ndogowater.gov.`

Bring up employee table:

```
SELECT
	*
FROM
	md_water_services.employee;
```

The above will display employee table.

>| assigned_employee_id | employee_name | phone_number | email | address | province_name | town_name | position |

>| 0 | Amara Jengo | +99637993287 | NULL | 36 Pwani Mchangani Road | 'Sokoto | Ilanga | Field Surveyor |

I have to update the database again with these email addresses, so before we do, let's use a `SELECT` query to get the format right, then use `UPDATE` and `SET` to make the changes.

- First up, let's remove the space between the first and last names using REPLACE().

- Then we can use LOWER() with the result we just got. Now the name part is correct.

- We then use CONCAT() to add the rest of the email address:

```
SELECT
	*,
	CONCAT(
	LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov') AS new_email
FROM
	md_water_services.employee;
```

It will gives the below:

>| assigned_employee_id | employee_name | phone_number | address | province_name | town_name | position | new_email |

>| 0 | Amara Jengo | +99637993287 | 36 Pwani Mchangani Road | Sokoto | Ilanga | Field Surveyor | amara.jengo@ndogowater.gov |

>| 1 | Bello Azibo | +99643864786 |	129 Ziwa La Kioo Road | Kilimani | Rural | Field Surveyor | bello.azibo@ndogowater.gov |

I go ahead and UPDATE the email column this time with the email addresses.

Fisrt we have to add the following code line `SET SQL_SAFE_UPDATES = 0;` cause we need to let MYSQL server know that is safe for us to update the table:

```
SET SQL_SAFE_UPDATES = 0;

UPDATE md_water_services.employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov')
```
Then run the SELECT query you get the  below:

>| assigned_employee_id | employee_name | phone_number | email, address | province_name | town_name | position |

>|0 | Amara Jengo | +99637993287 | amara.jengo@ndogowater.gov | 36 Pwani Mchangani Road | Sokoto | Ilanga | Field Surveyor |

I picked up another bit we have to clean up. I discover that the `phone_number` column the phone numbers should be 12 characters long, consisting of the plus sign, area code (99), and the phone number digits. However, when we use the `LENGTH(column)` function, the below returns 13 characters, indicating there's an extra character.

```
 SELECT
 	LENGTH(phone_number)
 FROM
 	employee;
```

I Use TRIM() to write a SELECT query again:

```
SELECT
	TRIM(LENGTH('phone_number')) AS Trimmed_number
FROM
	md_water_services.employee;
```

I go ahead and UPDATE the `phone_number` column, use the following code line `SET SQL_SAFE_UPDATES = 0;` cause we need to let MYSQL server know that is safe for us to update the table:

```
UPDATE md_water_services.employee
SET phone_number = TRIM(phone_number);
```

>| assigned_employee_id | employee_name | phone_number | email, address | province_name | town_name | position |

>|0 | Amara Jengo | +99637993287 | amara.jengo@ndogowater.gov | 36 Pwani Mchangani Road | Sokoto | Ilanga | Field Surveyor |

2. ** Analysing locations**

Looking at the location table, let’s focus on the `province_name, town_name and location_type` to understand where the water sources are in Maji Ndogo.

I created a query that counts the number of records per town:

```
SELECT 
    town_name,
    COUNT(*) AS records_per_town
FROM 
    md_water_services.location
GROUP BY 
    town_name;
```

It gives the below table:

>| town_name | records_per_town|

>| Harare | 1650 |

>| Kintampo | 780 |

>| Lusaka | 1070 |

>| Rural | 23740 |

>| Abidjan | 400 |

>| Amina | 1090 |

Also counted the records per province:

```
SELECT 
    province_name,
    COUNT(*) AS records_per_province
FROM 
    md_water_services.location
GROUP BY 
    province_name;
```

>| province_name | records_per_province |

>| Akatsi | 8940 |

>| Amanzi | 6950 |

>| Hawassa | 6030 |

>| Kilimani | 9510 |

>| Sokoto | 8220 |

From this table, it's pretty clear that most of the water sources in the survey are situated in small rural communities, scattered across Maji Ndogo.  If we count the records for each province, most of them have a similar number of sources, so every province is well-represented in the survey.

 Finally, look at the number of records for each location type:

```
SELECT 
    location_type,
    COUNT(*) AS num_sources
FROM 
    md_water_services.location
GROUP BY 
    location_type
ORDER BY 
    num_sources DESC;
```

>| location_type | num_sources |

>| Rural | 23740 |

>| Urban | 15910 |

4. **Diving into the sources**

   Now we need to know the following through deeping more into the `water_source` table;

These are the questions that I am curious about.
 
 1. How many people did we survey in total?
 	
 2. How many wells, taps and rivers are there?
 
 3. How many people share particular types of water sources on average?
 
 4. How many people are getting water from each type of source?

1. How many people did we survey in total?

```
SELECT 
    SUM(number_of_people_served) AS total_people_served
FROM 
    md_water_services.water_source;
```

>| total_people_served |

>| 27628140 |

2. How many wells, taps and rivers are there?

```
SELECT 
    type_of_water_source,
    COUNT(*) AS number_of_sources
FROM 
    md_water_services.water_source
GROUP BY
	type_of_water_source;
```

>| type_of_water_source | number_of_sources |

>| tap_in_home | 7265 |

>| tap_in_home_broken | 5856 |

>| well | 17383 |

>| shared_tap | 5767 |

>| river | 3379 |

Which of those sources stands out? It is pretty clear that although there was a drought, water is still abundant in Maji Ndogo. This isn't just aninformative result, we will need these numbers to understand how much all of these repairs will cost. If we know how many taps we need to install, and we know how much it will cost to install them, we can calculate how much it will cost to solve the water crisis.

3. How many people share particular types of water sources on average?

```
SELECT 
    type_of_water_source,
    ROUND(AVG(number_of_people_served), 0) AS avg_people_per_source
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;
```

>| type_of_water_source | avg_people_per_source |

>| tap_in_home | 644 |

>| tap_in_home_broken | 649 |

>| well | 279 |

>| shared_tap | 2071 |

>| river | 699 |

These results are telling us that 644 people share a tap_in_home on average. Does that make sense?

The surveyors combined the data of many households together and added this as a single tap record, but each household actually has its own tap. In addition to this, there is an average of 6 people living in a home. So 6 people actually share 1 tap (not 644).
 
Calculating the average number of people served by a single instance of each water source type helps us understand the typical capacity or load on a single water source. This can help us decide which sources should be repaired or upgraded, based on the average impact of each upgrade. For example, wells don't seem to be a problem, as fewer people are sharing them.

On the other hand, 2000 share a single public tap on average! We saw some of the queue times last time, and now we can see why. So looking at these results, we probably should focus on improving shared taps first.

4. How many people are getting water from each type of source?

```
SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS population_served
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;
```

>| type_of_water_source | population_served |

>| tap_in_home | 4678880 |

>| tap_in_home_broken | 3799720 |

>| well | 4841724 |

>| shared_tap | 11945272 |

>| river | 2362544 |

It's a little hard to comprehend these numbers, but you can see that one of these is dominating. To make it a bit simpler to interpret, let's use percentages. First, we need the total number of citizens then use the result of that and divide each of the SUM(number_of_people_served) by that number, times 100, to get percentages.

```
SELECT 
    type_of_water_source,
    ROUND((SUM(number_of_people_served) / 27000000) * 100, 0) AS percentage_people_per_source
FROM 
    md_water_services.water_source
GROUP BY 
    type_of_water_source;
```

>| type_of_water_source | percentage_people_per_source |

>| tap_in_home | 17 |

>| tap_in_home_broken | 14 |

>| well | 18 |

>| shared_tap | 44 |

>| river | 9 |

44% of our people are using shared taps in their communities, and on average, we saw earlier, that 2000 people share one shared_tap.

By adding tap_in_home and tap_in_home_broken together, we see that 31% of people have water infrastructure installed in their homes, but 45% (14/31) of these taps are not working! This isn't the tap itself that is broken, but rather the infrastructure like treatment plants, reservoirs, pipes, and pumps that serve these homes that are broken.
18% of people are using wells. But only 4916 out of 17383 are clean = 28% (from last week).

5. **Start of a solution**
 	At some point, we will have to fix or improve all of the infrastructure, so we should start thinking about how we can make a data-driven decision how to do it. I think a simple approach is to fix the things that affect most people first. So let's write a query that ranks each type of source based on how many people in total use it. RANK() should tell you we are going to need a window function to do this, so let's think through the problem.

We will need the following columns:

- Type of sources

- Total people served grouped by the types

- A rank based on the total people served, grouped by the types

So use a window function on the `total_people_served` column, converting it into a rank.

But think about this: If someone has a tap in their home, they already have the best source available. Since we can’t do anything more to improve this, we should remove `tap_in_home` from the ranking before we continue.

>| type_of_water_source | total_people_served | rank_by_population |

>| shared_tap | 11945272 | 1 |

>| well | 4841724 | 2 |

>| tap_in_home | 4678880 | 3 |

>| tap_in_home_broken | 3799720 | 4 |

>| river | 2362544 | 5 |

Ok, so we should fix shared taps first, then wells, and so on. But the next question is, which shared taps or wells should be fixed first? We can use the same logic; the most used sources should really be fixed first.

So let's create a query to do this, and keep these requirements in mind:

	1. The sources within each type should be assigned a rank.
 
	2. Limit the results to only improvable sources.
 
	3. Think about how to partition, filter and order the results set.
 
	4. Order the results to see the top of the list.

```
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
```

>| source_id | type_of_water_source | number_of_people_served | priority_rank |

>|  AmRu14978224 | river | 400 | 3364 |

>| HaDj16848224 | river | 400 | 3364 |

>| AkRu06515224 | shared_tap | 200 | 5764 |

>| SoRu36937224 | shared_tap | 200 | 5764 |

By using `RANK()` teams doing the repairs can use the value of rank to measure how many they have fixed.

6. **Analysing queues**

Ok, this is the really big, and last table we'll look at this time. The analysis is going to be a bit tough, but the results will be worth it.

**A recap from last time:**

The `visits` table documented all of the visits our field surveyors made to each location. For most sources, one visit was enough, but if there were queues, they visited the location a couple of times to get a good idea of the time it took for people to queue for water. So we have the time that they collected the data, how many times the site was visited, and how long people had to queue for water.

Ok, these are some of the things I think are worth looking at:

	 1. How long did the survey take?
  
	 2. What is the average total queue time for water?
  
	 3. What is the average queue time on different days?
  
	 4. How can we communicate this information efficiently?

**Question 1:**

To calculate how long the survey took, we need to get the first and last dates (which functions can find the largest/smallest value), and subtract them. Remember with DateTime data, we can't just subtract the values. We have to use a function to get the difference in days.

```
SELECT 
    MIN(time_of_record) AS first_date,
    MAX(time_of_record) AS last_date,
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS survey_difference_in_days
FROM 
    md_water_services.visits;
```

>| first_date | last_date | survey_difference_in_days |

>| 2021-01-01 09:10:00 | 2023-07-14 13:53:00 | 924 |

**Question 2:**

Let's see how long people have to queue on average in Maji Ndogo. Keep in mind that many sources like taps_in_home have no queues. These are just recorded as 0 in the time_in_queue column, so when we calculate averages, we need to exclude those rows. Try using `NULLIF()` do to this.

```
SELECT 
    AVG(NULLIF(time_in_queue, 0)) AS avg_time_in_queue
FROM 
    md_water_services.visits;
```

>| avg_time_in_queue |

>| 123.2574 |

I should get a queue time of about 123 min. So on average, people take two hours to fetch water if they don't have a tap in their homes.

That may sound reasonable, but some days might have more people who need water, and only have time to go and collect some on certain days.

**Question 3:**

So let's look at the queue times aggregated across the different days of the week.

`DAY()` gives you the day of the month. It we want to aggregate data for each day of the week, we need to use another `DateTime` function, `DAYNAME(column)`. As the name suggests, it returns the day from a timestamp as a string. Using that on the `time_of_record` column will result in a column with day names, Monday, Tuesday, etc., from the timestamp.

To do this, we need to calculate the average queue time, grouped by day of the week. Remember to revise DateTime functions, and also think about how to present the results clearly.

```
SELECT 
    DAYNAME(time_of_record) AS day_of_week,
    ROUND(AVG(NULLIF(time_in_queue, 0)), 0) AS avg_time_in_queue
FROM 
    md_water_services.visits
GROUP BY 
    day_of_week
ORDER BY 
    FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```

>| day_of_week | avg_time_in_queue |

>| Monday | 137 |

>| Tuesday | 108 |

>| Wednesday | 97 |

>| Thursday | 105 |

>| Friday | 120 |

>| Saturday | 246 |

>| Sunday | 82 |

Wow, ok Saturdays have much longer queue times compared to the other days!

**Question 4:**

We can also look at what time during the day people collect water. 

```
SELECT 
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    COUNT(time_in_queue) AS avg_queue_time
FROM 
    md_water_services.visits
GROUP BY 
    hour_of_day
ORDER BY 
    hour_of_day;
```

>| hour_of_day | avg_queue_time |

>| 06:00 | 1528 |

>| 07:00 | 1592 |

>| 08:00 | 1620 |

>| 09:00 | 6555 |

>| 10:00 | 6502 |

>| 11:00 | 6517 |

>| 12:00 | 6463 |

>| 13:00 | 6648 |

>| 14:00 | 6576 |

>| 15:00 | 6420 |

>| 16:00 | 6494 |

>| 17:00 | 1574 |

>| 18:00 | 1620 |

>| 19:00 | 37 |

Can you see that mornings and evenings are the busiest? It looks like people collect water before and after work. Wouldn't it be nice to break down the queue times for each hour of each day? In a spreadsheet, we can just create a pivot table.

Pivot tables are not widely used in SQL, despite being useful for interpreting results. So there are no built-in functions to do this for us. Sometimes the dataset is just so massive that it is the only option.

For rows, we will use the hour of the day in that nice format, and then make each column a different day!

To filter a row we use `WHERE`, but using `CASE()` in `SELECT` can filter columns. We can use a `CASE()` function for each day to separate the queue time column into a column for each day. Let’s begin by only focusing on Sunday. So, when a row's `DAYNAME(time_of_record)` is Sunday, we make that value equal to `time_in_queue`, and `NULL` for any days.

We create separate columns for each day with a `CASE()` function.

```
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
```

>| hour_of_day | Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday |

>| 06:00 | 79 | 190 | 134 | 112 | 134 | 153 | 247 |

>| 07:00 | 82 | 186 | 128 | 111 | 139 | 156 | 247 |

>| 08:00 | 86 | 183 | 130 | 119 | 129 | 153 | 247 |

>| 09:00 | 84 | 127 | 105 | 94 | 99 | 107 | 252 |

>| 10:00 | 83 | 119 | 99 | 89 | 95 | 112 | 259 |

>| 11:00 | 78 | 115 | 102 | 86 | 99 | 104 | 236 |

>| 12:00 | 78 | 115 | 97 | 88 | 96 | 109 | 239 |

>| 13:00 | 81 | 122 | 97 | 98 | 101 | 115 | 242 |

>| 14:00 | 83 | 127 | 104 | 92 | 96 | 110 | 244 |

>| 15:00 | 83 | 126 | 104 | 88 | 92 | 110 | 248 |

>| 16:00 | 83 | 127 | 99 | 90 | 99 | 109 | 251 |

>| 17:00 | 79 | 181 | 135 | 121 | 129 | 151 | 251 |

>| 18:00 | 80 | 174 | 122 | 113 | 132 | 158 | 240 |

>| 19:00 | 127 | 159 | 145 | 176 | 137 | 103 | 282 |

**See if you can spot these patterns:**
 
 1. Queues are very long on a Monday morning and Monday evening as people rush to get water.
 
 2. Wednesday has the lowest queue times, but long queues on Wednesday evening.
 
 3. People have to queue pretty much twice as long on Saturdays compared to the weekdays. It looks like people spend their Saturdays queueing for water, perhaps for the week's supply?

 4. The shortest queues are on Sundays, and this is a cultural thing. The people of Maji Ndogo prioritise family and religion, so Sundays are spent with family and friends.

I built a pivot table in SQL! The thing I want you to remember today is: SQL is a set of tools we can apply. By understanding `CASE`, we could build a complex query that aggregates our data in a format that is very easy to understand.

To take it one step further, I made a graph! If you copy the pivot table into a spreadsheet, you can too.

![Graph_for_queue_time_maji](https://github.com/user-attachments/assets/3e655e33-bf03-44a4-af07-c3344ca74401)

The colors represent the hours of the day, and each bar is the average queue time, for that specific hour and day.

# Water Accessibility and infrastructure summary report

This survey aimed to identify the water sources people use and determine both the total and average number of users for each source.

Additionally, it examined the duration citizens typically spend in queues to access water.

So let's create a short summary report we can for **Maji_Ndogo**.

# Insights

 1. Most water sources are rural.
 
 2. 44% of our people are using shared taps. 2000 people often share one tap.
 
 3. 31% of our population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes, pumps, and reservoirs.
 
 4. 18% of our people are using wells of which, but within that, only 28% are clean..
 
 5. Our citizens often face long wait times for water, averaging more than 120 minutes.
 
 6. In terms of queues:

    - Queues are very long on Saturdays.

    - Queues are longer in the mornings and evenings.

    - Wednesdays and Sundays have the shortest queues

 # Start of our plan
 
 **We have started thinking about a plan:**
 
 1. We want to focus our efforts on improving the water sources that affect the most people.

    - Most people will benefit if we improve the shared taps first.

    - Wells are a good source of water, but many are contaminated. Fixing this will benefit a lot of people.

    - Fixing existing infrastructure will help many people. If they have running water again, they won't have to queue, thereby shorting queue times for others. So we can solve two problems at once.
	
 	- Installing taps in homes will stretch our resources too thin, so for now, if the queue times are low, we won't improve that source.

2. Most water sources are in rural areas. We need to ensure our teams know this as this means they will have to make these repairs/upgrades in rural areas where road conditions, supplies, and labour are harder challenges to overcome.

# Conclusion

**Practical Solutions**

1. If communities are using **rivers**, we can dispatch trucks to those regions to provide water temporarily in the short term, while we send out crews to drill for wells, providing a more permanent solution.

2. If communities are using **wells**, we can install filters to purify the water. For wells with **biological contamination**, we can **install UV filters** that kill microorganisms, and for _polluted wells_, we can install **reverse osmosis filters**. In the long term, we need to figure out why these sources are polluted.

3. For **shared taps**, in the short term, we can send additional water tankers to the busiest taps, on the busiest days. We can use the queue time pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on **installing extra taps** where they are needed. According to UN standards, the maximum acceptable wait time for water is **30 minutes**. With this in mind, our aim is to install taps to get **queue times below 30 min**.

4. **Shared taps** with **short queue times (< 30 min)** represent a logistical challenge to further reduce waiting times. The most effective solution, installing taps in homes, is **resource-intensive** and better suited as a **long-term goal**.

5. **Addressing broken infrastructure** offers a significant impact even with just a single intervention. It is expensive to fix, but so many people can benefit from repairing one facility. For example, fixing a **reservoir or pipe** that multiple taps are connected to. We will have to find the commonly affected areas though to see where the problem actually is.






