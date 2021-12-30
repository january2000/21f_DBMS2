USE classicmodels;

#1. 
SELECT customerName FROM customers WHERE country LIKE "%land";

#2. 
SELECT country, COUNT(customerName) FROM customers WHERE country LIKE "%land" GROUP BY country;

#3. 
SELECT customerName, city, country FROM customers WHERE ISNULL(salesRepEmployeeNumber)=1;

#4. 
SELECT e.firstName, e.lastName FROM employees e, offices o WHERE o.officeCode=e.officeCode AND o.city="Paris";

#5. Identify the products that have not been sold. 
SELECT o.orderNumber, p.productCode, p.productName FROM products p LEFT JOIN orderdetails o ON p.productCode = o.productCode WHERE ISNULL(o.orderNumber)=1;

#6.
SELECT paymentDate, SUM(amount) AS totalPayment FROM payments GROUP BY paymentDate;

#7.
SELECT customerNumber, SUM(amount) AS paymentByCustomer FROM payments GROUP BY customerNumber;

#8.
SELECT c.customerName, SUM(d.quantityOrdered) AS quantityOrdered FROM customers c JOIN orders o ON c.customerNumber = o.customerNumber JOIN orderdetails d ON o.orderNumber = d.orderNumber 
GROUP BY customerName ORDER BY quantityOrdered DESC LIMIT 1;
#9. 
SELECT d.orderNumber, SUM(d.quantityOrdered*priceEach) AS totalValue FROM orders o, orderdetails d WHERE o.status = "On Hold" GROUP BY d.orderNumber;

#10.
SELECT d.productCode FROM orders o INNER JOIN orderdetails d ON o.orderNumber=d.orderNumber WHERE DAYNAME(o.orderDate)="Saturday";

#11.
CREATE VIEW order_value_view AS
SELECT o.orderNumber, c.customerName, SUM(d.quantityOrdered*priceEach) as sumOfValue 
FROM customers c JOIN orders o ON o.customerNumber = c.customerNumber JOIN orderdetails d on o.orderNumber = d.orderNumber GROUP BY orderNumber;

SELECT * FROM order_value_view;

#12.
UPDATE order_value_view SET customerName = "Mini Wheel Co." WHERE customerName = "Mini Wheels Co.";
#customerName in the original table wasn't updated becuase there is GROUP BY clause in the query.
