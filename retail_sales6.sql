USE DATABASE ENTERPRISE_DB;
USE SCHEMA SALES_SCHEMA;

CREATE OR REPLACE TABLE DIM_STATE (
    STATE_ID NUMBER PRIMARY KEY,
    STATE_NAME VARCHAR,
    REGION_ID NUMBER
);

CREATE OR REPLACE TABLE DIM_REGION (
    REGION_ID NUMBER PRIMARY KEY,
    REGION_NAME VARCHAR
);

CREATE OR REPLACE TABLE DIM_CITY (
    CITY_ID NUMBER PRIMARY KEY,
    CITY_NAME VARCHAR,
    STATE_ID NUMBER
);

CREATE OR REPLACE TABLE DIM_CATEGORY (
    CATEGORY_ID NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR
);

CREATE OR REPLACE TABLE DIM_BRAND (
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR,
    CATEGORY_ID NUMBER
);
CREATE OR REPLACE TABLE DIM_YEAR (
    YEAR_ID NUMBER PRIMARY KEY,
    YEAR NUMBER
);
CREATE OR REPLACE TABLE DIM_QUARTER (
    QUARTER_ID NUMBER PRIMARY KEY,
    QUARTER_NAME VARCHAR,
    YEAR_ID NUMBER
);
CREATE OR REPLACE TABLE DIM_MONTH (
    MONTH_ID NUMBER PRIMARY KEY,
    MONTH_NAME VARCHAR,
    QUARTER_ID NUMBER
);

CREATE OR REPLACE TABLE DIM_PRODUCT (
    PRODUCT_ID NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR,
    BRAND_ID NUMBER,
    PRICE NUMBER(12,2)
);

CREATE OR REPLACE TABLE DIM_BRANCH (
    BRANCH_ID NUMBER PRIMARY KEY,
    BRANCH_NAME VARCHAR,
    CITY_ID NUMBER,
    MANAGER_NAME VARCHAR
);

CREATE OR REPLACE TABLE DIM_DATE (
    DATE_ID NUMBER PRIMARY KEY,
    DATE_VALUE DATE,
    DAY NUMBER,
    DAY_NAME VARCHAR,
    WEEK_NO NUMBER,
    MONTH_ID NUMBER,
    IS_WEEKEND VARCHAR
);

CREATE OR REPLACE TABLE FACT_SALES (
    SALE_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    PRODUCT_ID NUMBER,
    BRANCH_ID NUMBER,
    DATE_ID NUMBER,
    QUANTITY NUMBER,
    TOTAL_AMOUNT NUMBER(12,2)
);

INSERT INTO DIM_REGION VALUES
(1, 'South'),
(2, 'West'),
(3, 'North'),
(4, 'East');

select * from DIM_REGION;

INSERT INTO DIM_STATE VALUES
(1, 'Telangana', 1),
(2, 'Karnataka', 1),
(3, 'Tamil Nadu', 1),
(4, 'Maharashtra', 2),
(5, 'Delhi', 3),
(6, 'Gujarat', 2),
(7, 'West Bengal', 4),
(8, 'Rajasthan', 3),
(9, 'Kerala', 1),
(10, 'Uttar Pradesh', 3);

INSERT INTO DIM_CITY VALUES
(1, 'Hyderabad', 1),
(2, 'Bangalore', 2),
(3, 'Chennai', 3),
(4, 'Mumbai', 4),
(5, 'Delhi', 5),
(6, 'Ahmedabad', 6),
(7, 'Kolkata', 7),
(8, 'Jaipur', 8),
(9, 'Kochi', 9),
(10, 'Lucknow', 10),
(11, 'Vijayawada', 1),
(12, 'Warangal', 1),
(13, 'Visakhapatnam', 1),
(14, 'Coimbatore', 3),
(15, 'Patna', 11),
(16, 'Bhopal', 12),
(17, 'Chandigarh', 13),
(18, 'Mysore', 2),
(19, 'Nagpur', 4),
(20, 'Thiruvananthapuram', 9);

INSERT INTO DIM_CATEGORY VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Office Equipment'),
(4, 'Networking'),
(5, 'Storage'),
(6, 'Mobile Accessories');

INSERT INTO DIM_BRAND VALUES
(1, 'Dell', 1),
(2, 'Samsung', 1),
(3, 'Apple', 1),
(4, 'LG', 1),
(5, 'Logitech', 2),
(6, 'HP', 2),
(7, 'Sony', 2),
(8, 'JBL', 2),
(9, 'Canon', 3),
(10, 'Epson', 3),
(11, 'TP-Link', 4),
(12, 'Cisco', 4),
(13, 'Seagate', 5),
(14, 'SanDisk', 5),
(15, 'Mi', 6),
(16, 'Anker', 6);

INSERT INTO DIM_PRODUCT VALUES
(101, 'Laptop', 1, 65000),
(102, 'Smartphone', 2, 28000),
(103, 'Tablet', 3, 45000),
(104, 'Monitor', 4, 18000),
(105, 'Smart Watch', 3, 22000),
(106, 'Keyboard', 5, 1800),
(107, 'Mouse', 6, 900),
(108, 'Headphones', 7, 3500),
(109, 'Speaker', 8, 5500),
(110, 'Web Camera', 5, 4200),
(111, 'Printer', 6, 15000),
(112, 'Scanner', 9, 12000),
(113, 'Projector', 10, 48000),
(114, 'Router', 11, 3200),
(115, 'Network Switch', 12, 12500),
(116, 'External SSD', 2, 9500),
(117, 'Hard Disk', 13, 6500),
(118, 'USB Pen Drive', 14, 1200),
(119, 'Power Bank', 15, 1800),
(120, 'Wireless Charger', 16, 2500);

