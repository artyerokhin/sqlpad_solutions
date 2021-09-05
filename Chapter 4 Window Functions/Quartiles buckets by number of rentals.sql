WITH cust_rentals AS (
    SELECT C.customer_id, 
    MAX(C.store_id) AS store_id, -- one customer can only belong to one store
    COUNT(*) AS num_rentals FROM 
    rental R
    INNER JOIN customer C ON C.customer_id = R.customer_id
    GROUP BY C.customer_id
),
quartiles AS
(
	SELECT
		customer_id,
		store_id,
		NTILE(4) OVER (ORDER BY num_rentals) as quartile
	FROM cust_rentals
)

SELECT * 
FROM quartiles
WHERE customer_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
