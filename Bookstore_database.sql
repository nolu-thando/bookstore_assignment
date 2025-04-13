/*Create a database*/
CREATE DATABASE bookstore;
USE bookstore;

/*Create tables*/
CREATE TABLE book_author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(200),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES book_author(author_id)
);
CREATE TABLE author(
author INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (100)
);

CREATE TABLE book_language(
 book_language INT AUTO_INCREMENT PRIMARY KEY,
language VARCHAR (100)
);
CREATE TABLE publisher(
 book_publisher INT AUTO_INCREMENT PRIMARY KEY,
publisher VARCHAR (200)
);
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    email VARCHAR(100) UNIQUE
);
CREATE TABLE customer_address(
 customer_address INT AUTO_INCREMENT PRIMARY KEY,
address VARCHAR (200) UNIQUE
);
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);
/*inserting into status*/
INSERT INTO address_status (status_name)
VALUES ('current'), ('old');

CREATE TABLE address(
address_id INT AUTO_INCREMENT PRIMARY KEY,
address VARCHAR (100)
);
CREATE TABLE country(
country_id INT AUTO_INCREMENT,
country VARCHAR (100) NOT NULL,
PRIMARY KEY (country_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT ('Current Date'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_line(
order_item INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
CREATE TABLE shipping_method(
method_id INT AUTO_INCREMENT PRIMARY KEY,
method_name VARCHAR (200) NOT NULL UNIQUE,
delivery_time VARCHAR(50),
is_active BOOLEAN DEFAULT TRUE  /*To enable/disable methods without deleting them*/
);

CREATE TABLE order_history(
history_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
status_id INT NOT NULL,
 updated_by VARCHAR(100)  /*who changed it: 'admin', 'system', or a username*/
);

CREATE TABLE order_status(
status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);