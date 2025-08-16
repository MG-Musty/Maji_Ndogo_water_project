/*
I picked up another bit we have to clean up. 
I discover that the phone_number column the phone numbers should be 12 characters long, consisting of the plus sign, area code (99), and the phone number digits. 
However, when we use the LENGTH(column) function, the below returns 13 characters, indicating there's an extra character.
*/

 SELECT
 	LENGTH(phone_number)
 FROM
 	employee;