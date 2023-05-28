SELECT status, COUNT(*) as count
FROM Request
WHERE date >= '2023-01-01' AND date <= '2023-03-31'
GROUP BY status;
