WITH customer_rentals AS 
(
	SELECT 
		customer_id, 
		rental_ts,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_ts ASC) as rental_num
	FROM rental
),
rental_diff AS 
(
	SELECT 
		first.customer_id,
		EXTRACT(DAYS FROM tenth.rental_ts - first.rental_ts) AS n_days
  	FROM customer_rentals first
  	JOIN customer_rentals tenth ON first.customer_id = tenth.customer_id
  	WHERE first.rental_num = 1
  	AND tenth.rental_num = 10
)

SELECT ROUND(AVG(n_days))
FROM rental_diff