SELECT EXTRACT(YEAR FROM payment_ts) AS YEAR,
       EXTRACT(MONTH FROM payment_ts) AS mon,
       SUM(amount) AS rev
FROM payment
GROUP BY YEAR, mon;