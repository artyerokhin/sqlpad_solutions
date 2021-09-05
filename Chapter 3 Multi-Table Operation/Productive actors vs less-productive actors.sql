WITH actor_categories AS 
(
	SELECT 
  		a.actor_id,
  		CASE
  			WHEN COUNT(film_id) < 30 THEN 'less productive'
  			WHEN COUNT(film_id) >= 30 THEN 'productive'
  		END actor_category
  		--COUNT(film_id) as film_cnt
  	FROM actor a
  	LEFT JOIN film_actor fa
  	ON a.actor_id = fa.actor_id
  	GROUP BY a.actor_id
)

SELECT 
	actor_category,
	COUNT(actor_id) as count
FROM actor_categories
GROUP BY actor_category