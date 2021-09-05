SELECT am.actor_id,
       am.first_name,
       am.last_name
FROM actor_movie am
INNER JOIN actor_tv atv ON am.actor_id = atv.actor_id