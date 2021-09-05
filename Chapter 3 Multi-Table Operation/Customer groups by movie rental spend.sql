WITH customer_amount AS 
(
	SELECT 
  		cust.customer_id,
  		CASE 
  			WHEN SUM(amount) < 100 THEN 'low'
  			WHEN SUM(amount) >= 100 AND SUM(amount) < 150 THEN 'medium'
  			WHEN SUM(amount) >= 150 THEN 'high'
  		END customer_group
  	FROM customer cust
  	LEFT JOIN payment pay ON pay.customer_id = cust.customer_id
  	GROUP BY cust.customer_id
)

SELECT 
	customer_group, 
	COUNT(customer_id)
FROM customer_amount
GROUP BY customer_group