WITH date_counts AS 
(
	SELECT 
  		DATE(rental_ts) AS date,
  		COUNT(rental_id) as rental_count
  	FROM rental
  	WHERE rental_ts >= '2020-05-01 00:00:00'
  	AND rental_ts < '2020-06-01 00:00:00'
  	GROUP BY DATE(rental_ts)	
),
date_types AS 
(
	SELECT CASE 
  	WHEN rental_count > 100 
  	THEN 1
  	ELSE 0
  	END date_type
 	FROM date_counts
)

SELECT 
	SUM(date_type) AS good_days,
	31 - SUM(date_type) AS bad_days
FROM date_types