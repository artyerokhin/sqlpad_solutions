WITH more_than_on_transaction AS 
(
	SELECT customer_id
  	FROM payment
  	GROUP BY customer_id
  	HAVING COUNT(payment_id) > 1 
  	AND customer_id in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  
),
first_transactions AS 
(
	SELECT 
  		customer_id, 
  		amount, 
  		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY payment_ts) as row_num
  	FROM payment
),
lag_data AS 
(
  	SELECT 
		ft.customer_id,
		amount - LAG(amount, 1) OVER (PARTITION BY ft.customer_id ORDER BY ft.row_num DESC) as delta
	FROM first_transactions ft
	JOIN more_than_on_transaction mt ON ft.customer_id = mt.customer_id
	WHERE row_num <= 2
)

SELECT * 
FROM lag_data