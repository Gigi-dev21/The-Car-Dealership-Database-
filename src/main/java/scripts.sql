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