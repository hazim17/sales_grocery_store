-- query each the table
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM prodcategory;
SELECT * FROM products;

-- Create Master Table
CREATE TABLE master_table_sales AS
SELECT
	ord.order_id,
	ord.date,
	ord.customer_id,
	cust.first_name,
	cust.last_name,
	cust.customer_email,
	cust.customer_phone,
	cust.customer_address,
	cust.customer_city,
	cust.customer_state,
	cust.customer_zip,
	ord.prod_number,
	prod.prod_name,
	prod.price,
	prod.category,
	prc.category_name,
	ord.quantity,
	prod.price * ord.quantity as purchase_total
FROM orders as ord
JOIN customers as cust
ON ord.customer_id =cust.customer_id
JOIN products as prod
ON ord.prod_number = prod.prod_number
Join prodcategory as prc
ON prod.category = prc.category_id
;