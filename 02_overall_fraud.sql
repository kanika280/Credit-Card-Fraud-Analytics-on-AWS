SELECT 
    COUNT(*) AS total_transactions,
    SUM(Class) AS total_fraud,
    ROUND(SUM(Class)*100.0/COUNT(*), 4) AS fraud_percentage
FROM fraud_db.transactions;
