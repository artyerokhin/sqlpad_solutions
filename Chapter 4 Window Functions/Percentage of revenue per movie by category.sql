SELECT film_id,
       category_name,
       100 * film_revenue / category_revenue AS revenue_percent_category
FROM
  (SELECT film_id,
          category_name,
          SUM(revenue) OVER (PARTITION BY film_id) AS film_revenue,
                            SUM(revenue) OVER (PARTITION BY category_name) AS category_revenue
   FROM
     (SELECT i.film_id,
             c.name AS category_name,
             SUM(p.amount) AS revenue
      FROM rental r
      JOIN inventory i ON r.inventory_id = i.inventory_id
      JOIN payment p ON r.rental_id = p.rental_id
      JOIN film_category fc ON fc.film_id = i.film_id
      JOIN category c ON fc.category_id = c.category_id
      GROUP BY i.film_id,
               category_name) AS subq) AS win_subq
WHERE win_subq.film_id <= 10