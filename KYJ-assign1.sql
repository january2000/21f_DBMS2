USE classicmodels;

#1. 
SELECT DISTINCT country FROM customers ORDER BY country ASC;

#2.
SELECT e1.firstName, e1.lastName FROM employees e1, employees e2 WHERE e1.reportsTo = e2.employeeNumber AND e2.firstName = 'Gerard' AND e2.lastName = 'Bondur'; 

#3.
SELECT customerName, city FROM customers WHERE ISNULL(salesRepEmployeeNumber)=1;

#4. 
SELECT customerName, CONCAT(contactFirstName,' ',contactLastName) AS contactName FROM customers;

#5.
SELECT productLine, productName FROM products WHERE productName LIKE '%Ford%' and productLine LIKE '%car%';

#6. Why do you think the state information is missing for these offices?
SELECT COUNT(*) FROM offices WHERE ISNULL(state)=1; 
#Maybe just address can tell the location of these offices.

#7. Why are these orders more problematic for the company compared to orders that were cancellled before they were shipped?
SELECT * FROM orders WHERE status='cancelled' AND ISNULL(shippedDate)=0;
#These orders are problematic for the comany since they need to consider whom to cover the shipping fee.

#8. 
SELECT paymentDate, FORMAT(amount,2) AS amount FROM payments WHERE paymentDate>='2003/09/01' AND paymentDate<='2004/3/31' AND amount>2*(SELECT AVG(amount) from payments) ORDER BY paymentDate DESC;

#9. 
SELECT productCode, quantityOrdered, quantityOrdered*priceEach AS orderValue FROM orderdetails 
WHERE productCode LIKE 'S700%' AND quantityOrdered > 45 ORDER BY orderValue DESC LIMIT 10;

#10. 
#When two or more tables are related and one table references its foreign key from another table's primary key, if we modify the primary key, data could lose its consistency.
#If the data become inconsistent, existing query will fail. 
#Mostly primary key is something unique one such as student Id or order number and if we modify it, the meaning of the whole data can be changed and it may return unwanted results or even error.
