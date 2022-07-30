USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name AS category, COUNT(f.film_id) as nof 
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT SUM(p.amount), CONCAT(s.first_name, ' ', s.last_name)
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE p.payment_date BETWEEN '2005-07-31' AND '2005-08-31'
GROUP BY CONCAT(s.first_name, ' ', s.last_name);


-- 3. Which actor has appeared in the most films?

SELECT  CONCAT(a.first_name, ' ', a.last_name) AS actor,
		COUNT(film_id) AS nof
FROM 	sakila.actor a
JOIN 	sakila.film_actor fa
ON 		a.actor_id = fa.actor_id
GROUP BY CONCAT(a.first_name, ' ', a.last_name)
ORDER BY nof DESC
LIMIT 1;
		
-- 4. Most active customer (the customer that has rented the most number of films)

SELECT  CONCAT(c.first_name, ' ', c.last_name),
		COUNT(r.inventory_id) AS nof
FROM	sakila.customer c
JOIN 	sakila.rental r
ON		c.customer_id = r.customer_id
GROUP BY CONCAT(c.first_name, ' ', c.last_name)
ORDER BY nof DESC 
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT  CONCAT(s.first_name, ' ', s.last_name) AS staff,
		a.address
FROM 	sakila.staff s
JOIN 	sakila.address a
ON 		s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT  f.title as film,
		COUNT(fa.actor_id) as noa
FROM 	sakila.film f
JOIN 	sakila.film_actor fa
ON 		f.film_id = fa.film_id
GROUP BY f.title;

-- 7. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT  c.last_name AS customer,
		SUM(p.amount) as total_payed
FROM 	sakila.customer c
JOIN 	sakila.payment p
ON 		c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY c.last_name; 

-- 8. List number of films per `category` --> see nr.1

