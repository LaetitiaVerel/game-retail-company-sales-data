CREATE DATABASE Game_Retail_Company;
USE Game_Retail_Company;

CREATE TABLE Category (
    category_id INT,
    category_name VARCHAR(50),
    PRIMARY KEY (category_id)
);

CREATE TABLE Products (
    product_id INT,
    category_id INT,
    product_name VARCHAR(50),
    product_developer VARCHAR(50),
    price FLOAT,
    cost FLOAT,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);



CREATE TABLE Shop (
    shop_id INT,
    shop_name VARCHAR(50),
    shop_city VARCHAR(50),
    PRIMARY KEY (shop_id)
);

CREATE TABLE Customer (
    customer_id INT,
    customer_name VARCHAR(50),
    customer_email VARCHAR(50),
    PRIMARY KEY (customer_id)
);

CREATE TABLE Orders(
    order_id INT,
    order_date DATE,
    shop_id INT,
    product_id INT,
    customer_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (shop_id) REFERENCES Shop(shop_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


SELECT o.order_id, o.customer_id, o.order_date, o.shop_id
FROM Orders o
INNER JOIN Customer c ON o.customer_id=c.customer_id;

SELECT o.order_id, o.customer_id, o.order_date, o.shop_id
FROM Orders o
INNER JOIN Shop s ON o.shop_id=s.shop_id;

SELECT o.order_id, o.customer_id, o.order_date, o.shop_id
FROM Orders o
INNER JOIN Products p ON o.product_id=p.product_id;

SELECT ca.category_id, ca.category_name
FROM Category ca
INNER JOIN Products p ON ca.category_id=p.category_id;

INSERT INTO Category
(category_id,category_name)
VALUES
(1,'Sports'),
(2,'RPG'),
(3,'Leisure');

INSERT INTO Products
(product_id,category_id,product_name,product_developer,price)
VALUES
(1, 3, 'Animal Crossing', 'Nintendo', 50.00),
(2, 1, 'Just Dance', 'Ubisoft', 28.00),
(3, 2, 'Zelda', 'Nintendo', 50.00);

SELECT *
FROM Products
WHERE product_name IN (SELECT product_name
FROM Products
WHERE price > 30.00)

