-- Disable FOREIGN KEY checks
SET FOREIGN_KEY_CHECKS = 0;

-- Drop existing tables to rebuild new schema
DROP TABLE IF EXISTS Cartbook;
DROP TABLE IF EXISTS Checkout;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;

-- Table Creation
CREATE TABLE IF NOT EXISTS Author (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Book (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(255) NOT NULL,
  pubYear INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  inventory INT NOT NULL,
  bookDescription TEXT NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  AuthorId INT,
  FOREIGN KEY (AuthorId) REFERENCES Author(id)
);

CREATE TABLE IF NOT EXISTS Cart (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Checkout (
  id INT AUTO_INCREMENT PRIMARY KEY,
  addressLine1 VARCHAR(255) NOT NULL,
  addressLine2 VARCHAR(255),
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  zipCode VARCHAR(255) NOT NULL,
  subTotal DECIMAL(10,2) NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  CartId INT,
  FOREIGN KEY (CartId) REFERENCES Cart(id)
);

CREATE TABLE IF NOT EXISTS Cartbook (
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  BookId INT,
  CartId INT,
  PRIMARY KEY (BookId, CartId),
  FOREIGN KEY (BookId) REFERENCES Book(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CartId) REFERENCES Cart(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Re-enable foreign key checks BEFORE data insert
SET FOREIGN_KEY_CHECKS = 1;

-- Seed Data
INSERT INTO Author (firstName, lastName, createdAt, updatedAt) VALUES
('J.K.', 'Rowling', NOW(), NOW()),
('George', 'Orwell', NOW(), NOW()),
('J.R.R.', 'Tolkien', NOW(), NOW())
ON DUPLICATE KEY UPDATE firstName=VALUES(firstName), lastName=VALUES(lastName);

INSERT INTO Book (title, genre, pubYear, price, inventory, bookDescription, createdAt, updatedAt, AuthorId) VALUES
('Harry Potter and the Philosopher''s Stone', 'Fantasy', 1997, 20.00, 50, 'The first book in the Harry Potter series.', NOW(), NOW(), 1),
('1984', 'Dystopian', 1949, 15.00, 40, 'A novel about a totalitarian regime and surveillance.', NOW(), NOW(), 2),
('The Hobbit', 'Fantasy', 1937, 19.00, 30, 'A fantasy adventure novel by J.R.R. Tolkien.', NOW(), NOW(), 3)
ON DUPLICATE KEY UPDATE title=VALUES(title), price=VALUES(price), inventory=VALUES(inventory);

INSERT INTO Cart (userId, createdAt, updatedAt) VALUES
(1, NOW(), NOW()),
(2, NOW(), NOW())
ON DUPLICATE KEY UPDATE updatedAt=VALUES(updatedAt);

INSERT INTO Checkout (addressLine1, addressLine2, city, state, zipCode, subTotal, createdAt, updatedAt, CartId) VALUES
('123 Main St', 'Apt 4', 'London', 'London', 'SW1A 1AA', 59.99, NOW(), NOW(), 1),
('456 Elm St', '', 'Oxford', 'Oxfordshire', 'OX1 2JD', 35.50, NOW(), NOW(), 2)
ON DUPLICATE KEY UPDATE updatedAt=VALUES(updatedAt);

INSERT INTO Cartbook (BookId, CartId, createdAt, updatedAt) VALUES
(1, 1, NOW(), NOW()),
(2, 1, NOW(), NOW()),
(3, 2, NOW(), NOW())
ON DUPLICATE KEY UPDATE updatedAt=VALUES(updatedAt);

