-- Create the database
CREATE DATABASE StoreDatabase;

-- Use the database
USE StoreDatabase;

-- Create the "Categories" table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Create the "Goods" table
CREATE TABLE Goods (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create the "Firms" table
CREATE TABLE Firms (
    firm_id INT AUTO_INCREMENT PRIMARY KEY,
    firm_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);
-- Create the "Products received" table
CREATE TABLE ProductsReceived (
    received_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    received_date DATE NOT NULL,
    quantity_received INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (product_id) REFERENCES Goods(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Firms(firm_id)
);
-- Create the "Customers" table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);
-- Create the "Products sold" table
CREATE TABLE ProductsSold (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL,
    customer_id INT,
    FOREIGN KEY (product_id) REFERENCES Goods(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the "Orders" table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the "Sellers" table
CREATE TABLE Sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255),
    role VARCHAR(50)
);

INSERT INTO Categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances'),
    ('Toys'),
    ('Books'),
    ('Furniture'),
    ('Sports'),
    ('Jewelry'),
    ('Food'),
    ('Shoes'),
    ('Beauty'),
    ('Health'),
    ('Gaming'),
    ('Art'),
    ('Music');

-- Insert sample data into the "Firms" table
INSERT INTO Firms (firm_name, contact_info) VALUES
    ('Supplier A', 'supplierA@example.com'),
    ('Supplier B', 'supplierB@example.com'),
    ('Supplier C', 'supplierC@example.com'),
    ('Supplier D', 'supplierD@example.com'),
    ('Supplier E', 'supplierE@example.com'),
    ('Supplier F', 'supplierF@example.com'),
    ('Supplier G', 'supplierG@example.com'),
    ('Supplier H', 'supplierH@example.com'),
    ('Supplier I', 'supplierI@example.com'),
    ('Supplier J', 'supplierJ@example.com'),
    ('Supplier K', 'supplierK@example.com'),
    ('Supplier L', 'supplierL@example.com'),
    ('Supplier M', 'supplierM@example.com'),
    ('Supplier N', 'supplierN@example.com'),
    ('Supplier O', 'supplierO@example.com');

-- Insert sample data into the "Goods" table
INSERT INTO Goods (product_name, price, quantity_in_stock, category_id) VALUES
    ('Smartphone', 499.99, 100, 1),
    ('Laptop', 899.99, 50, 1),
    ('T-shirt', 19.99, 200, 2),
    ('Refrigerator', 699.99, 30, 3),
    ('Harry Potter Book', 12.99, 150, 5),
    ('Sofa', 799.99, 20, 6),
    ('Soccer Ball', 9.99, 100, 7),
    ('Diamond Necklace', 1999.99, 10, 8),
    ('Chocolate Bar', 1.99, 500, 9),
    ('Running Shoes', 59.99, 80, 10),
    ('Lipstick', 14.99, 120, 11),
    ('Vitamin C Supplements', 9.99, 200, 12),
    ('Gaming Console', 299.99, 30, 13),
    ('Canvas Painting', 199.99, 15, 14),
    ('CD Album', 9.99, 300, 15);

-- Insert sample data into the "Customers" table
INSERT INTO Customers (customer_name, contact_info) VALUES
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Davis', 'bob@example.com'),
    ('Charlie Smith', 'charlie@example.com'),
    ('David Lee', 'david@example.com'),
    ('Eve Wilson', 'eve@example.com'),
    ('Frank Martin', 'frank@example.com'),
    ('Grace White', 'grace@example.com'),
    ('Hannah Brown', 'hannah@example.com'),
    ('Isabella Hall', 'isabella@example.com'),
    ('Jack Taylor', 'jack@example.com'),
    ('Liam Moore', 'liam@example.com'),
    ('Mia Harris', 'mia@example.com'),
    ('Noah Anderson', 'noah@example.com'),
    ('Olivia Jackson', 'olivia@example.com'),
    ('Sophia Turner', 'sophia@example.com');

-- Insert sample data into the "Sellers" table
INSERT INTO Sellers (seller_name, contact_info, role) VALUES
    ('John Doe', 'john.doe@example.com', 'Sales Associate'),
    ('Jane Smith', 'jane.smith@example.com', 'Store Manager'),
    ('Mike Johnson', 'mike.johnson@example.com', 'Cashier'),
    ('Emily Wilson', 'emily.wilson@example.com', 'Sales Associate'),
    ('Daniel Brown', 'daniel.brown@example.com', 'Store Manager'),
    ('Olivia Miller', 'olivia.miller@example.com', 'Cashier'),
    ('William Taylor', 'william.taylor@example.com', 'Sales Associate'),
    ('Sophia Anderson', 'sophia.anderson@example.com', 'Store Manager'),
    ('Logan Martin', 'logan.martin@example.com', 'Cashier'),
    ('Ava Harris', 'ava.harris@example.com', 'Sales Associate'),
    ('Mason Lee', 'mason.lee@example.com', 'Store Manager'),
    ('Harper Hall', 'harper.hall@example.com', 'Cashier'),
    ('Henry Davis', 'henry.davis@example.com', 'Sales Associate'),
    ('Ella White', 'ella.white@example.com', 'Store Manager'),
    ('Alexander Moore', 'alexander.moore@example.com', 'Cashier');

-- Insert sample data into the "Orders" table
INSERT INTO Orders (order_date, order_status, customer_id) VALUES
    ('2023-10-01', 'Shipped', 1),
    ('2023-10-02', 'Pending', 2),
    ('2023-10-03', 'Shipped', 3),
    ('2023-10-04', 'Delivered', 4),
    ('2023-10-05', 'Pending', 5),
    ('2023-10-06', 'Shipped', 6),
    ('2023-10-07', 'Delivered', 7),
    ('2023-10-08', 'Shipped', 8),
    ('2023-10-09', 'Pending', 9),
    ('2023-10-10', 'Shipped', 10),
    ('2023-10-11', 'Delivered', 11),
    ('2023-10-12', 'Pending', 12),
    ('2023-10-13', 'Shipped', 13),
    ('2023-10-14', 'Delivered', 14),
    ('2023-10-15', 'Shipped', 15);
    
INSERT INTO ProductsSold (product_id, sale_date, quantity_sold, customer_id) VALUES
    (1, '2023-10-01', 2, 1),
    (3, '2023-10-01', 5, 2),
    (2, '2023-10-02', 1, 3),
    (4, '2023-10-03', 3, 4),
    (5, '2023-10-04', 7, 5),
    (6, '2023-10-05', 1, 6),
    (7, '2023-10-06', 10, 7),
    (8, '2023-10-07', 3, 8),
    (10, '2023-10-08', 4, 9),
    (9, '2023-10-08', 2, 10),
    (1, '2023-10-09', 6, 11),
    (3, '2023-10-10', 3, 12),
    (2, '2023-10-10', 1, 13),
    (4, '2023-10-11', 5, 14),
    (5, '2023-10-11', 8, 15);

-- Sample data for the "ProductsReceived" table
INSERT INTO ProductsReceived (product_id, received_date, quantity_received, supplier_id) VALUES
    (1, '2023-09-20', 50, 1),
    (2, '2023-09-21', 30, 2),
    (3, '2023-09-22', 70, 1),
    (4, '2023-09-23', 20, 3),
    (5, '2023-09-24', 40, 2),
    (6, '2023-09-25', 15, 1),
    (7, '2023-09-26', 25, 3),
    (8, '2023-09-27', 60, 1),
    (9, '2023-09-28', 35, 2),
    (10, '2023-09-29', 45, 1),
    (1, '2023-09-30', 55, 2),
    (2, '2023-10-01', 25, 3),
    (3, '2023-10-02', 65, 1),
    (4, '2023-10-03', 30, 2),
    (5, '2023-10-04', 40, 3);

select * 
from storedatabase.orders;

-- Create the stored procedure
DELIMITER $$
CREATE PROCEDURE CalculateTotalSales_6(
    IN product_id INT,
    IN start_date DATE,
    IN end_date DATE,
    OUT total_sales DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(quantity_sold * price) INTO total_sales
    FROM ProductsSold ps
    JOIN Goods as g ON ps.product_id = g.product_id
    WHERE ps.product_id = product_id
        AND ps.sale_date BETWEEN start_date AND end_date;
END$$
DELIMITER ;

-- Call the stored procedure to calculate total sales for product 1 between two dates
CALL CalculateTotalSales_6(1, '2023-10-01', '2023-10-31', @result);

-- Retrieve the result from the output parameter
SELECT @result AS total_sales;

DELIMITER $$
-- Change your database to the appropriate database (StoreDatabase in this case)
USE StoreDatabase$$

-- Create the user-defined function
CREATE FUNCTION CalculateCustomerRevenue(customerName VARCHAR(255))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalRevenue DECIMAL(10, 2);
    
    -- Calculate the total revenue for the specified customer
    SELECT SUM(ps.quantity_sold * g.price) INTO totalRevenue
    FROM ProductsSold ps
    JOIN Goods g ON ps.product_id = g.product_id
    JOIN Customers c ON ps.customer_id = c.customer_id
    WHERE c.customer_name = customerName;

    -- If the customer has no purchases, return 0.00
    IF totalRevenue IS NULL THEN
        SET totalRevenue = 0.00;
    END IF;

    RETURN totalRevenue;
END$$
DELIMITER ;
SELECT CalculateCustomerRevenue('Alice Johnson') AS total_revenue;



-- Trigger for INSERT operation on ProductsSold table
DELIMITER $$
CREATE TRIGGER AfterInsertProductsSold
AFTER INSERT ON ProductsSold
FOR EACH ROW
BEGIN
    UPDATE Goods
    SET quantity_in_stock = quantity_in_stock - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END$$
DELIMITER ;

-- Trigger for UPDATE operation on ProductsSold table
DELIMITER $$
CREATE TRIGGER AfterUpdateProductsSold
AFTER UPDATE ON ProductsSold
FOR EACH ROW
BEGIN
    UPDATE Goods
    SET quantity_in_stock = quantity_in_stock + OLD.quantity_sold - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END$$
DELIMITER ;

-- Trigger for DELETE operation on ProductsSold table
DELIMITER $$
CREATE TRIGGER AfterDeleteProductsSold
AFTER DELETE ON ProductsSold
FOR EACH ROW
BEGIN
    UPDATE Goods
    SET quantity_in_stock = quantity_in_stock + OLD.quantity_sold
    WHERE product_id = OLD.product_id;
END$$
DELIMITER ;


UPDATE Goods
SET quantity_in_stock = 10
WHERE product_id = 1;

-- Check the initial state of the "Goods" table
SELECT * FROM Goods;

-- Insert a new sale
INSERT INTO ProductsSold (product_id, sale_date, quantity_sold, customer_id)
VALUES (1, '2023-11-26', 2, 1);

-- Check the updated state of the "Goods" table
SELECT * FROM Goods;

-- Update the quantity sold for an existing sale
UPDATE ProductsSold
SET quantity_sold = 3
WHERE sale_id = 1;

-- Check the updated state of the "Goods" table
SELECT * FROM Goods;

-- Delete a sale
DELETE FROM ProductsSold
WHERE sale_id = 1;

-- Check the updated state of the "Goods" table
SELECT * FROM Goods;