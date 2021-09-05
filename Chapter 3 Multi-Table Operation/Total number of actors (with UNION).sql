SELECT COUNT(DISTINCT(actor_id)) 
FROM
(
	SELECT *
	FROM actor_movie
	UNION (SELECT * FROM actor_tv)
) subq