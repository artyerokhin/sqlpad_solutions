WITH customer_spend AS 
(
	SELECT 
  		customer_id,
  		SUM(amount) AS total_spend
  	FROM payment
 	WHERE DATE(payment_ts) >= '2020-06-01'
  	AND DATE(payment_ts) < '2020-07-01'
  	GROUP BY customer_id
)

SELECT 
	MIN(total_spend) AS min_spend, 
	MAX(total_spend) AS max_spend
FROM customer_spend