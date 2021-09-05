SELECT am.first_name,
       am.last_name
FROM actor_movie am
LEFT JOIN actor_tv atv ON am.actor_id = atv.actor_id
WHERE atv.actor_id IS NULL