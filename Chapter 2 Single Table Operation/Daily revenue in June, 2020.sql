SELECT DATE(payment_ts) AS dt,
       SUM(amount) AS SUM
FROM payment
WHERE DATE(payment_ts) <= '2020-06-30'
  AND DATE(payment_ts) >= '2020-06-01'
GROUP BY DATE(payment_ts);