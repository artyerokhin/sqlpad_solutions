WITH actor_films AS 
(
	SELECT 
  		fa.actor_id,
  		first_name,
  		last_name,
  		COUNT(film_id) AS film_count
  	FROM film_actor fa
  	INNER JOIN actor act
  	ON fa.actor_id = act.actor_id
  	GROUP BY fa.actor_id, first_name, last_name
)

SELECT 
	actor_id,
	first_name,
	last_name
FROM actor_films
ORDER BY film_count DESC
LIMIT 1