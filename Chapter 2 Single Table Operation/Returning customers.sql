WITH may_rentals AS 
(
	SELECT DISTINCT(customer_id)
  	FROM rental
  	WHERE DATE(rental_ts) >= '2020-05-01'
  	AND DATE(rental_ts) < '2020-06-01'
),
june_rentals AS 
(
	SELECT DISTINCT(customer_id)
  	FROM rental
  	WHERE DATE(rental_ts) >= '2020-06-01'
  	AND DATE(rental_ts) < '2020-07-01'
)

SELECT COUNT(june_rentals.customer_id)
FROM may_rentals
JOIN june_rentals
ON may_rentals.customer_id = june_rentals.customer_id