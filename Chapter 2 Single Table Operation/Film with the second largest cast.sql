WITH n_actors AS
(
  SELECT 
	  f.title,
	  COUNT(actor_id) as cast_count
  FROM film f
  JOIN film_actor fa
  ON f.film_id = fa.film_id
  GROUP BY f.title
),
rank_actors AS
(
	SELECT 
  		title,
  		ROW_NUMBER() OVER (ORDER BY cast_count DESC) as row_n
  	FROM n_actors
)

SELECT title 
FROM rank_actors
WHERE row_n = 2