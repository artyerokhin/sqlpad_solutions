WITH customer_amount AS
(
	SELECT 
  		customer_id,
  		SUM(amount) AS customer_amnt
  	FROM payment
  	WHERE DATE(payment_ts) >= '2020-02-01'
  	AND DATE(payment_ts) < '2020-03-01'
  	GROUP BY customer_id
)

SELECT AVG(customer_amnt)
FROM customer_amount