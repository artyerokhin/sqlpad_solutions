WITH may_rentals AS
(
  SELECT
  	rental_id,
  	inventory_id
  FROM rental
  WHERE DATE(rental_ts) <= '2020-05-31'  
  AND DATE(rental_ts) >= '2020-05-01'
),
film_count AS
(
  SELECT 
  	inv.film_id, 
  	COUNT(rental_id) as rental_count
  FROM inventory inv
  LEFT JOIN may_rentals rnt
  ON rnt.inventory_id = inv.inventory_id
  GROUP BY film_id
),
zero_rentals AS 
(
  SELECT 
  	inv.film_id, 
  	inv.inventory_id,
  	rental_count
  FROM inventory inv
  JOIN film_count fc
  ON fc.film_id = inv.film_id
)

SELECT COUNT(1)
FROM zero_rentals
WHERE zero_rentals.rental_count = 0