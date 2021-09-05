WITH customer_spends AS 
(
	SELECT 
  		cust.customer_id,
  		first_name,
  		last_name,
  		SUM(amount) as user_spends
  	FROM payment pay
  	JOIN customer cust
  	ON pay.customer_id = cust.customer_id
  	WHERE DATE(payment_ts) >= '2020-02-01'
  	AND DATE(payment_ts) < '2020-03-01'
  	GROUP BY cust.customer_id
)

SELECT 
	first_name,
	last_name
FROM customer_spends
WHERE user_spends = (
	SELECT MAX(user_spends)
  	FROM customer_spends
)