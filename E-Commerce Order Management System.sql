-- Create table for Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Create table for Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Create table for Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create table for Order_Items (to track multiple products per order)
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_time DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create table for Shipping
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_address TEXT,
    shipping_date DATE,
    delivery_date DATE,
    status VARCHAR(20) DEFAULT 'Shipped',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert sample data into Customers
INSERT INTO Customers (first_name, last_name, email, phone, address) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St');

-- Insert sample data into Products
INSERT INTO Products (product_name, description, price, stock) 
VALUES 
('Laptop', '14-inch, 8GB RAM, 256GB SSD', 899.99, 10),
('Headphones', 'Noise-cancelling wireless headphones', 199.99, 25),
('Smartphone', '5G-enabled, 128GB storage', 699.99, 15);

-- Insert sample order for customer 1
INSERT INTO Orders (customer_id, order_date, total_amount) 
VALUES (1, '2024-10-01', 1099.98);

-- Insert order items for the order
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_time) 
VALUES (1, 1, 1, 899.99), (1, 2, 1, 199.99);

-- Insert shipping details for the order
INSERT INTO Shipping (order_id, shipping_address, shipping_date, delivery_date, status) 
VALUES (1, '123 Elm St', '2024-10-02', '2024-10-05', 'Shipped');
