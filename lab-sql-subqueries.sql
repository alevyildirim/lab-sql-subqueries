-- Welcome to the SQL Subqueries lab!
-- In this lab, you will be working with the Sakila database on movie rentals. Specifically, you will be practicing how to perform subqueries, which are queries embedded within other queries. Subqueries allow you to retrieve data from one or more tables and use that data in a separate query to retrieve more specific information.

--     Challenge
-- 1. Write SQL queries to perform the following tasks using the Sakila database:
-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

USE Sakila;

SELECT COUNT(*) AS num_copies
FROM inventory
WHERE film_id = (SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible');
    
-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT * FROM film 
WHERE length > (SELECT avg(length) FROM film); 

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor_id, first_name, last_name FROM actor
WHERE actor_id IN 
(SELECT actor_id FROM film_actor 
WHERE film_id = (SELECT film_id FROM film WHERE title = "Alone Trip"));


