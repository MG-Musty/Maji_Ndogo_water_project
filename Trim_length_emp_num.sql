-- I Use TRIM() to write a SELECT query again:

SELECT
	TRIM(LENGTH('phone_number')) AS Trimmed_number
FROM
	md_water_services.employee;