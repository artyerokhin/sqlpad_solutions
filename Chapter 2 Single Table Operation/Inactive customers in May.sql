SELECT 
	COUNT(DISTINCT(customer_id))
FROM customer
WHERE customer_id NOT IN
(
	SELECT customer_id
  	FROM rental
  	WHERE DATE(rental_ts) >= '2020-05-01'
  	AND DATE(rental_ts) < '2020-06-01'
)