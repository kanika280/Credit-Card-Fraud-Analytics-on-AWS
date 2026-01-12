SELECT 
    AVG(V1) AS avg_V1, AVG(V2) AS avg_V2, AVG(V3) AS avg_V3,
    AVG(V4) AS avg_V4, AVG(V5) AS avg_V5, AVG(V6) AS avg_V6,
    AVG(V7) AS avg_V7, AVG(V8) AS avg_V8, AVG(V9) AS avg_V9,
    AVG(V10) AS avg_V10, AVG(V11) AS avg_V11, AVG(V12) AS avg_V12,
    AVG(V13) AS avg_V13, AVG(V14) AS avg_V14, AVG(V15) AS avg_V15,
    AVG(V16) AS avg_V16, AVG(V17) AS avg_V17, AVG(V18) AS avg_V18,
    AVG(V19) AS avg_V19, AVG(V20) AS avg_V20, AVG(V21) AS avg_V21,
    AVG(V22) AS avg_V22, AVG(V23) AS avg_V23, AVG(V24) AS avg_V24,
    AVG(V25) AS avg_V25, AVG(V26) AS avg_V26, AVG(V27) AS avg_V27,
    AVG(V28) AS avg_V28
FROM fraud_db.transactions
WHERE Class = 1;
