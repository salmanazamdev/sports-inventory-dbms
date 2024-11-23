-- Create the SportsInventoryDB database
CREATE DATABASE IF NOT EXISTS SportsInventoryDB;
USE SportsInventoryDB;

-- Equipment Table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert sample data into Equipment
INSERT INTO Equipment (EquipmentID, EquipmentName, Category, Brand, Price) VALUES
(1, 'Basketball', 'Basketball', 'Nike', 25.00),
(2, 'Football', 'Football', 'Adidas', 20.00),
(3, 'Cricket Bat', 'Cricket', 'Gray-Nicolls', 40.00),
(4, 'Cricket Helmet', 'Cricket', 'Masuri', 50.00),
(5, 'Cricket Ball', 'Cricket', 'Kookaburra', 5.00),
(6, 'Football Kit', 'Football', 'Puma', 80.00);

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

-- Insert sample data into Customer
INSERT INTO Customer (CustomerID, CustomerName, Age, ContactNumber, Email) VALUES
(1, 'Salman', 25, '+1234567890', 'salman1@salman.com'),
(2, 'John Doe', 30, '+1987654321', 'john.doe@example.com'),
(3, 'Jane Smith', 28, '+1555555555', 'jane.smith@example.com'),
(4, 'Alice Johnson', 35, '+1777777777', 'alice.johnson@example.com');

-- Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    EquipmentID INT,
    CustomerID INT,
    QuantitySold INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert sample data into Transactions
INSERT INTO Transactions (TransactionID, EquipmentID, CustomerID, QuantitySold, TotalPrice) VALUES
(1, 1, 1, 2, 50.00),
(2, 3, 2, 1, 40.00),
(3, 4, 3, 1, 50.00),
(4, 6, 4, 1, 80.00);

-- Optional: Example Queries
-- Retrieve all Customers
SELECT * FROM Customer;

-- Retrieve all Equipment costing less than $50
SELECT * FROM Equipment WHERE Price < 50;

-- Retrieve total sales for each Equipment
SELECT EquipmentID, SUM(TotalPrice) AS TotalSales FROM Transactions GROUP BY EquipmentID;
