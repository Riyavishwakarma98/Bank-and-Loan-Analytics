USE bank_analytics_db;

DROP TABLE IF EXISTS banking_data;

CREATE TABLE banking_data (
    `State Abbr` VARCHAR(50),
    `Account ID` VARCHAR(50) PRIMARY KEY,
    `Age` VARCHAR(50),
    `BH Name` VARCHAR(250),
    `Bank Name` VARCHAR(250),
    `Branch Name` VARCHAR(250),
    `Caste` VARCHAR(100),
    `Center Id` VARCHAR(50),
    `City` VARCHAR(150),
    `Client id` VARCHAR(50),
    `Client Name` VARCHAR(250),
    `Close Client` VARCHAR(50),
    `Closed Date` DATE NULL,           
    `Credit Officer Name` VARCHAR(250),
    `Dateof Birth` DATE NULL,           
    `Disb By` VARCHAR(250),
    `Disbursement Date` DATE NULL,      
    `Disbursement Date (Years)` VARCHAR(50),
    `Gender ID` VARCHAR(50),
    `Home Ownership` VARCHAR(100),
    `Loan Status` VARCHAR(100),
    `Loan Transferdate` DATE NULL,      
    `NextMeetingDate` DATE NULL,         
    `Product Code` VARCHAR(100),
    `Grade` VARCHAR(50),
    `Sub Grade` VARCHAR(50),
    `Product Id` VARCHAR(50),             
    `Purpose Category` VARCHAR(250),
    `Region Name` VARCHAR(250),
    `Religion` VARCHAR(150),
    `Verification Status` VARCHAR(150),
    `State Abbr 2` VARCHAR(50),           
    `State Name` VARCHAR(150),
    `Tranfer Logic` VARCHAR(250),         
    `Is Delinquent Loan` VARCHAR(50),
    `Is Default Loan` VARCHAR(50),
    `Age_T` INT NULL,
    `Delinq 2 Yrs` INT NULL,
    `Application Type` VARCHAR(100),
    `Loan Amount` DECIMAL(15,2) NULL,
    `Funded Amount` DECIMAL(15,2) NULL,
    `Funded Amount Inv` DECIMAL(15,2) NULL,
    `Term` INT NULL,
    `Int Rate` DECIMAL(5,4) NULL,
    `Total Pymnt` DECIMAL(15,2) NULL,
    `Total Pymnt inv` DECIMAL(15,2) NULL,        
    `Total Rec Prncp` DECIMAL(15,2) NULL,
    `Total Fees` DECIMAL(15,2) NULL,
    `Total Rec int` DECIMAL(15,2) NULL,          
    `Total Rec Late fee` DECIMAL(15,2) NULL,     
    `Recoveries` DECIMAL(15,2) NULL,
    `Collection Recovery fee` DECIMAL(15,2) NULL 
);



SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

USE bank_analytics_db;

LOAD DATA LOCAL INFILE 'C:/Users/Riya/OneDrive/Desktop/Banking Project/Banking Project/Banking Data.csv' -- (make sure to use forward slashes / in the file path text)
INTO TABLE banking_data
CHARACTER SET latin1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;USE bank_analytics_db;

DROP TABLE IF EXISTS banking_data;

CREATE TABLE banking_data (
    `State Abbr` VARCHAR(50),
    `Account ID` VARCHAR(50) PRIMARY KEY,
    `Age` VARCHAR(50),
    `BH Name` VARCHAR(250),
    `Bank Name` VARCHAR(250),
    `Branch Name` VARCHAR(250),
    `Caste` VARCHAR(100),
    `Center Id` VARCHAR(50),
    `City` VARCHAR(150),
    `Client id` VARCHAR(50),
    `Client Name` VARCHAR(250),
    `Close Client` VARCHAR(50),
    `Closed Date` DATE NULL,           
    `Credit Officer Name` VARCHAR(250),
    `Dateof Birth` DATE NULL,           
    `Disb By` VARCHAR(250),
    `Disbursement Date` DATE NULL,      
    `Disbursement Date (Years)` VARCHAR(50),
    `Gender ID` VARCHAR(50),
    `Home Ownership` VARCHAR(100),
    `Loan Status` VARCHAR(100),
    `Loan Transferdate` DATE NULL,      
    `NextMeetingDate` DATE NULL,         
    `Product Code` VARCHAR(100),
    `Grade` VARCHAR(50),
    `Sub Grade` VARCHAR(50),
    `Product Id` VARCHAR(50),             
    `Purpose Category` VARCHAR(250),
    `Region Name` VARCHAR(250),
    `Religion` VARCHAR(150),
    `Verification Status` VARCHAR(150),
    `State Abbr 2` VARCHAR(50),           
    `State Name` VARCHAR(150),
    `Tranfer Logic` VARCHAR(250),         
    `Is Delinquent Loan` VARCHAR(50),
    `Is Default Loan` VARCHAR(50),
    `Age_T` INT NULL,
    `Delinq 2 Yrs` INT NULL,
    `Application Type` VARCHAR(100),
    `Loan Amount` DECIMAL(15,2) NULL,
    `Funded Amount` DECIMAL(15,2) NULL,
    `Funded Amount Inv` DECIMAL(15,2) NULL,
    `Term` INT NULL,
    `Int Rate` DECIMAL(5,4) NULL,
    `Total Pymnt` DECIMAL(15,2) NULL,
    `Total Pymnt inv` DECIMAL(15,2) NULL,        
    `Total Rec Prncp` DECIMAL(15,2) NULL,
    `Total Fees` DECIMAL(15,2) NULL,
    `Total Rec int` DECIMAL(15,2) NULL,          
    `Total Rec Late fee` DECIMAL(15,2) NULL,     
    `Recoveries` DECIMAL(15,2) NULL,
    `Collection Recovery fee` DECIMAL(15,2) NULL 
);



SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

USE bank_analytics_db;

LOAD DATA LOCAL INFILE 'C:/Users/Riya/OneDrive/Desktop/Banking Project/Banking Project/Banking Data.csv' -- (make sure to use forward slashes / in the file path text)
INTO TABLE banking_data
CHARACTER SET latin1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;