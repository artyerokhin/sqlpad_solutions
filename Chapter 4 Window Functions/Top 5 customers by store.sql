WITH customer_spends AS 
(
	SELECT 
  		c.store_id,
  		c.customer_id,
  		SUM(p.amount) AS revenue
  	FROM payment p
  	JOIN customer c ON p.customer_id = c.customer_id
  	GROUP BY c.store_id, c.customer_id
),
customer_ranks AS 
(
	SELECT 
		store_id,
		customer_id,
		revenue,
		DENSE_RANK() OVER (PARTITION BY store_id ORDER BY revenue DESC) AS ranking
	FROM customer_spends
)

SELECT * 
FROM customer_ranks
WHERE ranking <= 5