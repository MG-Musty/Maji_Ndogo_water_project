/*
I go ahead and UPDATE the email column this time with the email addresses.
Fisrt we have to add the following code line SET SQL_SAFE_UPDATES = 0; cause we need to let MYSQL server know that is safe for us to update the table:
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE md_water_services.employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov')