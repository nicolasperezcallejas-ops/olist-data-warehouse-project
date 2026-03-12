CREATE WAREHOUSE olist_wh
WITH WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE;

CREATE DATABASE olist_dw;

USE DATABASE olist_dw;

CREATE SCHEMA olist_schema;

USE WAREHOUSE olist_wh;
USE SCHEMA olist_schema;

CREATE OR REPLACE TABLE dim_customers (
    customer_key INTEGER,
    customer_id STRING,
    customer_unique_id STRING,
    customer_zip_code_prefix INTEGER,
    customer_city STRING,
    customer_state STRING
);

CREATE OR REPLACE TABLE dim_products (
    product_key INTEGER,
    product_id STRING,
    product_category_name STRING,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT,
    product_photos_qty INTEGER
);

CREATE OR REPLACE TABLE dim_sellers (
    seller_key INTEGER,
    seller_id STRING,
    seller_zip_code_prefix INTEGER,
    seller_city STRING,
    seller_state STRING
);

CREATE OR REPLACE TABLE dim_date (
    date_key INTEGER,
    full_date DATE,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name STRING,
    day INTEGER
);

CREATE OR REPLACE TABLE fact_sales (
    order_id STRING,
    order_item_id INTEGER,
    order_date_key INTEGER,
    customer_key INTEGER,
    product_key INTEGER,
    seller_key INTEGER,
    order_status STRING,
    price FLOAT,
    freight_value FLOAT,
    total_value FLOAT,
    delivery_days FLOAT,
    delay_days FLOAT
);

CREATE OR REPLACE TABLE fact_reviews (
    review_id STRING,
    order_id STRING,
    review_date_key INTEGER,
    customer_key INTEGER,
    review_score INTEGER,
    order_status STRING,
    delivery_days FLOAT,
    delay_days FLOAT
);



SELECT COUNT(*) FROM DIM_CUSTOMERS;
SELECT COUNT(*) FROM DIM_PRODUCTS;
SELECT COUNT(*) FROM DIM_SELLERS;
SELECT COUNT(*) FROM DIM_DATE;
SELECT COUNT(*) FROM FACT_SALES;
SELECT COUNT(*) FROM FACT_REVIEWS;


SELECT * FROM FACT_SALES LIMIT 10;
SELECT * FROM FACT_REVIEWS LIMIT 10;



SELECT 
    SUM(total_value) AS total_sales
FROM fact_sales;


SELECT 
    AVG(review_score) AS avg_review
FROM fact_reviews;
