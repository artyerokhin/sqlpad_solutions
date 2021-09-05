SELECT 
	ac.first_name,
	ac.last_name
FROM film fm
JOIN film_actor fa
ON fm.film_id = fa.film_id
JOIN actor ac
ON ac.actor_id = fa.actor_id
WHERE fm.title = 'AFRICAN EGG'