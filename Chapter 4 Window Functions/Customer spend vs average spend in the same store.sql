WITH cust_ltv AS
  (SELECT C.customer_id,
          MAX(C.store_id) AS store_id,
          SUM(P.amount) AS ltd_spend
   FROM customer C
   LEFT JOIN payment P ON C.customer_id = P.customer_id
   GROUP BY C.customer_id),
     avg_store_ltv AS
  (SELECT customer_id,
          store_id,
          ltd_spend,
          AVG(ltd_spend) OVER (PARTITION BY store_id) AS store_avg
   FROM cust_ltv)

SELECT *
FROM avg_store_ltv
WHERE customer_id IN (1, 100, 101, 200, 201, 300, 301, 400, 401, 500)