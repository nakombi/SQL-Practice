
-- SQL Practice Project: Store Database

CREATE DATABASE SQL_Practice_Store;
GO

USE SQL_Practice_Store;
GO

CREATE TABLE customers (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NULL,
    score INT NULL,
    CONSTRAINT PK_customers PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_orders PRIMARY KEY (order_id),
    CONSTRAINT FK_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO customers
    (customer_id, first_name, country, score)
VALUES
    (1, 'Ana', 'Brazil', 850),
    (2, 'Bruno', 'Brazil', 650),
    (3, 'Carla', 'Portugal', 720),
    (4, 'Daniel', 'USA', NULL),
    (5, 'Eva', 'Portugal', 900);

INSERT INTO orders
    (order_id, customer_id, order_date, quantity, total_amount)
VALUES
    (101, 1, '2026-01-10', 2, 150.00),
    (102, 2, '2026-01-12', 1, 80.00),
    (103, 1, '2026-02-05', 3, 240.00),
    (104, 3, '2026-02-20', 1, 120.00),
    (105, 5, '2026-03-01', 4, 400.00),
    (106, 3, '2026-03-15', 2, 200.00);

    SELECT * FROM customers;
    SELECT * FROM orders;