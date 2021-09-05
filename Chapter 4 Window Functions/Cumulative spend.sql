SELECT date, customer_id,
             daily_spend,
             SUM(daily_spend) OVER (PARTITION BY customer_id
                                    ORDER BY date) AS cumulative_spend
FROM
  (SELECT DATE(payment_ts) AS date,
          customer_id,
          SUM(amount) AS daily_spend
   FROM payment
   WHERE customer_id IN (1, 2, 3)
   GROUP BY DATE(payment_ts),
            customer_id) gr