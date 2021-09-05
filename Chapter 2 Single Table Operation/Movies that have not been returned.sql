WITH returns AS
(
	SELECT 
  		title,
  		return_ts
  	FROM rental rent
  	JOIN inventory inv
  	ON rent.inventory_id = inv.inventory_id
  	JOIN film f
  	ON inv.film_id = f.film_id
)

SELECT 
	DISTINCT(title)
FROM returns
WHERE return_ts IS NULL