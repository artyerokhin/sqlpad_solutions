WITH film_rent_cnt AS
(
	SELECT 
  		f.film_id,
  		COALESCE(COUNT(rental_id), 0) AS n_rents
  	FROM film f
  	LEFT JOIN inventory inv
  	ON inv.film_id = f.film_id
  	LEFT JOIN (
	  SELECT * FROM rental
	  WHERE rental_ts >= '2020-05-01'
	  AND rental_ts < '2020-06-01'
	) rent
  	ON inv.inventory_id = rent.inventory_id
  	GROUP BY f.film_id
),
film_rent_type AS
(
	SELECT 
  		film_id,
  		CASE 
  			WHEN n_rents > 1 THEN 'in demand'
  			WHEN n_rents <= 1 THEN 'not in demand'
  		END demand_category
  	FROM film_rent_cnt
)

SELECT 
	demand_category,
	COUNT(film_id)
FROM film_rent_type
GROUP BY demand_category