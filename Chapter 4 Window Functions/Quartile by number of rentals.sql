SELECT film_id,
       number_of_rentals,
       quartile
FROM
  (SELECT film_id,
          number_of_rentals,
          NTILE(4) OVER (
                         ORDER BY number_of_rentals) AS quartile
   FROM
     (SELECT i.film_id,
             COUNT(r.rental_id) AS number_of_rentals
      FROM rental r
      JOIN inventory i ON r.inventory_id = i.inventory_id
      GROUP BY i.film_id) subq) win_subq
WHERE film_id in (1, 10, 11, 20, 21, 30)