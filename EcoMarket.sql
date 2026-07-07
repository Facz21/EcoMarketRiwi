-- DDL Data base creation scripts 


CREATE DATABASE andres_cortes_esthercita;

USE andres_cortes_esthercita;

-- 1.  Create table: eco_categories
CREATE TABLE eco_categories (
    eco_category_id INT NOT NULL,
    eco_category_name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (eco_category_id)
);

-- 2.  Create table: eco_distribution_centers
CREATE TABLE eco_distribution_centers (
    eco_center_id INT NOT NULL,
    eco_center_name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (eco_center_id)
);

-- 3.  Create table: eco_cities
CREATE TABLE eco_cities (
    eco_city_id INT NOT NULL,
    eco_city_name VARCHAR(100) NOT NULL UNIQUE,
    eco_center_id INT NOT NULL,
    PRIMARY KEY (eco_city_id),
    CONSTRAINT fk_cities_distribution_centers
        FOREIGN KEY (eco_center_id) REFERENCES eco_distribution_centers(eco_center_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4.  Create table: eco_clients
CREATE TABLE eco_clients (
    eco_client_id INT NOT NULL,
    eco_client_name VARCHAR(100) NOT NULL,
    eco_city_id INT NOT NULL,
    PRIMARY KEY (eco_client_id),
    CONSTRAINT fk_clients_cities
        FOREIGN KEY (eco_city_id) REFERENCES eco_cities(eco_city_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_client_city UNIQUE (eco_client_name, eco_city_id)
)  ;

-- 5.  Create table: eco_products
CREATE TABLE eco_products (
    eco_product_id INT NOT NULL,
    eco_product_name VARCHAR(100) NOT NULL UNIQUE,
    eco_unit_price DECIMAL(10, 2) NOT NULL,
    eco_category_id INT NOT NULL,
    eco_current_stock INT NOT NULL,
    PRIMARY KEY (eco_product_id),
    CONSTRAINT fk_products_categories
        FOREIGN KEY (eco_category_id) REFERENCES eco_categories(eco_category_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6.  Create table: eco_orders
CREATE TABLE eco_orders (
    eco_order_id INT NOT NULL,
    eco_order_date DATE NOT NULL,
    eco_client_id INT NOT NULL,
    eco_product_id INT NOT NULL,
    eco_quantity INT NOT NULL,
    PRIMARY KEY (eco_order_id),
    CONSTRAINT fk_orders_clients
        FOREIGN KEY (eco_client_id) REFERENCES eco_clients(eco_client_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orders_products
        FOREIGN KEY (eco_product_id) REFERENCES eco_products(eco_product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
--  -----------------------------------------------------------------------------------------------------------------


-- DML Population Scripts
 
-- Populate eco_categories
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (1, 'Dairy');
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (2, 'Fruits');
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (3, 'Grains');
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (4, 'Meat');
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (5, 'Oils');
INSERT INTO eco_categories (eco_category_id, eco_category_name) VALUES (6, 'Vegetables');


-- Populate eco_distribution_centers
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (1, 'Center North');
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (2, 'Center West');
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (3, 'Coast DC');
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (4, 'Coffee DC');
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (5, 'East Hub');
INSERT INTO eco_distribution_centers (eco_center_id, eco_center_name) VALUES (6, 'South Hub');

-- Populate eco_cities
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (1, 'Barranquilla', 3);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (2, 'Bogotá', 1);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (3, 'Bucaramanga', 5);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (4, 'Cali', 6);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (5, 'Cartagena', 3);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (6, 'Cúcuta', 5);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (7, 'Manizales', 4);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (8, 'Medellín', 2);
INSERT INTO eco_cities (eco_city_id, eco_city_name, eco_center_id) VALUES (9, 'Pereira', 4);

-- Populate eco_clients
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (1, 'EcoStore', 5);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (2, 'FoodPlus', 7);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (3, 'FreshMart', 8);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (4, 'GreenBuy', 2);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (5, 'MarketOne', 3);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (6, 'MiniShop', 4);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (7, 'QuickFood', 6);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (8, 'RetailCo', 9);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (9, 'SuperMax', 1);
INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id) VALUES (10, 'SuperMax', 2);

-- Populate eco_products
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (1, 'Apple Gala', 2, 2.5, 95);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (2, 'Banana', 2, 1.2, 165);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (3, 'Whole Milk', 1, 3.8, 52);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (4, 'Chicken Breast', 4, 6.5, 60);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (5, 'Rice 1kg', 3, 2.0, 182);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (6, 'Extra Virgin Olive Oil', 5, 8.9, 36);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (7, 'Eggs x12', 1, 4.2, 81);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (8, 'Tomato', 6, 1.8, 104);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (9, 'Iceberg Lettuce', 6, 1.1, 43);
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_category_id, eco_unit_price, eco_current_stock) VALUES (10, 'Spaghetti', 3, 2.3, 127);

-- Populate eco_orders
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1001, '2026-05-01', 10, 1, 10);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1002, '2026-05-02', 10, 1, 5);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1003, '2026-05-02', 3, 2, 20);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1004, '2026-05-03', 3, 2, 15);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1005, '2026-05-04', 6, 3, 12);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1006, '2026-05-05', 6, 3, 8);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1007, '2026-05-06', 9, 4, 25);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1008, '2026-05-07', 9, 4, 10);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1009, '2026-05-08', 1, 5, 30);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1010, '2026-05-09', 1, 5, 18);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1011, '2026-05-10', 5, 6, 6);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1012, '2026-05-11', 5, 6, 4);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1013, '2026-05-12', 8, 7, 14);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1014, '2026-05-13', 8, 7, 9);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1015, '2026-05-14', 2, 8, 22);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1016, '2026-05-15', 2, 8, 16);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1017, '2026-05-16', 4, 9, 11);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1018, '2026-05-17', 4, 9, 7);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1019, '2026-05-18', 7, 10, 19);
INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity) VALUES (1020, '2026-05-19', 7, 10, 13);


