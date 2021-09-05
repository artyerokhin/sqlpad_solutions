WITH actor_cat AS 
(
  SELECT 
	CASE WHEN first_name LIKE 'A%' THEN 'a_actors'
	WHEN first_name LIKE 'B%' THEN 'b_actors'
	WHEN first_name LIKE 'C%' THEN 'c_actors'
	ELSE 'other_actors' END AS actor_category 
  FROM actor
)

SELECT 
	actor_category,
	COUNT(actor_category) AS count
FROM actor_cat
GROUP BY actor_category