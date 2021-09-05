SELECT first_name,
       last_name
FROM staff
WHERE picture IS NULL
LIMIT 1;