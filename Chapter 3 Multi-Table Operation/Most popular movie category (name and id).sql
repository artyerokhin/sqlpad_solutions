WITH cat_popularity AS
(
	SELECT 
  		cat.category_id, 
  		name,
  		COUNT(film_id) as popularity
  	FROM film_category fc
  	JOIN category cat
  	ON fc.category_id = cat.category_id
  	GROUP BY cat.category_id, name
)

SELECT 
	category_id,
	name
FROM cat_popularity
ORDER BY popularity DESC
LIMIT 1