INSERT INTO DIM_CUSTOMER VALUES
(1, 'Amit Sharma', 1, 'Gold'),
(2, 'Priya Singh', 2, 'Silver'),
(3, 'Rahul Verma', 3, 'Gold'),
(4, 'Neha Patel', 6, 'Silver'),
(5, 'Arjun Gupta', 5, 'Platinum'),
(6, 'Kiran Kumar', 11, 'Gold'),
(7, 'Suresh Reddy', 12, 'Silver'),
(8, 'Pooja Mehta', 4, 'Gold'),
(9, 'Rohit Jain', 8, 'Silver'),
(10, 'Divya Nair', 9, 'Gold'),
(11, 'Mohan Rao', 13, 'Silver'),
(12, 'Anjali Das', 7, 'Gold'),
(13, 'Naveen Yadav', 10, 'Silver'),
(14, 'Sneha Iyer', 14, 'Gold'),
(15, 'Rakesh Mishra', 15, 'Platinum'),
(16, 'Kavya Rani', 16, 'Silver'),
(17, 'Varun Kapoor', 17, 'Gold'),
(18, 'Swathi Rao', 18, 'Silver'),
(19, 'Nikhil Joshi', 19, 'Gold'),
(20, 'Meera Thomas', 20, 'Platinum');

INSERT INTO DIM_BRANCH VALUES
(1, 'Hyderabad Central', 1, 'Rajesh Kumar'),
(2, 'Bangalore Tech Park', 2, 'Priya Nair'),
(3, 'Chennai City Mall', 3, 'Suresh Reddy'),
(4, 'Mumbai Business Hub', 4, 'Anita Sharma'),
(5, 'Delhi Connaught Place', 5, 'Rahul Verma'),
(6, 'Ahmedabad Plaza', 6, 'Kiran Patel'),
(7, 'Kolkata City Center', 7, 'Subhash Das'),
(8, 'Jaipur Pink Square', 8, 'Neha Gupta'),
(9, 'Kochi Metro Mall', 9, 'Arun Thomas'),
(10, 'Lucknow Galleria', 10, 'Vivek Mishra');

INSERT INTO DIM_YEAR VALUES
(1, 2026);

INSERT INTO DIM_QUARTER VALUES
(1, 'Q3', 1);

INSERT INTO DIM_MONTH VALUES
(1, 'July', 1);

INSERT INTO DIM_DATE VALUES
(1, '2026-07-01', 1, 'Wednesday', 27, 1, 'No'),
(2, '2026-07-02', 2, 'Thursday', 27, 1, 'No'),
(3, '2026-07-03', 3, 'Friday', 27, 1, 'No'),
(4, '2026-07-04', 4, 'Saturday', 27, 1, 'Yes'),
(5, '2026-07-05', 5, 'Sunday', 27, 1, 'Yes');

SELECT
    c.customer_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_CUSTOMER c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

SELECT COUNT(*) FROM FACT_SALES;

LIST @RETAIL_STAGE;
TRUNCATE TABLE FACT_SALES;

COPY INTO FACT_SALES
FROM @RETAIL_STAGE/sales.csv
FILE_FORMAT = RETAIL_CSV_FORMAT
ON_ERROR = 'ABORT_STATEMENT';

SELECT COUNT(*) FROM FACT_SALES;

SELECT
    c.customer_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_CUSTOMER c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

SELECT
    p.product_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_PRODUCT p
    ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

SELECT
    b.brand_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_PRODUCT p
    ON f.product_id = p.product_id
JOIN DIM_BRAND b
    ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY revenue DESC;

SELECT
    cat.category_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_PRODUCT p
    ON f.product_id = p.product_id
JOIN DIM_BRAND b
    ON p.brand_id = b.brand_id
JOIN DIM_CATEGORY cat
    ON b.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY revenue DESC;

SELECT
    br.branch_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_BRANCH br
    ON f.branch_id = br.branch_id
GROUP BY br.branch_name
ORDER BY revenue DESC;

SELECT
    s.state_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_BRANCH b
    ON f.branch_id = b.branch_id
JOIN DIM_CITY c
    ON b.city_id = c.city_id
JOIN DIM_STATE s
    ON c.state_id = s.state_id
GROUP BY s.state_name
ORDER BY revenue DESC;

SELECT
    r.region_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_BRANCH b
    ON f.branch_id = b.branch_id
JOIN DIM_CITY c
    ON b.city_id = c.city_id
JOIN DIM_STATE s
    ON c.state_id = s.state_id
JOIN DIM_REGION r
    ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY revenue DESC;

SELECT
    m.month_name,
    SUM(f.total_amount) AS revenue
FROM FACT_SALES f
JOIN DIM_DATE d
    ON f.date_id = d.date_id
JOIN DIM_MONTH m
    ON d.month_id = m.month_id
GROUP BY m.month_name
ORDER BY revenue DESC;

SELECT
    c.customer_name,
    SUM(f.total_amount) AS total_sales
FROM FACT_SALES f
JOIN DIM_CUSTOMER c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 10;
