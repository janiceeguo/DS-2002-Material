# SQL statements to export some dimension tables into a csv file with separate columns for each field as MySQL's csv export wizard combines all columns into one column
# manually coppied csv files from uploads folder into data folder under project as MySQL Workbench runs with secure file privileges

SELECT 'store_key', 'manager_staff_key'
UNION
SELECT store_key, manager_staff_key
FROM sakila_dw.dim_stores INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sakila_DimStores.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT 'staff_key', 'first_name', 'last_name', 'email', 'store_key', 'active', 'username', 'password'
UNION
SELECT staff_key, first_name, last_name, email, store_key, active, username, password
FROM sakila_dw.dim_staff INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sakila_DimStaff.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT 'customer_key', 'store_key', 'first_name', 'last_name', 'email', 'active'
UNION
SELECT customer_key, store_key, first_name, last_name, email, active
FROM sakila_dw.dim_customers INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sakila_DimCustomers.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
