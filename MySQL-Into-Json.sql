# sql statements to convert needed tables from sakila database into json files, manually coppied json files from uploads folder into project-1 data folder
# removed address and last update columns as they are not relevant to the rental star schema

SET session group_concat_max_len=15000000;

SELECT
	CONCAT("[",
		GROUP_CONCAT(
			CONCAT('{"customer_id" : ',customer_id,','),
            CONCAT('"store_id" : ',store_id,','),
            CONCAT('"first_name" : "',first_name,'",'),
            CONCAT('"last_name" : "',last_name,'",'),
            CONCAT('"email" : "',email,'",'),
            CONCAT('"active" : ',`active`,','),
            CONCAT('"create_date" : "',create_date,'"}')
		),
	"]")
AS json FROM sakila.customer
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_customer.json';

SELECT
	CONCAT("[",
		GROUP_CONCAT(
			CONCAT('{"film_id" : ',film_id,','),
            CONCAT('"title" : "',title,'",'),
            CONCAT('"description" : "',`description`,'",'),
            CONCAT('"release_year" : ',release_year,','),
            CONCAT('"rental_duration" : ',rental_duration,','),
            CONCAT('"rental_rate" : ',rental_rate,','),
            CONCAT('"length" : ',length,','),
            CONCAT('"replacement_cost" : ',replacement_cost,','),
            CONCAT('"rating" : "',rating,'",'),
            CONCAT('"special_features" : "',special_features,'",'),
            CONCAT('"language" : "',`language`,'"}')
		),
	"]")
AS json FROM sakila.films
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_films.json';

SELECT
	CONCAT("[",
		GROUP_CONCAT(
			CONCAT('{"rental_id" : ',rental_id,','),
            CONCAT('"rental_date" : "',rental_date,'",'),
            CONCAT('"renting_customer" : ',renting_customer,','),
            CONCAT('"return_date" : "',return_date,'",'),
            CONCAT('"rental_staff" : ',rental_staff,','),
            CONCAT('"film_id" : ',film_id,','),
            CONCAT('"store_id" : ',store_id,','),
            CONCAT('"paying_customer" : ',paying_customer,','),
            CONCAT('"cashier" : ',cashier,','),
            CONCAT('"amount" : ',amount,','),
            CONCAT('"payment_date" : "',payment_date,'"}')
		),
	"]")
AS json FROM sakila.rentals
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_rentals.json';

SELECT
	CONCAT("[",
		GROUP_CONCAT(
			CONCAT('{"staff_id" : ',staff_id,','),
            CONCAT('"first_name" : "',first_name,'",'),
            CONCAT('"last_name" : "',last_name,'",'),
            CONCAT('"email" : "',email,'",'),
            CONCAT('"store_id" : ',store_id,','),
            CONCAT('"active" : ',`active`,','),
            CONCAT('"username" : "',username,'",'),
            CONCAT('"password" : "',`password`,'"}')
		),
	"]")
AS json FROM sakila.staff
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_staff.json';

SELECT
	CONCAT("[",
		GROUP_CONCAT(
			CONCAT('{"store_id" : ',store_id,','),
            CONCAT('"manager_staff_id" : ',manager_staff_id,'}')
		),
	"]")
AS json FROM sakila.store
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_store.json';