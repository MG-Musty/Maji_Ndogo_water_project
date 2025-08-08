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


