USE classicmodels;

#1. 
SELECT c.customerName, p.paymentDate, p.amount FROM customers c JOIN payments p ON c.customerNumber = p.customerNumber;

#2. 
SELECT DISTINCT c.country, COUNT(p.paymentDate) AS 'Payments' FROM customers c JOIN payments p ON c.customerNumber = p.customerNumber GROUP BY c.country ORDER BY country ASC;

#3. 
SELECT c.customerName, c.phone, MAX(p.paymentDate) AS 'Last Payment Date' FROM customers c JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber;

#4. 
SELECT c.customerName, c.country, o.orderNumber, o.orderDate FROM customers c JOIN orders o ON c.customerNumber=o.customerNumber;

#5. Do you see more or less rows returned? Why is this the case?
SELECT c.customerName, c.country, o.orderNumber, o.orderDate FROM customers c LEFT JOIN orders o ON c.customerNumber=o.customerNumber;
#There are more rows returned since this query also returns the customerName which has no orders. 

#6. Did you get the same results as 5? Why?
SELECT c.customerName, c.country, o.orderNumber, o.orderDate FROM orders o LEFT JOIN customers c ON c.customerNumber=o.customerNumber;
#This query gets the same result with question 4, not question 5, because this query doesn't return the customerName having no orders. 

#7.
SELECT o.customerNumber, d.orderNumber, p.productName 
FROM orders o 
JOIN orderdetails d ON o.orderNumber=d.orderNumber
JOIN products p ON d.productCode=p.productCode;

#8. 
#Just by observing your result, which sales representative has the most orders with a single customer?
SELECT c.customerNumber, c.customerName, CONCAT(e.firstName,' ',e.lastName) AS 'sales representative name', COUNT(o.ordernumber) AS 'Order Count'
FROM customers c 
JOIN employees e ON c.salesRepEmployeeNumber=e.employeeNumber
JOIN orders o ON c.customerNumber=o.customerNumber
GROUP BY o.customerNumber HAVING  COUNT(o.ordernumber)>4;
#Gerard Hernandez has the most orders with a sigle customer. 

#9. 
SELECT CONCAT(m.firstName, ' ', m.lastName) AS 'Manager Name', CONCAT(e.firstName, ' ', e.lastName) AS 'Employee Name'
FROM employees e 
JOIN employees m ON e.reportsTo = m.employeeNumber ORDER BY m.lastName;


