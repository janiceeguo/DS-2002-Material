# sql statements to create the film dimension table and rental fact table

# join with language
CREATE TABLE sakila.films AS
	SELECT f.*,	l.name AS language
		FROM sakila.film f
		LEFT JOIN sakila.language l
		ON f.language_id = l.language_id
	UNION
	SELECT fl.*, ol.name AS orignial_language
		FROM sakila.film fl
		LEFT JOIN sakila.language ol
		ON fl.original_language_id = ol.language_id;

# removing redundant and null columns
ALTER TABLE sakila.films
	DROP COLUMN language_id,
    DROP COLUMN original_language_id,
    DROP COLUMN last_update;

# full join with inventory
CREATE TABLE sakila.rental_inventory AS
	SELECT r.*
		, i.film_id
        , i.store_id
		FROM sakila.rental r
		LEFT JOIN sakila.inventory i
		ON r.inventory_id = i.inventory_id
	UNION
	SELECT r.*
		, i.film_id
        , i.store_id
		FROM sakila.rental r
		RIGHT JOIN sakila.inventory i
		ON r.inventory_id = i.inventory_id;

# full join with payment        
CREATE TABLE sakila.rentals AS
	SELECT ri.*
		, p.customer_id AS paying_customer
		, p.staff_id AS cashier
		, p.amount
		, p.payment_date
		FROM sakila.rental_inventory ri
		LEFT JOIN sakila.payment p
		ON ri.rental_id = p.rental_id
	UNION
	SELECT ri.*
		, p.customer_id AS paying_customer
		, p.staff_id AS cashier
		, p.amount
		, p.payment_date
		FROM sakila.rental_inventory ri
		RIGHT JOIN sakila.payment p
		ON ri.rental_id = p.rental_id;

# removing redundant columns and renaming for clarity   
ALTER TABLE sakila.rentals
	DROP COLUMN inventory_id,
    DROP COLUMN last_update,
    RENAME COLUMN customer_id TO renting_customer,
    RENAME COLUMN staff_id TO rental_staff;