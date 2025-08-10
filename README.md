# Maji_Ndogo_water_project_part_1

Maji_Ndogo water project is a water project of a small nation that is face with water scarcity, uncleaned water, contaminated water. In this project we will be looking on how to solve and provide very insightful decision for the nation, which will deliver a permanent solution through  a database of 60,000 records, meticulously collected by the devoted team of engineers, field workers, scientists, and analysts.

In this project I exhibited my `SQL (Structure Query Language)` skills creating a MYSQL database server using open source software for MySql, and I was able to `import, retrieve, manipulate, wrangling and creating ERD (Entity Relational Diagram)` with all of this some great insight for this project was achieved.

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

# Maji_Ndogo_water_project_part_1

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

 