-- DQL section business needs
-- -----------------------------------------------------------------------------------------------------------------

-- Query #1: Available stock per product
-- Business need:
-- As the head of procurement, I need to know current stock levels to plan new purchases.

SELECT 
    p.eco_product_id AS id,
    p.eco_product_name AS product,
    c.eco_category_name AS category,
    p.eco_current_stock AS stock
FROM 
    eco_products p
JOIN 
    eco_categories c ON p.eco_category_id = c.eco_category_id
ORDER BY 
    p.eco_current_stock DESC, 
    p.eco_product_name ASC;

-- Query 2: Order history by city
-- Business need:
-- As Sales Director, I need to know which cities generate the highest volume of orders.

SELECT 
    ci.eco_city_name AS ciudad,
    COUNT(DISTINCT o.eco_order_id) AS total_pedidos,
    SUM(o.eco_quantity) AS total_unidades_solicitadas
FROM 
    eco_cities ci
JOIN 
    eco_clients cl ON ci.eco_city_id = cl.eco_city_id
JOIN 
    eco_orders o ON cl.eco_client_id = o.eco_client_id
GROUP BY 
    ci.eco_city_id, 
    ci.eco_city_name
ORDER BY 
    total_pedidos DESC, 
    total_unidades_solicitadas DESC;
    
-- Query 3: Total sales by category
-- Business need:
-- As a financial manager, I need to identify which categories generate the highest revenue.

SELECT 
    c.eco_category_name AS category,
    COUNT(o.eco_order_id) AS sales_volume,
    SUM(o.eco_quantity) AS units_sold,
    SUM(o.eco_quantity * p.eco_unit_price) AS total_revenue
FROM 
    eco_categories c
JOIN 
    eco_products p ON c.eco_category_id = p.eco_category_id
JOIN 
    eco_orders o ON p.eco_product_id = o.eco_product_id
GROUP BY 
    c.eco_category_id, 
    c.eco_category_name
ORDER BY 
    total_revenue DESC;
    
-- Query 4: Products with low inventory
-- Business need:
-- As a logistics coordinator, I need to know which products are running low on stock.

SELECT 
    p.eco_product_id AS id,
    p.eco_product_name AS product,
    c.eco_category_name AS category,
    p.eco_current_stock AS stock
FROM 
    eco_products p
