use DataWarehouse

EXEC bronze.sp_load_bronze
EXEC silver.sp_load_silver 


SELECT * FROM bronze.crm_cust_info;

SELECT * FROM bronze.crm_prd_info;

SELECT * FROM bronze.crm_sales_details;

SELECT * FROM bronze.erp_loc_a101;

SELECT * FROM bronze.erp_cust_az12;

SELECT * FROM bronze.erp_px_cat_g1v2;


SELECT * FROM silver.crm_cust_info;

SELECT * FROM silver.crm_prd_info;

SELECT * FROM silver.crm_sales_details;

SELECT * FROM silver.erp_loc_a101;

SELECT * FROM silver.erp_cust_az12;

SELECT * FROM silver.erp_px_cat_g1v2;