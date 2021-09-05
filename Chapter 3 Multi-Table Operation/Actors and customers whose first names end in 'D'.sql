SELECT 
	actor_id,
	first_name,
	last_name
FROM actor
WHERE first_name LIKE '%D'
UNION ALL
SELECT 
	customer_id,
	first_name,
	last_name
FROM customer
WHERE first_name LIKE '%D'