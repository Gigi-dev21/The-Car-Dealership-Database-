CREATE DATABASE IF NOT EXISTS CarDealership;
USE CarDealership;

-- Table 1: dealerships
CREATE TABLE IF NOT EXISTS dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2= vehicles
CREATE TABLE IF NOT EXISTS vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year YEAR,
    color VARCHAR(20),
    price DECIMAL(10,2),
    SOLD BOOLEAN DEFAULT FALSE
);

-- Table 3= inventory
CREATE TABLE IF NOT EXISTS inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4= sales_contracts
CREATE TABLE IF NOT EXISTS sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(100),
    customer_phone VARCHAR(15),
    sale_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 5= lease_contracts
CREATE TABLE IF NOT EXISTS lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lessee_name VARCHAR(100),
    lease_start DATE,
    lease_end DATE,
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('AutoNation Central', '123 Main St', '555-123-4567'),
('Speedy Motors', '456 Elm Ave', '555-987-6543'),
('Luxury Rides', '789 Oak Blvd', '555-555-1212');

INSERT INTO vehicles (VIN, make, model, year, color, price, SOLD) VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2020, 'Black', 22000.00, FALSE),
('1FTRW08L21KC12345', 'Ford', 'F-150', 2019, 'Red', 28000.00, TRUE),
('JH4KA8270MC000321', 'Acura', 'Legend', 2022, 'White', 35000.00, FALSE),
('2T1BURHE6JC123456', 'Toyota', 'Corolla', 2021, 'Blue', 19000.00, FALSE),
('3VWFE21C04M000789', 'Volkswagen', 'Jetta', 2018, 'Silver', 16000.00, TRUE);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '1FTRW08L21KC12345'),
(2, 'JH4KA8270MC000321'),
(3, '2T1BURHE6JC123456'),
(2, '3VWFE21C04M000789');

INSERT INTO sales_contracts (VIN, customer_name, customer_phone, sale_price, sale_date) VALUES
('1FTRW08L21KC12345', 'John Doe', '555-222-3333', 27000.00, '2024-06-01'),
('3VWFE21C04M000789', 'Jane Smith', '555-444-5555', 15500.00, '2024-05-15');

INSERT INTO lease_contracts (VIN, lessee_name, lease_start, lease_end, monthly_payment) VALUES
('JH4KA8270MC000321', 'Emily Johnson', '2024-01-01', '2026-01-01', 450.00),
('2T1BURHE6JC123456', 'Michael Brown', '2025-02-01', '2028-02-01', 300.00);

