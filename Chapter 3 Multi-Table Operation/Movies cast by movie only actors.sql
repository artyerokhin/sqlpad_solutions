WITH tv_actors_movies AS 
(
	SELECT film_id
  	FROM film_actor fa
  	JOIN actor_tv atv ON fa.actor_id = atv.actor_id
)

SELECT film_id
FROM film
WHERE film_id NOT IN 
(
  SELECT * FROM tv_actors_movies
)