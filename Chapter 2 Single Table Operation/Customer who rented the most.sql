WITH customer_rentals AS 
(
	SELECT 
  		cust.customer_id,
  		first_name,
  		last_name,
  		COUNT(rental_id) as user_rentals
  	FROM rental rent
  	JOIN customer cust
  	ON rent.customer_id = cust.customer_id
  	WHERE DATE(rental_ts) >= '2020-05-01'
  	AND DATE(rental_ts) < '2020-06-01'
  	GROUP BY cust.customer_id
)

SELECT 
	first_name,
	last_name
FROM customer_rentals
WHERE user_rentals = (
	SELECT MAX(user_rentals)
  	FROM customer_rentals
)