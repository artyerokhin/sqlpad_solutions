WITH customer_type AS
(
	SELECT 
  		cust.customer_id,
  		COUNT(rental_id),
  		CASE
  			WHEN COALESCE(COUNT(rental_id), 0) = 0 THEN 'never-rented'
  			WHEN COALESCE(COUNT(rental_id), 0) = 0 IS NOT NULL THEN 'rented'
  		END hass_rented
  	FROM customer cust
  	LEFT JOIN (
	  SELECT * FROM rental
	  WHERE DATE(rental_ts) >= '2020-05-01'
	  AND DATE(rental_ts) < '2020-06-01'
	) rent
  	ON cust.customer_id = rent.customer_id
  	GROUP BY cust.customer_id
)

SELECT 
	hass_rented,
	COUNT(customer_id)
FROM customer_type
GROUP BY hass_rented