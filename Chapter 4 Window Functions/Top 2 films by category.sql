WITH film_category_amount AS
  (SELECT cat.name,
          inv.film_id,
          SUM(amount) AS revenue
   FROM payment pay
   JOIN rental rent ON pay.rental_id = rent.rental_id
   JOIN inventory inv ON rent.inventory_id = inv.inventory_id
   JOIN film_category fc ON fc.film_id = inv.film_id
   JOIN category cat ON fc.category_id = cat.category_id
   GROUP BY cat.name,
            inv.film_id),
     film_category_row AS
  (SELECT name,
          film_id,
          revenue,
          RANK() OVER (PARTITION BY name
                       ORDER BY revenue DESC) AS row_num
   FROM film_category_amount)

SELECT *
FROM film_category_row
WHERE row_num IN (1, 2)