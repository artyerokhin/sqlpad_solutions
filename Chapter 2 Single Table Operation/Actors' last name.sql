SELECT 
	last_name,
	COUNT(last_name)
FROM actor
WHERE last_name IN ('DAVIS', 'BRODY', 'ALLEN', 'BERRY')
GROUP BY last_name