CREATE TABLE online_sales (
    invoice_no VARCHAR(20),
    invoice_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(10,2)
);
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    state VARCHAR(50),
    city VARCHAR(50)
);
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'D:/New folder/Uploads/Cleaned_Ecommerce_Dataset.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(invoice_no, invoice_date, quantity, unit_price, amount);
ALTER TABLE online_sales
MODIFY COLUMN amount DECIMAL(15, 4);
SELECT
    YEAR(invoice_date) AS order_year,
    MONTH(invoice_date) AS order_month,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    YEAR(invoice_date), MONTH(invoice_date)
ORDER BY
    order_year, order_month;
    SELECT
    YEAR(invoice_date) AS order_year,
    MONTH(invoice_date) AS order_month,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    YEAR(invoice_date), MONTH(invoice_date)
ORDER BY
    order_year, order_month;
    SELECT
    YEAR(invoice_date) AS order_year,
    MONTH(invoice_date) AS order_month,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    YEAR(invoice_date), MONTH(invoice_date)
ORDER BY
    total_revenue DESC
LIMIT 3;
SELECT
    invoice_date,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    invoice_date
ORDER BY
    invoice_date;
    SELECT
    invoice_date,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    invoice_date
ORDER BY
    invoice_date;