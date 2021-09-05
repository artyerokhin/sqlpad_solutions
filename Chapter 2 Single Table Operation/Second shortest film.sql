WITH ranks AS 
(
  SELECT 
	  title, 
	  RANK() OVER (ORDER BY length ASC) as rank
  FROM film
)
 
SELECT title
FROM ranks
WHERE rank = 2