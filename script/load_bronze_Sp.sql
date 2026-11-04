
CREATE OR ALTER PROCEDURE bronze.sp_load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    /* ============================================================
       BRONZE LAYER - FULL LOAD
       Purpose : Load CSV files into Bronze tables
       Method  : TRUNCATE + BULK INSERT
       ============================================================ */

    DECLARE @FullLoadStartTime DATETIME2(3) = SYSDATETIME();
    DECLARE @FullLoadEndTime DATETIME2(3);

    DECLARE @TableStartTime DATETIME2(3);
    DECLARE @TableEndTime DATETIME2(3);

    DECLARE @RowsLoaded INT;
    DECLARE @TableDurationMs BIGINT;

    PRINT '============================================================';
    PRINT '              BRONZE LAYER LOAD STARTED';
    PRINT '============================================================';
    PRINT 'Start Time: ' + CONVERT(VARCHAR(23), @FullLoadStartTime, 121);


    BEGIN TRY

        /* ========================================================
           1. CRM - CUSTOMER INFORMATION
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.crm_cust_info';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM '/var/opt/mssql/data/DataSets/Crm_info/cust_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           2. CRM - PRODUCT INFORMATION
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.crm_prd_info';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM '/var/opt/mssql/data/DataSets/Crm_info/prd_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           3. CRM - SALES DETAILS
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.crm_sales_details';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM '/var/opt/mssql/data/DataSets/Crm_info/sales_details.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           4. ERP - LOCATION INFORMATION
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.erp_loc_a101';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM '/var/opt/mssql/data/DataSets/Erp_info/loc_a101.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           5. ERP - CUSTOMER INFORMATION
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.erp_cust_az12';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM '/var/opt/mssql/data/DataSets/Erp_info/cust_az12.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           6. ERP - PRODUCT CATEGORY INFORMATION
           ======================================================== */

        SET @TableStartTime = SYSDATETIME();

        PRINT '';
        PRINT '------------------------------------------------------------';
        PRINT 'Loading: bronze.erp_px_cat_g1v2';
        PRINT '------------------------------------------------------------';

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM '/var/opt/mssql/data/DataSets/Erp_info/px_cat_g1v2.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );

        SET @RowsLoaded = @@ROWCOUNT;
        SET @TableEndTime = SYSDATETIME();
        SET @TableDurationMs = DATEDIFF_BIG(MILLISECOND, @TableStartTime, @TableEndTime);

        PRINT 'Status       : SUCCESS';
        PRINT 'Rows Loaded  : ' + CAST(@RowsLoaded AS VARCHAR(20));
        PRINT 'Start Time   : ' + CONVERT(VARCHAR(23), @TableStartTime, 121);
        PRINT 'End Time     : ' + CONVERT(VARCHAR(23), @TableEndTime, 121);
        PRINT 'Duration     : ' + CAST(@TableDurationMs AS VARCHAR(20)) + ' ms';


        /* ========================================================
           FULL LOAD SUMMARY
           ======================================================== */

        SET @FullLoadEndTime = SYSDATETIME();

        PRINT '';
        PRINT '============================================================';
        PRINT '          BRONZE LAYER LOAD COMPLETED SUCCESSFULLY';
        PRINT '============================================================';
        PRINT 'Start Time        : ' + CONVERT(VARCHAR(23), @FullLoadStartTime, 121);
        PRINT 'End Time          : ' + CONVERT(VARCHAR(23), @FullLoadEndTime, 121);
        PRINT 'Total Duration    : '
            + CAST(DATEDIFF_BIG(MILLISECOND, @FullLoadStartTime, @FullLoadEndTime) AS VARCHAR(30))
            + ' ms';
        PRINT '============================================================';

    END TRY

    BEGIN CATCH

        SET @FullLoadEndTime = SYSDATETIME();

        PRINT '';
        PRINT '============================================================';
        PRINT '                BRONZE LAYER LOAD FAILED';
        PRINT '============================================================';
        PRINT 'Error Number  : ' + CAST(ERROR_NUMBER() AS VARCHAR(20));
        PRINT 'Error Message : ' + ERROR_MESSAGE();
        PRINT 'Error Line    : ' + CAST(ERROR_LINE() AS VARCHAR(20));
        PRINT 'Failed Time   : ' + CONVERT(VARCHAR(23), SYSDATETIME(), 121);
        PRINT 'Elapsed Time  : '
            + CAST(DATEDIFF_BIG(MILLISECOND, @FullLoadStartTime, @FullLoadEndTime) AS VARCHAR(30))
            + ' ms';
        PRINT '============================================================';

        THROW;

    END CATCH

END;
