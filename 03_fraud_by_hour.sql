SELECT 
    hour,
    COUNT(*) AS total_transactions,
    SUM(Class) AS fraud_transactions,
    ROUND(SUM(Class)*100.0/COUNT(*), 4) AS fraud_percentage
FROM fraud_db.transactions
GROUP BY hour
ORDER BY hour;
