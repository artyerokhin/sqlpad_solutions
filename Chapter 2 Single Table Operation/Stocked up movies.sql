WITH inv_count AS
(
	SELECT 
  		film_id,
  		COUNT(inventory_id) as film_count
  	FROM inventory
  	GROUP BY film_id
)

SELECT 
	title
FROM film
WHERE film_id IN 
(
	SELECT film_id 
  	FROM inv_count
  	WHERE film_count > 7
)