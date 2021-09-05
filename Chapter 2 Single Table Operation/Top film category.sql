SELECT 
	category_id,
	COUNT(film_id) AS film_cnt
FROM film_category
GROUP BY category_id
ORDER BY COUNT(film_id) DESC
LIMIT 1