WITH film_categories AS 
(
	SELECT 
  		CASE 
  			WHEN length < 60 THEN 'short'
  			WHEN length >= 60 AND length < 100 THEN 'medium'
  			WHEN length >= 100 THEN 'long'
  		END film_category
  	FROM film
)

SELECT 
	film_category,
	COUNT(film_category)
FROM film_categories
GROUP BY film_category