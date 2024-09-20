-- Users table: Stores customer information
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pizza table: Stores pizza information
CREATE TABLE pizzas (
    pizza_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Toppings table: Stores available toppings
CREATE TABLE toppings (
    topping_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Order table: Stores orders with the user reference
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    status VARCHAR(20) DEFAULT 'pending',
    total_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Order_Pizza table: Associates pizzas with orders
CREATE TABLE order_pizzas (
    order_pizza_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    pizza_id INT REFERENCES pizzas(pizza_id),
    quantity INT NOT NULL
);

-- Order_Toppings table: Associates toppings with pizzas in an order
CREATE TABLE order_toppings (
    order_topping_id SERIAL PRIMARY KEY,
    order_pizza_id INT REFERENCES order_pizzas(order_pizza_id),
    topping_id INT REFERENCES toppings(topping_id),
    quantity INT NOT NULL
);
