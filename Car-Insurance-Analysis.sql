# Author: Meena Anwar
# Auto Insurance Claims 2024 SQL Analysis
# Dataset file path: .../AutoInsuranceClaims2024.csv
USE CarInsuranceDB;
SHOW TABLES;

USE CarInsuranceDB;
SELECT COUNT(*) AS total_records
FROM auto_insurance_claims;

# Query 1. Check that the CSV loaded correctly.
SELECT
    COUNT(*) AS total_records
FROM auto_insurance_claims;

# Query 2. Count claims by coverage type to compare customer policy groups.
SELECT
    `Coverage`,
    COUNT(*) AS total_customers
FROM auto_insurance_claims
GROUP BY `Coverage`
ORDER BY total_customers DESC;

# Query 3. Calculate average claim amount by coverage type.
SELECT
    `Coverage`,
    AVG(CAST(`Total Claim Amount` AS DECIMAL(10,2))) AS average_claim_amount
FROM auto_insurance_claims
GROUP BY `Coverage`
ORDER BY average_claim_amount DESC;

# Query 4. Compare average monthly premium by vehicle class.
SELECT
    `Vehicle Class`,
    AVG(CAST(`Monthly Premium Auto` AS DECIMAL(10,2))) AS average_monthly_premium
FROM auto_insurance_claims
GROUP BY `Vehicle Class`
ORDER BY average_monthly_premium DESC;

# Query 5. Count customer response by sales channel.
SELECT
    `Sales Channel`,
    `Response`,
    COUNT(*) AS total_customers
FROM auto_insurance_claims
GROUP BY `Sales Channel`, `Response`
ORDER BY `Sales Channel`, total_customers DESC;

# Query 6. Create a customer risk-style summary using CASE WHEN.
SELECT
    `Customer`,
    `State`,
    `Coverage`,
    `Vehicle Class`,
    CAST(`Monthly Premium Auto` AS DECIMAL(10,2)) AS monthly_premium,
    CAST(`Total Claim Amount` AS DECIMAL(10,2)) AS total_claim_amount,
    CAST(`Number of Open Complaints` AS UNSIGNED) AS open_complaints,
    CASE
        WHEN CAST(`Total Claim Amount` AS DECIMAL(10,2)) > 700
             OR CAST(`Number of Open Complaints` AS UNSIGNED) >= 2
        THEN 'Higher Review'
        WHEN CAST(`Total Claim Amount` AS DECIMAL(10,2)) BETWEEN 300 AND 700
        THEN 'Moderate Review'
        ELSE 'Lower Review'
    END AS review_category
FROM auto_insurance_claims
ORDER BY total_claim_amount DESC;

# Query 7. Count customers by review category using a nested query.
SELECT
    review_category,
    COUNT(*) AS total_customers
FROM (
    SELECT
        `Customer`,
        CASE
            WHEN CAST(`Total Claim Amount` AS DECIMAL(10,2)) > 700
                 OR CAST(`Number of Open Complaints` AS UNSIGNED) >= 2
            THEN 'Higher Review'
            WHEN CAST(`Total Claim Amount` AS DECIMAL(10,2)) BETWEEN 300 AND 700
            THEN 'Moderate Review'
            ELSE 'Lower Review'
        END AS review_category
    FROM auto_insurance_claims
) AS review_summary
GROUP BY review_category
ORDER BY total_customers DESC;

# Query 8. Use a nested subquery to find vehicle classes with above-average claim amounts.
SELECT
    `Vehicle Class`,
    average_claim_amount
FROM (
    SELECT
        `Vehicle Class`,
        AVG(CAST(`Total Claim Amount` AS DECIMAL(10,2))) AS average_claim_amount
    FROM auto_insurance_claims
    GROUP BY `Vehicle Class`
) AS vehicle_claims
WHERE average_claim_amount > (
    SELECT
        AVG(CAST(`Total Claim Amount` AS DECIMAL(10,2)))
    FROM auto_insurance_claims
)
ORDER BY average_claim_amount DESC;

# Query 9. Compare income and claim amount by employment status.
SELECT
    `Employment Status`,
    COUNT(*) AS total_customers,
    AVG(CAST(`Income` AS DECIMAL(12,2))) AS average_income,
    AVG(CAST(`Total Claim Amount` AS DECIMAL(10,2))) AS average_claim_amount
FROM auto_insurance_claims
GROUP BY `Employment Status`
ORDER BY average_claim_amount DESC;

# Query 10. Show records with high claim amounts and open complaints for closer review.
SELECT
    `Customer`,
    `State`,
    `Coverage`,
    `Employment Status`,
    `Vehicle Class`,
    `Monthly Premium Auto`,
    `Total Claim Amount`,
    `Number of Open Complaints`
FROM auto_insurance_claims
WHERE CAST(`Total Claim Amount` AS DECIMAL(10,2)) > 700
   OR CAST(`Number of Open Complaints` AS UNSIGNED) >= 2
ORDER BY CAST(`Total Claim Amount` AS DECIMAL(10,2)) DESC;
