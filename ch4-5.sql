CREATE DATABASE db_kalbe;
USE db_kalbe;

-- CHALLENGE 3
CREATE TABLE karyawan (
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	sex VARCHAR(20) NOT NULL,
	income INT NOT NULL
) ENGINE=InnoDB;

DESCRIBE karyawan;

SELECT * FROM karyawan;


-- CHALLENGE 4
CREATE TABLE inventory (
 	item_code INT PRIMARY KEY,
 	item_name VARCHAR(50) NOT NULL,
 	item_price INT NOT NULL,
 	item_total INT NOT NULL 
 )ENGINE=InnoDB;

INSERT INTO inventory (item_code, item_name, item_price, item_total)
VALUES (2341, "Promag Tablet", 3000, 100),
	   (2342, "Hydro Coco 250ML", 7000, 20),
	   (2343, "Nutrive Benecol 100ML", 20000, 30),
	   (2344, "Blackmores Vit C 500Mg", 95000, 45),
	   (2345, "Entrasol Gold 370G", 90000, 120);

SELECT * FROM inventory;

-- Show the item_name that has the highest number in item_total
SELECT item_name
FROM inventory
WHERE item_total = (
	SELECT max(item_total) AS total
	FROM inventory
);

-- Update the item_price of the output of question bullet
CREATE TEMPORARY TABLE temp_item_price_update AS
SELECT item_name
FROM inventory
WHERE item_total = (
	SELECT max(item_total) AS total
	FROM inventory
);

SELECT * FROM temp_item_price_update;

UPDATE inventory
SET item_price = item_price + 10000
WHERE item_name IN (SELECT * FROM temp_item_price_update);

SELECT * FROM inventory;

DROP TABLE temp_item_price_update;

-- What will happen if we insert another item_name with item_code of 2343 into the table
INSERT INTO inventory (item_code, item_name, item_price, item_total)
VALUES (2343, "Chimory", 8000, 50);

-- Delete the item_name that has the lowest number of item_total	
CREATE TEMPORARY TABLE temp_item_name_delete AS
SELECT item_name
FROM inventory
WHERE item_total = (
	SELECT MIN(item_total) AS total
	FROM inventory
);

DELETE FROM inventory
WHERE item_name IN (SELECT item_name FROM temp_item_name_delete);

SELECT * FROM inventory;

DROP TABLE temp_item_name_delete;


-- CHALLENGE 5
CREATE TABLE customer_orders (
	order_no VARCHAR(15) NOT NULL,
	purchase_amount INT NOT NULL,
	order_date DATE NOT NULL,
	customer_id VARCHAR(15) NOT NULL,
	salesman_id VARCHAR(15) NOT NULL
) ENGINE=InnoDB;

INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id)
VALUES (10001, 150, '2022-10-05', 2005, 3002),
	   (10009, 279, '2022-09-10', 2001, 3005),
	   (10002, 65, '2022-10-05', 2002, 3001),
	   (10004, 110, '2022-08-17', 2009, 3003),
	   (10007, 948, '2022-09-10', 2005, 3002),
	   (10005, 2400, '2022-07-27', 2007, 3001);

SELECT * FROM customer_orders
WHERE purchase_amount < 100 OR order_date >= '2022-08-25' AND customer_id > 2001;