JOIN 
    eco_categories c ON p.eco_category_id = c.eco_category_id
ORDER BY 
    p.eco_current_stock ASC;
    
-- Query 5: Customers with the highest number of orders
-- Business need:
-- As Sales Director, I need to identify the most active customers.

SELECT 
    cl.eco_client_id AS id,
    cl.eco_client_name AS client,
    ci.eco_city_name AS city,
    COUNT(o.eco_order_id) AS total_orders,
    SUM(o.eco_quantity) AS total_units_purchased
FROM 
    eco_clients cl
JOIN 
    eco_cities ci ON cl.eco_city_id = ci.eco_city_id
JOIN 
    eco_orders o ON cl.eco_client_id = o.eco_client_id
GROUP BY 
    cl.eco_client_id, 
    cl.eco_client_name, 
    ci.eco_city_name
ORDER BY 
    total_orders DESC, 
    total_units_purchased DESC;
    
-- Query 6: Economic value of inventory by distribution center
-- Business need:
-- As General Manager, I need to know the value of the inventory stored at each logistics center.

SELECT 
    dc.eco_center_name AS distribution_center,
    SUM(p.eco_current_stock * p.eco_unit_price) AS economic_value_of_inventory
FROM (
	-- Subquery to uniquely map each product to a logistics center
    -- based on customer order history.
    SELECT DISTINCT 
        o.eco_product_id, 
        ci.eco_center_id
    FROM 
        eco_orders o
    JOIN 
        eco_clients cl ON o.eco_client_id = cl.eco_client_id
    JOIN 
        eco_cities ci ON cl.eco_city_id = ci.eco_city_id
) prod_dc
JOIN 
    eco_distribution_centers dc ON prod_dc.eco_center_id = dc.eco_center_id
JOIN 
    eco_products p ON prod_dc.eco_product_id = p.eco_product_id
GROUP BY 
    dc.eco_center_id, 
    dc.eco_center_name
ORDER BY 
    economic_value_of_inventory DESC;
    
    
-- SCRIPTS DML (DATA MANIPULATION LANGUAGE)

-- 1. INSERT OPERATIONS

--  -----------------------------------------------------------------------------------------------------------------

-- A. Insert a new product
-- Register a new item in the "Dairy" category (ID 1) with initial stock
INSERT INTO eco_products (eco_product_id, eco_product_name, eco_unit_price, eco_category_id, eco_current_stock)
VALUES (11, 'Greek Yogurt 500g', 3.49, 1, 120);


-- B. Register a new customer
-- Create a customer in the city of Medellín (ID 8)

INSERT INTO eco_clients (eco_client_id, eco_client_name, eco_city_id)
VALUES (11, 'BioStore Medellín', 8);

-- C. Register a new order
-- Create an order for the newly created customer for the new product

INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity)
VALUES (1021, '2026-07-06', 11, 11, 15);

-- 2. UPDATE OPERATIONS
-- -----------------------------------------------------------------------------------------------------------------

-- A. Update the unit price of a product
-- Increases or sets a new price for a product (e.g., Apple Gala)
UPDATE eco_products
SET eco_unit_price = 2.80
WHERE eco_product_id = 1;

-- B. Inventory replenishment (Increase stock)
-- Registers the arrival of goods by adding stock to the current inventory
UPDATE eco_products
SET eco_current_stock = eco_current_stock + 150
WHERE eco_product_id = 5;

-- C. Deduct stock for sale/order placed
-- Deducts stock when a sale is executed, ensuring it does not become negative
UPDATE eco_products
SET eco_current_stock = eco_current_stock - 15
WHERE eco_product_id = 11 AND eco_current_stock >= 15;

-- 3. DELETE OPERATIONS
-- -----------------------------------------------------------------------------------------------------------------


-- A. Cancel/Delete an order
-- Deletes a specific order from the system
DELETE FROM eco_orders
WHERE eco_order_id = 1021;

-- B. Delete an inactive client
-- Removes a client from the system only if they do not have any order history
DELETE FROM eco_clients
WHERE eco_client_id = 11
  AND eco_client_id NOT IN (SELECT DISTINCT eco_client_id FROM eco_orders);