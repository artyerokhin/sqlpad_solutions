WITH movie_cnt AS 
(
	SELECT 
  		act.actor_id,
  		first_name,
  		last_name,
  		COUNT(film_id) AS film_count
  	FROM actor act
  	JOIN film_actor fa
  	ON act.actor_id = fa.actor_id
  	GROUP BY act.actor_id
)

SELECT 
	first_name, 
	last_name
FROM movie_cnt
WHERE movie_cnt.film_count = (
  SELECT MAX(film_count)
  FROM movie_cnt
)