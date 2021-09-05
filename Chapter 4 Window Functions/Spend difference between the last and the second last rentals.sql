WITH num_table AS 
(
	SELECT 
  		customer_id, 
  		payment_ts,
  		amount,
  		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY payment_ts DESC) as row_num
 	FROM payment
  	WHERE customer_id IN (1,2,3,4,5,6,7,8,9,10)
),
lag_table AS 
(
	SELECT 
  		customer_id, 
  		amount,
  		LEAD(amount) OVER (PARTITION BY customer_id ORDER BY payment_ts DESC) as lead_amount
  	FROM num_table
  	WHERE row_num IN (1, 2)
  	ORDER BY payment_ts DESC
)

SELECT 
	customer_id, 
	amount - lead_amount AS delta
FROM lag_table
WHERE lead_amount IS NOT NULL
ORDER BY customer_id