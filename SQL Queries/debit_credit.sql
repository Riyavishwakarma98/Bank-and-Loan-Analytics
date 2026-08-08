USE bank_analytics_db;

DROP TABLE IF EXISTS debit_credit;

CREATE TABLE debit_credit (
    `Customer ID` VARCHAR(100),
    `Customer Name` VARCHAR(250),
    `Account Number` VARCHAR(100),
    `Transaction Date` DATE NULL,  
    `Transaction Type` VARCHAR(50),
    `Amount` DECIMAL(15,2) NULL,            
    `Balance` DECIMAL(15,2) NULL,           
    `Description` VARCHAR(250),
    `Branch` VARCHAR(250),
    `Transaction Method` VARCHAR(100),
    `Currency` VARCHAR(20),
    `Bank Name` VARCHAR(250)
);


SET GLOBAL local_infile = 1;

USE bank_analytics_db;

LOAD DATA LOCAL INFILE 'C:/Users/Riya/OneDrive/Desktop/Banking Project/Banking Project/Debit-Credit.csv'
INTO TABLE debit_credit
CHARACTER SET latin1 -- THIS TELLS MYSQL TO ACCEPT EXCEL'S TEXT FORMAT!
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- It will show us the exact number of rows currently sitting inside both tables:

SELECT 'banking_data' AS table_name, COUNT(*) AS row_count FROM banking_data
UNION ALL
SELECT 'debit_credit' AS table_name, COUNT(*) AS row_count FROM debit_credit;
