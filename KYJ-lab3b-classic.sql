USE classicmodels;

#1. What are the different job titles in this company and how many employees hold each title? 
SELECT DISTINCT jobTitle AS job_title, COUNT(employeeNumber) AS employees FROM employees GROUP BY jobTitle;

#2. Write a query to list the number of offices in each country that has one or more offices.
SELECT country, COUNT(officeCode) AS offices FROM offices GROUP BY country HAVING COUNT(officeCode)>=1;

#3. In orderdetails, for each orderLineNumber, return its i)count, ii)the minimum, maximum and average quantity ordered, ordered by orderLineNumber, count and average all in ascending order. 
SELECT orderLineNumber, COUNT(quantityOrdered) AS count, MIN(quantityOrdered) AS minimum, MAX(quantityOrdered) AS maximum, AVG(quantityOrdered) AS average 
FROM orderdetails GROUP BY orderLineNumber ORDER BY orderLineNumber ASC, count ASC, average ASC;

#4. What are the top 5 product codes with the most quantity ordered?
SELECT productCode FROM orderdetails ORDER BY quantityOrdered DESC LIMIT 5;

#5. Which order numbers have only one product code associated with them? Your query should return 17 order numbers.
SELECT orderNumber FROM orderdetails GROUP BY orderNumber HAVING COUNT(productCode)=1;

#6. List the top 10 order number and product code combination where the total price exceeds 10,000. 
#The price for an order detail is given by quantityOrdered*priceEach. 
SELECT orderNumber, productCode, quantityOrdered*priceEach AS total_price FROM orderdetails WHERE quantityOrdered*priceEach>10000 ORDER BY total_price DESC LIMIT 10;

#7. How many of these top 10 order details from Q6 have orderLineNumber greater than 5? Only the first and last row from the table above should be returned.
SELECT orderNumber, productCode, quantityOrdered*priceEach AS total_price FROM orderdetails WHERE quantityOrdered*priceEach>10000 AND orderLineNumber>5 ORDER BY total_price DESC LIMIT 10;

#8. Rewrite the query in Q7 by checking the condition for orderLineNumber in the HAVING clause. Why does this not work?
SELECT orderNumber, productCode, quantityOrdered*priceEach AS total_price FROM orderdetails WHERE quantityOrdered*priceEach>10000 HAVING orderLineNumber>5 ORDER BY total_price DESC LIMIT 10;
#HAVING clause should be used to query subset of aggregated groups. However, orderLineNumber column is not an aggregate. So, we cannot use HAVING in this query.

#9. In payments, which year has an average amount that is higher than the average amount paid over all the years?
SELECT YEAR(paymentDate), AVG(amount) AS average FROM payments GROUP BY YEAR(paymentDate) HAVING average > (SELECT AVG(amount) FROM payments);
