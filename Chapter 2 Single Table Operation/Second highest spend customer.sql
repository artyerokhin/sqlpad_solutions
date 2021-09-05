WITH customer_spends AS
(
	SELECT 
  		pay.customer_id,
  		cust.first_name,
  		cust.last_name,
  		SUM(amount) as spends
  	FROM payment pay
  	JOIN customer cust
  	ON pay.customer_id = cust.customer_id
  	WHERE DATE(payment_ts) >= '2020-05-01'
  	AND DATE(payment_ts) < '2020-06-01'
  	GROUP BY pay.customer_id, cust.first_name, cust.last_name
),
customer_rank AS 
(
	SELECT 
  		first_name,
  		last_name,
  		RANK() OVER(ORDER BY spends DESC) as rank
  	FROM customer_spends  		
)

SELECT 
	first_name,
	last_name
FROM customer_rank
WHERE rank = 2