SELECT film_id,
       revenue_percentage
FROM
  (SELECT DISTINCT inv.film_id,
                   100 * SUM(amount) OVER (PARTITION BY inv.film_id) / SUM(amount) OVER () AS revenue_percentage
   FROM rental ren
   JOIN payment pay ON ren.rental_id = pay.rental_id
   JOIN inventory inv ON ren.inventory_id = inv.inventory_id) win
WHERE film_id <= 10