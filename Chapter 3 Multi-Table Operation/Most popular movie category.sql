WITH cat_count AS 
(
  SELECT category_id, COUNT(film_id) as n_films
  FROM film_category
  GROUP BY category_id
) 

SELECT c.name
FROM cat_count cc
JOIN category c
ON c.category_id = cc.category_id
ORDER BY cc.n_films DESC
LIMIT 1