SELECT city,
       SUM(amount)
FROM payment pay
JOIN customer cust ON pay.customer_id = cust.customer_id
JOIN address adr ON cust.address_id = adr.address_id
JOIN city c ON adr.city_id = c.city_id
GROUP BY city
ORDER BY SUM(amount) DESC
LIMIT 5