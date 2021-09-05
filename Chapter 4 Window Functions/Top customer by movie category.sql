WITH cust_revenue_by_cat AS
  (SELECT P.customer_id,
          FC.category_id,
          SUM(P.amount) AS revenue
   FROM payment P
   INNER JOIN rental R ON R.rental_id = P.rental_id
   INNER JOIN inventory I ON I.inventory_id = R.inventory_id
   INNER JOIN film F ON F.film_id = I.film_id
   INNER JOIN film_category FC ON FC.film_id = F.film_id
   GROUP BY P.customer_id,
            FC.category_id),
cust_rankings AS
  (SELECT category_id,
          customer_id,
          RANK() OVER (PARTITION BY category_id
                       ORDER BY revenue DESC) AS rank
   FROM cust_revenue_by_cat)

SELECT category_id,
       customer_id
FROM cust_rankings
WHERE rank = 1