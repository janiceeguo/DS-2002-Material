# SQL statements to export some dimension tables into a csv file with separate columns for each field as MySQL's csv export wizard combines all columns into one column
# directly removed 'address_id' and 'last_update' from all tables, also removed 'picture' from staff table
# manually coppied csv files from uploads folder into data folder under project as MySQL Workbench runs with secure file privileges

SELECT 'store_id', 'manager_staff_id'
UNION
SELECT store_id, manager_staff_id
FROM sakila.store INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_store.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT 'staff_id', 'first_name', 'last_name', 'email', 'store_id', 'active', 'username', 'password'
UNION
SELECT staff_id, first_name, last_name, email, store_id, active, username, password
FROM sakila.staff INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_staff.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT 'customer_id', 'store_id', 'first_name', 'last_name', 'email', 'active'
UNION
SELECT customer_id, store_id, first_name, last_name, email, active
FROM sakila.customer INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sakila_customer.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
