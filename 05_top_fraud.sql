SELECT *
FROM fraud_db.transactions
WHERE Class = 1
ORDER BY Amount DESC
LIMIT 10;
