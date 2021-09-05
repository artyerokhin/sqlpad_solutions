WITH category_rentals AS 
(
	SELECT 
  		cat.name,
  		SUM(pay.amount) AS revenue
  	FROM payment pay
  	JOIN rental rent
  	ON pay.rental_id = rent.rental_id
  	JOIN inventory inv
  	ON rent.inventory_id = inv.inventory_id
  	JOIN film_category fc
  	ON inv.film_id = fc.film_id
  	JOIN category cat
  	ON fc.category_id = cat.category_id
  	GROUP BY cat.name
)

SELECT 
	name, 
	revenue
FROM category_rentals
ORDER BY revenue DESC
LIMIT 3