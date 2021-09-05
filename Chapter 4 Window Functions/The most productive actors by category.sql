WITH actor_counts AS 
(
	SELECT 
  		fa.actor_id,
  		fc.category_id,
  		COUNT(fa.film_id) as num_movies
  	FROM film_actor fa
  	JOIN film_category fc ON fa.film_id = fc.film_id
  	GROUP BY fa.actor_id, fc.category_id
),
actor_ranks AS
(
	SELECT 
  		actor_id,
  		category_id,
  		num_movies,
  		RANK() OVER (PARTITION BY category_id ORDER BY num_movies DESC) as rank
	FROM actor_counts
)

SELECT 
	category_id,
	actor_id,
	num_movies
FROM actor_ranks
WHERE rank = 1