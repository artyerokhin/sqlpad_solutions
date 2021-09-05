WITH high_users AS 
(
	SELECT 
  		EXTRACT(YEAR from payment_ts) AS year,
  		EXTRACT(MONTH from payment_ts) as mon,
  		customer_id,
  		SUM(amount) as spended
  	FROM payment
  	GROUP BY year, mon, customer_id
  	HAVING SUM(amount) > 20
)

SELECT 
	year, 
	mon, 
	COUNT(customer_id) AS num_hp_customers
FROM high_users
GROUP BY year, mon