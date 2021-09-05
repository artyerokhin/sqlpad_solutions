SELECT *
FROM
  (SELECT category,
          film_id,
          revenue,
          NTILE(100) OVER (PARTITION BY category
                           ORDER BY revenue) AS percentile
   FROM
     (SELECT i.film_id,
             c.name AS category,
             SUM(p.amount) AS revenue
      FROM rental r
      JOIN inventory i ON r.inventory_id = i.inventory_id
      JOIN payment p ON p.rental_id = r.rental_id
      JOIN film_category fc ON fc.film_id = i.film_id
      JOIN category c ON c.category_id = fc.category_id
      GROUP BY i.film_id,
               c.name) subq) win_subq
WHERE film_id <= 20