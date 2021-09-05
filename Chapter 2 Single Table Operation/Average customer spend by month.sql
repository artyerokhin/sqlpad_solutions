SELECT 
	EXTRACT(YEAR from payment_ts) AS year,
	EXTRACT(MONTH from payment_ts) AS mon,
	SUM(amount) / COUNT(DISTINCT(customer_id)) AS avg_spend
FROM payment
GROUP BY year, mon;