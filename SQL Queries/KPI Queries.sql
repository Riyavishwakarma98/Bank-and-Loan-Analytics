use bank_analytics_db;

-- KPI 1
SELECT 
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Loan_Amount_Funded
FROM banking_data;

-- KPI 2

SELECT 
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans
FROM banking_data;

-- KPI 3

SELECT 
    CASE 
        WHEN SUM(`Total Pymnt`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Total Pymnt`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Total Pymnt`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Total Pymnt`) / 100000.0, 2), ' L.')
        WHEN SUM(`Total Pymnt`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Total Pymnt`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Total Pymnt`), 2))
    END AS Total_Collection
FROM banking_data;

-- KPI 4

SELECT 
    CASE 
        WHEN SUM(`Total Rec int`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Total Rec int`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 100000.0, 2), ' L.')
        WHEN SUM(`Total Rec int`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Total Rec int`), 2))
    END AS Total_Interest
FROM banking_data;

-- KPI 5

SELECT 
    `Branch Name`,
    CASE 
        WHEN SUM(`Total Rec int`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Total Rec int`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 100000.0, 2), ' L.')
        WHEN SUM(`Total Rec int`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Total Rec int`), 2))
    END AS Interest_Income,
    CASE 
        WHEN SUM(`Total Fees`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Total Fees`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Total Fees`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Total Fees`) / 100000.0, 2), ' L.')
        WHEN SUM(`Total Fees`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Total Fees`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Total Fees`), 2))
    END AS Total_Fees,
    CASE 
        WHEN SUM(`Total Rec int` + `Total Fees`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int` + `Total Fees`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Total Rec int` + `Total Fees`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int` + `Total Fees`) / 100000.0, 2), ' L.')
        WHEN SUM(`Total Rec int` + `Total Fees`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Total Rec int` + `Total Fees`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Total Rec int` + `Total Fees`), 2))
    END AS Total_Revenue
FROM banking_data
GROUP BY `Branch Name`
ORDER BY SUM(`Total Rec int` + `Total Fees`) DESC
LIMIT 10;

-- KPI 6

SELECT 
    `State Name`,
    COUNT(`Account ID`) AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `State Name`
ORDER BY SUM(`Funded Amount`) DESC
LIMIT 10;

-- KPI 7

SELECT 
    `Religion`,
    COUNT(`Account ID`) AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `Religion`
ORDER BY SUM(`Funded Amount`) DESC;

-- KPI 8

SELECT 
    `Purpose Category`,
    COUNT(`Account ID`) AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `Purpose Category`
ORDER BY SUM(`Funded Amount`) DESC
LIMIT 10;

-- KPI 9

SELECT 
    DATE_FORMAT(`Disbursement Date`, '%Y-%m') AS Month_Year,
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Disbursed_Amount
FROM banking_data
GROUP BY DATE_FORMAT(`Disbursement Date`, '%Y-%m')
ORDER BY SUM(`Funded Amount`) ASC
LIMIT 10;

-- KPI 10

SELECT 
    `Grade`,
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `Grade`
ORDER BY `Grade` ASC;

-- KPI 11

SELECT 
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Default_Loan_Count
FROM banking_data
WHERE `Is Default Loan` = 'Y';

-- KPI 12

SELECT 
    CASE 
        WHEN COUNT(DISTINCT `Client id`) >= 10000000 THEN CONCAT(ROUND(COUNT(DISTINCT `Client id`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(DISTINCT `Client id`) >= 100000 THEN CONCAT(ROUND(COUNT(DISTINCT `Client id`) / 100000.0, 2), ' L.')
        WHEN COUNT(DISTINCT `Client id`) >= 1000 THEN CONCAT(ROUND(COUNT(DISTINCT `Client id`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(DISTINCT `Client id`) AS CHAR)
    END AS Delinquent_Client_Count
FROM banking_data
WHERE `Is Delinquent Loan` = 'Y';

-- KPI 13

SELECT 
    CONCAT(
        ROUND(
            (COUNT(CASE WHEN `Is Delinquent Loan` = 'Y' THEN `Account ID` END) * 100.0) / COUNT(`Account ID`), 
            2
        ), 
        ' %'
    ) AS Delinquent_Loans_Rate
FROM banking_data;

-- KPI 14

SELECT 
    CONCAT(
        ROUND(
            (COUNT(CASE WHEN `Is Default Loan` = 'Y' THEN `Account ID` END) * 100.0) / COUNT(`Account ID`), 
            2
        ), 
        ' %'
    ) AS Default_Loan_Rate
FROM banking_data;

-- KPI 15

SELECT 
    `Loan Status`,
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `Loan Status`
ORDER BY SUM(`Funded Amount`) DESC;

-- KPI 16

SELECT 
    CASE 
        WHEN `Age` BETWEEN 18 AND 25 THEN '18-25'
        WHEN `Age` BETWEEN 26 AND 35 THEN '26-35'
        WHEN `Age` BETWEEN 36 AND 45 THEN '36-45'
        WHEN `Age` BETWEEN 46 AND 55 THEN '46-55'
        WHEN `Age` BETWEEN 56 AND 63 THEN '56-63'
        ELSE 'Other'
    END AS Age_Group,
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY Age_Group
ORDER BY MIN(`Age`) ASC;

-- KPI 17

SELECT 
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS No_Verified_Loan_Count
FROM banking_data
WHERE `Verification Status` = 'Not Verified';

-- KPI 18

SELECT 
    `Term`,
    CASE 
        WHEN COUNT(`Account ID`) >= 10000000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(`Account ID`) >= 100000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 100000.0, 2), ' L.')
        WHEN COUNT(`Account ID`) >= 1000 THEN CONCAT(ROUND(COUNT(`Account ID`) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(`Account ID`) AS CHAR)
    END AS Total_Loans,
    CASE 
        WHEN SUM(`Funded Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Funded Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Funded Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Funded Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Funded Amount`), 2))
    END AS Total_Funded_Amount
FROM banking_data
GROUP BY `Term`
ORDER BY `Term` ASC;