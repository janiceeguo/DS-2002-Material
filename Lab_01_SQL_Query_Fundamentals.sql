-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table?
-- ------------------------------------------------------------------
SELECT COUNT(*) AS Num_Products FROM northwind.products;

-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------
SELECT product_name 
	, quantity_per_unit 
FROM northwind.products;

-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------
SELECT id AS product_id
	, product_name 
FROM northwind.products
WHERE discontinued <> 1;

-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT id AS product_id
	, product_name 
FROM northwind.products
WHERE discontinued <> 0;

-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------
SELECT product_name
	, list_price
FROM northwind.products
WHERE list_price IN 
	((SELECT MIN(list_price) FROM northwind.products)
    , (SELECT MAX(list_price) FROM northwind.products));

-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
-- ------------------------------------------------------------------
SELECT id AS product_id
	, product_name
	, list_price
FROM northwind.products
WHERE list_price < 20;

-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------
SELECT id AS product_id
	, product_name
	, list_price
FROM northwind.products
WHERE list_price > 15 AND list_price < 20;

-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name
	, list_price
FROM northwind.products
WHERE list_price > (SELECT AVG(list_price) FROM northwind.products);

-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products 
-- ------------------------------------------------------------------
SELECT product_name
	, list_price
FROM northwind.products
ORDER BY list_price DESC 
LIMIT 10;

-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
SELECT COUNT(IF(discontinued = 0, 1, NULL)) AS current_count
	, COUNT(IF(discontinued = 1, 1, NULL)) AS discontinued_count
FROM northwind.products;

-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------
SELECT products.product_name
	, reorder_level AS units_in_stock
    , target_level AS units_on_order
FROM northwind.products
WHERE reorder_level < target_level;

-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------
SELECT products.*
	, suppliers.company AS supplier_company
    , suppliers.address AS supplier_address
    , suppliers.city AS supplier_city
    , suppliers.state_province AS supplier_state_province
    , suppliers.zip_postal_code AS supplier_zip_postal_code
FROM northwind.products
INNER JOIN northwind.suppliers ON products.supplier_ids = suppliers.id;

-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------
SELECT category
	, COUNT(*) AS units
FROM northwind.products
GROUP BY category
HAVING COUNT(*) < 5;


-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00
-- ------------------------------------------------------------------
SELECT category
	, COUNT(*) AS count_less_than_20
FROM northwind.products
WHERE list_price < 20
GROUP BY category;