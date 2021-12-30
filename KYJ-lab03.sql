USE sakila;

#1. How many actors have "SON" in their last name?
SELECT COUNT(last_name) AS last_name FROM actor WHERE last_name LIKE "%SON";

#2. How many second address lines (address2) entries are NULLs?
SELECT SUM(ISNULL(address2)) AS null_address2 FROM address;

#3. Type the following query and observe what it returns:
SELECT COUNT(DISTINCT original_language_id) FROM film; #It returns 0
#What does this say about the values in the column original_language_id? 
##There is no distinct values in column original_language_id. That means there is no data in this column meaning null.

#4. What is the longest length of the film containing the word ‘LOVE’ in its title? What is its title and description?
SELECT title, `description` FROM film WHERE title LIKE "%LOVE%" AND LENGTH(title) = (SELECT MAX(LENGTH(title)) from film WHERE title LIKE "%LOVE%");

#5. How many films are about "Robot"s?
SELECT COUNT(*) FROM film WHERE `description` LIKE "%Robot%";

#6. What was the total payment made to staff with staff_id = 1?
SELECT SUM(amount) as total_payment FROM payment WHERE staff_id = 1;

#7. How many unique films are stored in the inventory?
SELECT COUNT(DISTINCT film_id) FROM inventory;

#8. For each store, list the store_id and the total number of unique films it stores.
SELECT store_id, COUNT(DISTINCT film_id) AS total_unique_films FROM inventory GROUP BY store_id;

#9. For each store, list the store_id and the total number of films it stores (dupilicates or the same movies are allowed). 
SELECT store_id, COUNT(film_id) AS total_films FROM inventory GROUP BY store_id;

#10. For each store, list the number of copies of every movie that it has. Order the results in such a way that the first 10 rows should look like below.
SELECT store_id, film_id, COUNT(film_id) as film_count FROM inventory GROUP BY store_id, film_id;
