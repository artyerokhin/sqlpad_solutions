WITH temp_table AS (
	SELECT DISTINCT
		customer_id,
		DATE(rental_ts) as rental_date
	FROM rental
  	WHERE DATE(rental_ts) >= '2020-05-24'
  	AND DATE(rental_ts) <= '2020-05-31'
),

lag_table AS (
	SELECT customer_id,
  	rental_date,
  	LEAD(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) as lead_date
  	FROM temp_table
)

SELECT COUNT(DISTINCT(customer_id))
FROM lag_table
WHERE DATE(lag_table.lead_date) - DATE(lag_table.rental_date) <= 1
AND lag_table.lead_date IS NOT NULL