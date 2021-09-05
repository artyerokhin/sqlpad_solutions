WITH joined_actors AS
(
	SELECT 
  		am.actor_id AS movie_actor,
  		atv.actor_id AS film_actor
  	FROM actor_movie am
  	FULL OUTER JOIN actor_tv atv ON am.actor_id = atv.actor_id
)

SELECT COUNT(COALESCE(movie_actor, film_actor)) 
FROM joined_actors