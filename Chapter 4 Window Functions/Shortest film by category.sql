SELECT *
FROM
  (SELECT film_id,
          title,
          LENGTH,
          category_name,
          ROW_NUMBER() OVER (PARTITION BY category_name
                             ORDER BY LENGTH) AS row_num
   FROM
     (SELECT f.film_id,
             f.title,
             f.length,
             c.name AS category_name
      FROM film f
      JOIN film_category fc ON f.film_id = fc.film_id
      JOIN category c ON fc.category_id = c.category_id) subq) wind_subq
WHERE row_num = 1