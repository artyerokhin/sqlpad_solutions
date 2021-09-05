WITH film_revenue AS 
(
  SELECT 
	f.film_id,
  	CASE
  		WHEN SUM(pay.amount) < 20 OR SUM(pay.amount) IS NULL THEN 'low'
  		WHEN SUM(pay.amount) >= 20 AND SUM(pay.amount) < 100 THEN 'medium'
  		WHEN SUM(pay.amount) > 100 THEN 'high'
  	END film_group
  FROM film f
  LEFT JOIN inventory inv ON inv.film_id = f.film_id
  LEFT JOIN rental rent ON inv.inventory_id = rent.inventory_id
  LEFT JOIN payment pay ON rent.rental_id = pay.rental_id
  GROUP BY f.film_id
)

SELECT 
	film_group,
	COUNT(film_id)
FROM film_revenue
GROUP BY film_group
