SELECT *
FROM
  (SELECT film_id,
          revenue,
          NTILE(100) OVER (
                           ORDER BY revenue) AS percentile
   FROM
     (SELECT i.film_id,
             SUM(p.amount) AS revenue
      FROM rental r
      JOIN inventory i ON r.inventory_id = i.inventory_id
      JOIN payment p ON p.rental_id = r.rental_id
      GROUP BY i.film_id) subq) win_subq
WHERE film_id in (1, 10, 11, 20, 21, 30)