use bank_analytics_db;

-- KPI 1

SELECT 
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_Credit_Amount
FROM debit_credit
WHERE `Transaction Type` = 'Credit';

-- KPI 2

SELECT 
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_Debit_Amount
FROM debit_credit
WHERE `Transaction Type` = 'Debit';

-- KPI 3

SELECT 
    ROUND(
        SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) / 
        NULLIF(SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END), 0), 
        2
    ) AS Credit_To_Debit_Ratio
FROM debit_credit;

-- KPI 4

SELECT 
    CASE 
        WHEN (SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) >= 10000000 
            THEN CONCAT('₹ ', ROUND((SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) / 10000000.0, 2), ' Cr.')
        WHEN (SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) >= 100000 
            THEN CONCAT('₹ ', ROUND((SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) / 100000.0, 2), ' L.')
        WHEN (SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) >= 1000 
            THEN CONCAT('₹ ', ROUND((SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND((SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)), 2))
    END AS Net_Transaction_Amount
FROM debit_credit;

-- KPI 5

SELECT 
    ROUND(
        CAST(COUNT(*) AS DECIMAL(15,6)) / NULLIF(SUM(`Balance`), 0), 
        6
    ) AS Account_Activity_Ratio
FROM debit_credit;

-- KPI 6

SELECT 
    DATE_FORMAT(`Transaction Date`, '%Y-%m') AS Month_Year,
    CASE 
        WHEN COUNT(*) >= 10000000 THEN CONCAT(ROUND(COUNT(*) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(*) >= 100000 THEN CONCAT(ROUND(COUNT(*) / 100000.0, 2), ' L.')
        WHEN COUNT(*) >= 1000 THEN CONCAT(ROUND(COUNT(*) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(*) AS CHAR)
    END AS Total_Transactions,
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_Transaction_Amount
FROM debit_credit
GROUP BY DATE_FORMAT(`Transaction Date`, '%Y-%m')
ORDER BY Month_Year ASC;

-- KPI 7

SELECT 
    `Branch`,
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_Transaction_Amount
FROM debit_credit
GROUP BY `Branch`
ORDER BY SUM(`Amount`) DESC;

-- KPI 8

SELECT 
    `Bank Name`,
    CASE 
        WHEN COUNT(*) >= 10000000 THEN CONCAT(ROUND(COUNT(*) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(*) >= 100000 THEN CONCAT(ROUND(COUNT(*) / 100000.0, 2), ' L.')
        WHEN COUNT(*) >= 1000 THEN CONCAT(ROUND(COUNT(*) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(*) AS CHAR)
    END AS Transaction_Volume,
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_Transaction_Amount
FROM debit_credit
GROUP BY `Bank Name`
ORDER BY SUM(`Amount`) DESC;

-- KPI 9

SELECT 
    `Transaction Method`,
    CASE 
        WHEN COUNT(*) >= 10000000 THEN CONCAT(ROUND(COUNT(*) / 10000000.0, 2), ' Cr.')
        WHEN COUNT(*) >= 100000 THEN CONCAT(ROUND(COUNT(*) / 100000.0, 2), ' L.')
        WHEN COUNT(*) >= 1000 THEN CONCAT(ROUND(COUNT(*) / 1000.0, 2), ' K.')
        ELSE CAST(COUNT(*) AS CHAR)
    END AS Transaction_Count,
    CONCAT(ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM debit_credit), 2), ' %') AS Volume_Share_Pct
FROM debit_credit
GROUP BY `Transaction Method`
ORDER BY COUNT(*) DESC;

-- KPI 10

WITH MonthlyBranchTransactions AS (
    SELECT 
        `Branch`,
        DATE_FORMAT(`Transaction Date`, '%Y-%m') AS Month_Year,
        SUM(`Amount`) AS Monthly_Amount
    FROM debit_credit
    GROUP BY `Branch`, DATE_FORMAT(`Transaction Date`, '%Y-%m')
),
BranchGrowth AS (
    SELECT 
        `Branch`,
        Month_Year,
        Monthly_Amount,
        LAG(Monthly_Amount) OVER (PARTITION BY `Branch` ORDER BY Month_Year) AS Prev_Month_Amount
    FROM MonthlyBranchTransactions
)
SELECT 
    `Branch`,
    Month_Year,
    CASE 
        WHEN Monthly_Amount >= 10000000 THEN CONCAT('₹ ', ROUND(Monthly_Amount / 10000000.0, 2), ' Cr.')
        WHEN Monthly_Amount >= 100000 THEN CONCAT('₹ ', ROUND(Monthly_Amount / 100000.0, 2), ' L.')
        WHEN Monthly_Amount >= 1000 THEN CONCAT('₹ ', ROUND(Monthly_Amount / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(Monthly_Amount, 2))
    END AS Current_Month_Amount,
    CONCAT(
        ROUND(
            ((Monthly_Amount - Prev_Month_Amount) / NULLIF(Prev_Month_Amount, 0)) * 100.0, 
            2
        ), 
        '%'
    ) AS Growth_Rate_Pct
FROM BranchGrowth
WHERE Prev_Month_Amount IS NOT NULL
ORDER BY Month_Year DESC, ((Monthly_Amount - Prev_Month_Amount) / NULLIF(Prev_Month_Amount, 0)) DESC
LIMIT 10;

-- KPI 11

SELECT 
    CASE 
        WHEN `Amount` > 4000 THEN 'High Risk'
        ELSE 'Normal'
    END AS Risk_Flag,
    COUNT(*) AS Total_Transactions
FROM debit_credit
GROUP BY 
    CASE 
        WHEN `Amount` > 4000 THEN 'High Risk'
        ELSE 'Normal'
    END;

-- KPI 12

SELECT 
    COUNT(`Customer ID`) AS Total_High_Risk_Transactions,
    CASE 
        WHEN SUM(`Amount`) >= 10000000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 10000000.0, 2), ' Cr.')
        WHEN SUM(`Amount`) >= 100000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 100000.0, 2), ' L.')
        WHEN SUM(`Amount`) >= 1000 THEN CONCAT('₹ ', ROUND(SUM(`Amount`) / 1000.0, 2), ' K.')
        ELSE CONCAT('₹ ', ROUND(SUM(`Amount`), 2))
    END AS Total_High_Risk_Amount
FROM debit_credit
WHERE `Amount` > 4000;