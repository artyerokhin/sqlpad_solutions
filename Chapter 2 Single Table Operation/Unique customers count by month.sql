SELECT EXTRACT(YEAR FROM rental_ts) AS YEAR,
       EXTRACT(MONTH FROM rental_ts) AS mon,
       COUNT(DISTINCT(customer_id)) AS uu_cnt
FROM rental
GROUP BY YEAR, mon;