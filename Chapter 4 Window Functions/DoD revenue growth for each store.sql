WITH store_daily_rev AS (
  SELECT 
    I.store_id, 
    DATE(P.payment_ts) date,
    SUM(amount) AS daily_rev
  FROM 
    payment P
  INNER JOIN rental R ON R.rental_id = P.rental_id
  INNER JOIN inventory I ON I.inventory_id = R.inventory_id
  WHERE DATE(P.payment_ts) >= '2020-05-01'
    AND DATE(P.payment_ts) <= '2020-05-31'
  GROUP BY I.store_id, DATE(P.payment_ts)
)

SELECT 
	store_id, 
	date,
	ROUND(100 * (daily_rev /(LAG(daily_rev, 1) OVER (PARTITION BY store_id ORDER BY date)
							) - 1)) AS dod_growth
FROM store_daily_rev