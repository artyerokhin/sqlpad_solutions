WITH actors_cnt AS
(
	SELECT 
		title,
  		COUNT(actor_id) as n_actors
  	FROM film_actor fa
  	JOIN film f
  	ON f.film_id = fa.film_id
  	GROUP BY title
)

SELECT 
	title
FROM actors_cnt
ORDER BY n_actors DESC
LIMIT 1