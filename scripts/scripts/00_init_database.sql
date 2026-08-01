/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- Create the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;
-- Create Schemas
CREATE SCHEMA gold;

CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);


CREATE TABLE gold.dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);


CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int 
);

/*
===============================================================================
STEP 1: INITIAL DATA LOADING (RAW INGESTION)
===============================================================================
Script Purpose:
    This script prepares the database for the manual Import/Export wizard.
    It drops old tables and creates fresh structures to receive the raw data.

**NOTE: 
    STORED PROCEDURES / SERVER-SIDE 'COPY' COMMANDS ARE NOT USED HERE.
    Due to local laptop server permission restrictions, automated scripts cannot
    access local directory paths. Data must be imported using the GUI wizard.

 Load Data in pgAdmin:
    1.  create the 6 empty tables.
    3. Select 'Import/Export data...'.
    4. Set the toggle to 'Import', select your CSV file, and choose 'CSV' format.
    5. Turn on the 'Header' option and click 'OK'.
===============================================================================
*/
