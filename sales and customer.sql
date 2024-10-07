-- Create a table for customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create a table for products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create a table for sales
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample data into Customers table
INSERT INTO Customers (customer_id, first_name, last_name, email)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(2, 'Bob', 'Smith', 'bob.smith@example.com');

-- Insert sample data into Products table
INSERT INTO Products (product_id, product_name, price)
VALUES
(1, 'Laptop', 799.99),
(2, 'Smartphone', 499.99);

-- Insert sample data into Sales table
INSERT INTO Sales (sale_id, customer_id, product_id, sale_date, quantity)
VALUES
(1, 1, 1, '2024-02-01', 1),
(2, 2, 2, '2024-02-03', 2);
