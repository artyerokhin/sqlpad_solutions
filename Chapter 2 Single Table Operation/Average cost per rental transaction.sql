SELECT 
	AVG(amount)
FROM payment
WHERE DATE(payment_ts) >= '2020-05-01'
AND DATE(payment_ts) < '2020-06-01'