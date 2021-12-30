use classicmodels;

#Querying Tables
#a.
SELECT * FROM employees;
#b.
SELECT amount FROM payments LIMIT 15;
#c.
SELECT checkNumber, paymentDate FROM payments;
#d.
INSERT INTO productlines(productLine, textDescription) VALUES('test', 'this is a test product');
SELECT * FROM productlines;
#e.
UPDATE customers SET phone="40.32.2000" WHERE customerNumber = 103;
SELECT * FROM customers;

#Querying databases
#a.
SHOW DATABASES; #classicmodels, information_schema, mysql, performance_schema, sakila, sys, world databases are available
#b.
USE classicmodels;
#c.
SELECT DATABASE();
#d.
SHOW TABLES;
#e.
DESCRIBE offices;
#f.
CREATE TABLE test(
col1 INT AUTO_INCREMENT,
col2 VARCHAR(20),
col3 FLOAT,
PRIMARY KEY(col1)
);
#g.
INSERT INTO test(col1, col2, col3) VALUES(NULL, "testing", 30);
INSERT INTO test(col1, col2, col3) VALUES(NULL, "testingagain", 3);
#h.
DROP TABLE IF EXISTS test;
SHOW TABLES; #test table is not available anymore because it was deleted by line 39.

