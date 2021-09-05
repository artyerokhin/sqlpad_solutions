WITH movie_rev_by_cat AS
  (SELECT F.film_id,
          MAX(FC.category_id) AS category_id,
          SUM(P.amount) AS revenue
   FROM film F
   INNER JOIN inventory I ON I.film_id = F.film_id
   INNER JOIN rental R ON R.inventory_id = I.inventory_id
   INNER JOIN payment P ON P.rental_id = R.rental_id
   INNER JOIN film_category FC ON FC.film_id = F.film_id
   GROUP BY F.film_id),
     film_cat_percentile AS
  (SELECT film_id,
          NTILE(100) OVER (PARTITION BY category_id
                           ORDER BY revenue ASC) AS perc_by_cat
   FROM movie_rev_by_cat)
SELECT *
FROM film_cat_percentile
WHERE film_id IN (1, 2, 3, 4, 5)