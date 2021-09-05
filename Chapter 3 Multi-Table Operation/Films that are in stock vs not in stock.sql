WITH film_categories AS 
(
	SELECT 
  		f.film_id,
  		CASE
  			WHEN COUNT(inventory_id) = 0 THEN 'not in stock'
  			WHEN COUNT(inventory_id) > 0 THEN 'in stock'
  		END in_stock
  	FROM film f
  	LEFT JOIN inventory inv
  	ON f.film_id = inv.film_id
  	GROUP BY f.film_id
)

SELECT 
	in_stock,
	COUNT(in_stock) as count
FROM film_categories
GROUP BY in_stock