WITH actor_count AS 
(
	SELECT 
  		title,
  		COUNT(actor_id) as actors_cnt
  	FROM film f
  	JOIN film_actor fa
  	ON f.film_id = fa.film_id
  	GROUP BY title
)

SELECT title
FROM actor_count
WHERE actors_cnt >= 10