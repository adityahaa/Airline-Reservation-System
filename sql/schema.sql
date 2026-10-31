-- Local educational schema inferred from the application's JDBC statements.
-- No production passenger records or credentials are included.
CREATE DATABASE IF NOT EXISTS airline_reservation_system;
USE airline_reservation_system;
CREATE TABLE IF NOT EXISTS users (
 user_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 age INT,
 phone_number VARCHAR(32),
 aadhaar_no VARCHAR(32) UNIQUE
);
CREATE TABLE IF NOT EXISTS flights (
 flight_id INT AUTO_INCREMENT PRIMARY KEY,
 flight_name VARCHAR(255) NOT NULL,
 source VARCHAR(255) NOT NULL,
 destination VARCHAR(255) NOT NULL,
 departure_time DATETIME NOT NULL,
 arrival_time DATETIME NOT NULL,
 price DECIMAL(12,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS bookings (
 booking_id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 flight_id INT NOT NULL,
 pnr_no VARCHAR(64) NOT NULL UNIQUE,
 seat_no VARCHAR(16),
 checked_in BOOLEAN NOT NULL DEFAULT FALSE,
 FOREIGN KEY (user_id) REFERENCES users(user_id),
 FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
