# Credit Card Fraud Analytics on AWS (Athena + S3 + Power BI)

## Project Overview
This project implements a **cloud-based fraud analytics pipeline** using real credit card transaction data.  
It demonstrates how raw financial data can be ingested into AWS, queried with serverless SQL (Athena), and visualized in Power BI for fraud investigation and business reporting.

The system mirrors how fintech and banks monitor fraud in production.

---

## Architecture

CSV Dataset
↓
Amazon S3 (Data Lake)
↓
Amazon Athena (SQL Engine)
↓
ODBC Connector
↓
Power BI Dashboard

---

## What this project shows

| Skill | Demonstrated |
|------|-------------|
| Cloud data lake | Amazon S3 |
| Serverless analytics | Amazon Athena |
| SQL analytics | Fraud KPIs, segmentation, profiling |
| BI integration | Power BI via Athena ODBC |
| Data engineering | Schema design, partitions, bucketed metrics |
| Business reporting | Fraud rate, hourly risk, amount-based risk |

---

## Dataset
Public **Credit Card Fraud Detection Dataset**  
- 284,807 transactions  
- 492 fraud cases  
- 28 anonymized PCA features (V1–V28)  
- Amount, Time, Class (fraud flag)

---

## Storage Layer – Amazon S3

Raw CSV files were uploaded to:
s3://fraud-data-kanika/raw/


S3 acts as the **data lake** storing immutable transaction history.

---

## 🗄 Query Layer – Amazon Athena

An external table was created directly on S3:

```sql
CREATE EXTERNAL TABLE fraud_db.transactions (
    Time DOUBLE,
    V1 DOUBLE, V2 DOUBLE, V3 DOUBLE, V4 DOUBLE, V5 DOUBLE,
    V6 DOUBLE, V7 DOUBLE, V8 DOUBLE, V9 DOUBLE, V10 DOUBLE,
    V11 DOUBLE, V12 DOUBLE, V13 DOUBLE, V14 DOUBLE, V15 DOUBLE,
    V16 DOUBLE, V17 DOUBLE, V18 DOUBLE, V19 DOUBLE, V20 DOUBLE,
    V21 DOUBLE, V22 DOUBLE, V23 DOUBLE, V24 DOUBLE, V25 DOUBLE,
    V26 DOUBLE, V27 DOUBLE, V28 DOUBLE,
    Amount DOUBLE,
    Class INT,
    hour DOUBLE,
    amount_bucket STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'separatorChar' = ',',
  'quoteChar' = '"',
  'skip.header.line.count'='1'
)
LOCATION 's3://fraud-data-kanika/raw/';

```

## Core Fraud Metrics

Overall fraud rate

```sql

SELECT 
    COUNT(*) AS total_transactions,
    SUM(Class) AS total_fraud,
    ROUND(SUM(Class)*100.0/COUNT(*), 4) AS fraud_percentage
FROM fraud_db.transactions;

```

Fraud by hour

```sql

SELECT 
    hour,
    COUNT(*) AS total_transactions,
    SUM(Class) AS fraud_transactions,
    ROUND(SUM(Class)*100.0/COUNT(*), 4) AS fraud_percentage
FROM fraud_db.transactions
GROUP BY hour
ORDER BY hour;

```

Fraud by transaction size

```sql

SELECT 
    amount_bucket,
    COUNT(*) AS total_transactions,
    SUM(Class) AS fraud_transactions,
    ROUND(SUM(Class)*100.0/COUNT(*), 4) AS fraud_percentage
FROM fraud_db.transactions
GROUP BY amount_bucket
ORDER BY amount_bucket;

```

Largest fraud transactions

```sql

SELECT *
FROM fraud_db.transactions
WHERE Class = 1
ORDER BY Amount DESC
LIMIT 10;

```

Statistical profile of fraud (features)

```sql

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

```

## Power BI Integration

Athena was connected to Power BI using the Athena ODBC driver with IAM authentication.

Dashboards include:

Fraud rate by hour

Fraud rate by amount bucket

Total fraud count

High-risk time windows

High-risk transaction sizes

These dashboards replicate what fraud teams use to monitor real payment systems.

## Business Value

This system answers:

When does fraud happen most?

Which transaction sizes are risky?

What is the overall fraud exposure?

What patterns distinguish fraud from normal behavior?

This is exactly how banks detect emerging fraud waves.

## Author

Kanika
MSc AI 
