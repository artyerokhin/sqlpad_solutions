WITH day_types AS 
(
	SELECT 
  		DATE(rental_ts),
  		CASE
  			WHEN COUNT(rental_id) < 100 THEN 'slow'
  			WHEN COUNT(rental_id) >= 100 THEN 'busy'
  		END date_category
  	FROM rental
  	GROUP BY DATE(rental_ts)
)

SELECT COALESCE(date_category, 'slow') AS date_category,
       COUNT(d.date)
FROM dates d
LEFT JOIN day_types dt ON d.date = dt.date
WHERE YEAR = 2020
  AND MONTH = 5
GROUP BY COALESCE(date_category, 'slow')