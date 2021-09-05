WITH june_rentals AS 
(
	SELECT 
  		f.film_id,
  		f.title,
  		COUNT(rental_id) AS rentals
  	FROM inventory inv
  	JOIN film f
  	ON inv.film_id = f.film_id
  	JOIN rental r
  	ON inv.inventory_id = r.inventory_id
  	WHERE DATE(rental_ts) >= '2020-06-01'
  	AND DATE(rental_ts) < '2020-07-01' 
  	GROUP BY f.film_id, f.title
)

SELECT 
	film_id, 
	title
FROM june_rentals
ORDER BY rentals DESC
LIMIT 5