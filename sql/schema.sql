-- created database, tables and loaded data from CSV file
-- (CSV files are downloaded from Kaggle https://www.kaggle.com/datasets/bytadit/ecommerce-order-dataset)


-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_orders_data;
USE ecommerce_orders_data;


-- Step 2: Create Tables with Data Types and Keys
-- Table: df_customers
CREATE TABLE `df_customers` (
  `customer_id` varchar(50) NOT NULL,
  `customer_zip_code_prefix` int DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_id` (`customer_id`)
);
-- Table: df_orders
CREATE TABLE `df_orders` (
  `order_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `order_purchase_timestamp` datetime DEFAULT NULL,
  `order_approved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `df_customers` (`customer_id`)
);
-- Table: df_products
CREATE TABLE `df_products` (
  `product_id` varchar(50) DEFAULT NULL,
  `product_category_name` varchar(50) DEFAULT NULL,
  `product_weight_g` double DEFAULT NULL,
  `product_length_cm` double DEFAULT NULL,
  `product_height_cm` double DEFAULT NULL,
  `product_width_cm` double DEFAULT NULL
);
-- Table: df_orderitems
CREATE TABLE `df_orderitems` (
  `order_id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `shipping_charges` double DEFAULT NULL,
  KEY `order_id_fk_idx` (`order_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `df_orders` (`order_id`)
);
-- Table: df_payments
CREATE TABLE `df_payments` (
  `order_id` varchar(50) DEFAULT NULL,
  `payment_sequential` int DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_installments` int DEFAULT NULL,
  `payment_value` double DEFAULT NULL,
  KEY `order_id_fk2_idx` (`order_id`),
  CONSTRAINT `order_id_fk2` FOREIGN KEY (`order_id`) REFERENCES `df_orders` (`order_id`)
);


-- Step 3: Load Data from CSV Files
-- (CSV files are downloaded from Kaggle https://www.kaggle.com/datasets/bytadit/ecommerce-order-dataset)

-- Loading Data: df_Customers
LOAD DATA INFILE 'D:/Ecommerce Order Dataset/test/df_Customers.csv'
INTO TABLE df_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Loading Data: df_Orders
LOAD DATA INFILE 'D:/Ecommerce Order Dataset/test/df_Orders.csv'
INTO TABLE df_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Loading Data: df_Products
LOAD DATA INFILE 'D:/Ecommerce Order Dataset/test/df_Products.csv'
INTO TABLE df_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Loading Data: df_OrderItems
LOAD DATA INFILE 'D:/Ecommerce Order Dataset/test/df_OrderItems.csv'
INTO TABLE df_orderitems
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Loading Data: df_Payments
LOAD DATA INFILE 'D:/Ecommerce Order Dataset/test/df_Payments.csv'
INTO TABLE df_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;





