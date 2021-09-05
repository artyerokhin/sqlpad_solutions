WITH rental_counts AS 
(
	SELECT 
  		f.film_id
  	FROM film f
  	JOIN inventory inv
  	ON f.film_id = inv.film_id
  	LEFT JOIN rental rent
  	ON inv.inventory_id = rent.inventory_id
  	WHERE DATE(rent.rental_ts) >= '2020-02-01'
  	AND DATE(rent.rental_ts) < '2020-03-01'
)

SELECT COUNT(film_id) as count
FROM film
WHERE film.film_id NOT IN 
	(
	  SELECT film_id
	  FROM rental_counts
	)