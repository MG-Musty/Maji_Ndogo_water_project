/*
I go ahead and UPDATE the phone_number column, use the following code line SET SQL_SAFE_UPDATES = 0; 
cause we need to let MYSQL server know that is safe for us to update the table:
*/

UPDATE md_water_services.employee
SET phone_number = TRIM(phone_number);