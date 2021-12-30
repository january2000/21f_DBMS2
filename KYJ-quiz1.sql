USE sakila;

#1.
SELECT * FROM actor WHERE first_name = "Matthew";

#2.
SELECT COUNT(DISTINCT last_name) FROM actor;

#3. 
SELECT first_name, last_name FROM actor GROUP BY last_name HAVING COUNT(last_name)>1;

#4.
SELECT a.first_name, a.last_name, COUNT(f.film_id) AS numberOfFilms FROM actor a JOIN film_actor f ON a.actor_id = f.actor_id
GROUP BY f.actor_id ORDER BY numberOfFilms DESC LIMIT 1;

#5. 
SELECT film_id, title, `description`, rental_rate, rental_duration FROM film  
WHERE `description` LIKE "%Scientist%" AND `description` LIKE "%Shark%" AND rental_rate<3
ORDER BY rental_duration DESC;

#6.
SELECT c.category_id, ROUND(AVG(f.rental_rate),2) AS averageRentalRate FROM film f JOIN film_category c ON f.film_id=c.film_id 
GROUP BY c.category_id ORDER BY averageRentalRate ASC;

#7. 
SELECT CONCAT(c.first_name, "_", c.last_name) AS customer_name, a.district, ct.country, ci.city 
FROM customer c JOIN address a ON c.address_id=a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country ct ON ci.country_id = ct.country_id 
WHERE ct.country = "South Korea";

#8.
SELECT c.first_name, c.last_name, ROUND(AVG(p.amount),2) AS averageAmount 
FROM customer c JOIN payment p ON c.customer_id = p.customer_id WHERE c.active = 0
GROUP BY p.customer_id HAVING ROUND(AVG(p.amount),2)>(SELECT AVG(p.amount) FROM payment p);

#9.
#I was not able to answer using only WHERE or only HAVING because the condition about customers who are not active is non-aggregate and condition about average payments is aggregate.
#So I had to use both.

#10. 
SELECT * FROM rental WHERE ISNULL(return_date);
#These values are missing because customers didn't return yet.