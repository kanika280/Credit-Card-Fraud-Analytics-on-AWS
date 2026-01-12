CREATE EXTERNAL TABLE fraud_db.transactions (
    Time DOUBLE,
    V1 DOUBLE,
    V2 DOUBLE,
    V3 DOUBLE,
    V4 DOUBLE,
    V5 DOUBLE,
    V6 DOUBLE,
    V7 DOUBLE,
    V8 DOUBLE,
    V9 DOUBLE,
    V10 DOUBLE,
    V11 DOUBLE,
    V12 DOUBLE,
    V13 DOUBLE,
    V14 DOUBLE,
    V15 DOUBLE,
    V16 DOUBLE,
    V17 DOUBLE,
    V18 DOUBLE,
    V19 DOUBLE,
    V20 DOUBLE,
    V21 DOUBLE,
    V22 DOUBLE,
    V23 DOUBLE,
    V24 DOUBLE,
    V25 DOUBLE,
    V26 DOUBLE,
    V27 DOUBLE,
    V28 DOUBLE,
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
