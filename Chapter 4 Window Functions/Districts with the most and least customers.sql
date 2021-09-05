WITH customers_cnt AS 
(
	SELECT
  		address_id,
  		COUNT(customer_id) AS customers_cnt
  	FROM customer
  	GROUP BY address_id
),
district_count AS 
(
	SELECT 
  		district,
  		SUM(COALESCE(customers_cnt, 0)) as cnt
  	FROM address adr
  	LEFT JOIN
  	customers_cnt cc
  	ON adr.address_id = cc.address_id
  	GROUP BY district
),
district_cat AS
(
	SELECT district,
  		CASE
  		WHEN ROW_NUMBER() OVER (ORDER BY cnt)= 1 THEN 'least'
		WHEN ROW_NUMBER() OVER (ORDER BY cnt DESC) = 1 THEN 'most' ELSE 'NA'
    	END AS city_cat,
  		cnt
	FROM district_count
)

SELECT 
	district,
	city_cat
FROM district_cat
WHERE city_cat IN ('most', 'least')