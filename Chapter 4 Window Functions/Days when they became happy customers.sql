SELECT customer_id, date
FROM
  (
SELECT 
  	customer_id, 
	DATE(rental_ts) as date, 
	ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY DATE(rental_ts)) as row_number
  FROM rental
  WHERE customer_id in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
) subq
WHERE row_number = 10