
USE bookstore ;
/*Creating roles*/
CREATE ROLE 'manager';
CREATE ROLE 'administrator';
CREATE ROLE 'data_capture';

/* creating users*/
CREATE USER 'Boitumelo'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'Noluthando'@'localhost' IDENTIFIED BY 'password456';
CREATE USER 'Amelia'@'localhost' IDENTIFIED BY 'password789';

/*Grant user roles*/
GRANT 'manager' TO 'Boitumelo'@'localhost';
GRANT 'administrator' TO 'Noluthando'@'localhost';
GRANT 'data_capture'TO 'Amelia'@'localhost';

/*Grant permissions */
GRANT ALL PRIVILEGES ON bookstore.* TO 'manager';
GRANT ALL PRIVILEGES ON bookstore.* TO 'administrator';
GRANT SELECT ON bookstore.books TO 'data_capture';
GRANT SELECT, INSERT, UPDATE ON bookstore.orders TO 'data_capture';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'data_capture';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'data_capture';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_status TO 'data_capture';

/*Activate roles */
SET DEFAULT ROLE 'manager' TO 'Boitumelo'@'localhost';
SET DEFAULT ROLE 'administrator' TO 'Noluthando'@'localhost';
SET DEFAULT ROLE 'data_capture'TO 'Amelia'@'localhost';


