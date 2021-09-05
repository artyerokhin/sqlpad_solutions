SELECT *
FROM
  (SELECT film_id,
          category_name,
          rental_cnt AS rentals,
          AVG(rental_cnt) OVER (PARTITION BY category_name) AS avg_rentals_category
   FROM
     (SELECT i.film_id,
             c.name AS category_name,
             COUNT(r.rental_id) AS rental_cnt
      FROM rental r
      JOIN inventory i ON r.inventory_id = i.inventory_id
      JOIN film_category fc ON fc.film_id = i.film_id
      JOIN category c ON fc.category_id = c.category_id
      GROUP BY i.film_id,
               category_name) AS subq) AS win_subq
WHERE win_subq.film_id <= 10