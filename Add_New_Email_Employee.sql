/*
I have to update the database again with these email addresses, so before we do, let's use a SELECT query to get the format right, then use UPDATE and SET to make the changes.
First up, let's remove the space between the first and last names using REPLACE().
Then we can use LOWER() with the result we just got. Now the name part is correct.
We then use CONCAT() to add the rest of the email address:
*/

SELECT
	*,
	CONCAT(
	LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov') AS new_email
FROM
	md_water_services.employee;