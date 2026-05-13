# Auto Insurance Claims SQL Analysis

This project analyzes a 2024 auto insurance claims dataset using SQL and MySQL. The goal was to practice database querying and build reporting-style analysis around customer coverage, claim behavior, vehicle class, sales response, and risk indicators. The project expands on relational database coursework by using SQL to move from raw customer records to clear business findings.

The analysis was designed to answer practical insurance questions such as which coverage groups have the highest claim amounts, which vehicle classes are associated with higher premiums, which sales channels have stronger customer response rates, and which customer groups may need closer review.

## Skills Demonstrated

- SQL querying in MySQL
- Data grouping and aggregation using `GROUP BY`, `COUNT`, and `AVG`
- Conditional analysis using `CASE WHEN`
- Nested subqueries for above-average comparisons
- Customer and policy reporting analysis
- Translating raw records into business-focused findings
- Summarizing patterns for decision-making

## Dataset

The dataset used for this project is **AutoInsuranceClaims2024**, an auto insurance claims dataset from Kaggle. It includes customer, policy, vehicle, premium, claim, sales channel, employment, income, and response fields.

The dataset contains **9,134 customer records**. The analysis focuses on overall patterns rather than machine learning, with emphasis on SQL-based reporting and exploratory analysis.

## Key Findings

### Coverage Distribution

Basic coverage was the most common coverage type, with **5,568 customers**, representing about **61%** of the dataset. Extended coverage included **2,742 customers**, or about **30%**, while Premium coverage included **824 customers**, or about **9%**.

This shows that most customers were concentrated in Basic and Extended coverage plans, while Premium coverage represented a much smaller share of the customer base.

| Coverage | Total Customers | Approx. Share |
|---|---:|---:|
| Basic | 5,568 | 61% |
| Extended | 2,742 | 30% |
| Premium | 824 | 9% |

### Claim Amount by Coverage Type

Average claim amount increased by coverage level. Premium coverage had the highest average claim amount at **$879.38**, followed by Extended coverage at **$648.78** and Basic coverage at **$511.70**.

Premium coverage customers had an average claim amount about **72% higher** than Basic coverage customers. This suggests that coverage level is an important factor when comparing claim cost patterns.

| Coverage | Average Claim Amount |
|---|---:|
| Premium | $879.38 |
| Extended | $648.78 |
| Basic | $511.70 |

### Vehicle Class and Premium Differences

Vehicle class showed a clear relationship with monthly premium amount. Luxury SUV and Luxury Car customers had the highest average monthly premiums, at **$287.86** and **$286.38**. Four-Door Car and Two-Door Car customers had much lower average monthly premiums, around **$104.55** and **$103.89**.

Luxury SUV average premiums were about **176% higher** than Two-Door Car premiums, showing a strong separation between luxury and standard vehicle classes.

| Vehicle Class | Average Monthly Premium |
|---|---:|
| Luxury SUV | $287.86 |
| Luxury Car | $286.38 |
| Sports Car | $164.58 |
| SUV | $162.24 |
| Four-Door Car | $104.55 |
| Two-Door Car | $103.89 |

### Vehicle Class and Claim Amount

Luxury vehicle classes also had the highest average claim amounts. Luxury Car customers had an average claim amount of **$1,525.89**, while Luxury SUV customers averaged **$1,474.91**. These values were much higher than SUV and Sports Car claim averages, which were around **$768.92** and **$753.50**.

This suggests that vehicle class is useful for claim analysis because higher-value vehicle categories appear to be connected with higher average claim amounts.

| Vehicle Class | Average Claim Amount |
|---|---:|
| Luxury Car | $1,525.89 |
| Luxury SUV | $1,474.91 |
| SUV | $768.92 |
| Sports Car | $753.50 |

### Sales Channel Response Rates

The Agent sales channel had the strongest customer response rate. Out of **3,477** customers contacted through agents, **666** responded positively, giving an approximate response rate of **19%**.

The other channels had lower response rates. Branch had about **11%**, Call Center had about **11%**, and Web had about **12%**. This suggests that agent-based outreach may be more effective than other sales channels in this dataset.

| Sales Channel | Yes Responses | Total Customers | Approx. Response Rate |
|---|---:|---:|---:|
| Agent | 666 | 3,477 | 19% |
| Web | 156 | 1,325 | 12% |
| Branch | 294 | 2,567 | 11% |
| Call Center | 192 | 1,765 | 11% |

### Employment Status and Claim Amount

Employment status showed a noticeable difference in claim behavior. Unemployed customers had the highest average claim amount at **$809.43**, while employed customers had the lowest average claim amount at **$483.67**.

Employed customers made up the largest group, with **5,698 records**, or about **62%** of the dataset. Unemployed customers represented about **25%** of the dataset and had an average income of **$0**. This group stood out because it had a higher average claim amount than every other employment category.

| Employment Status | Total Customers | Average Income | Average Claim Amount |
|---|---:|---:|---:|
| Unemployed | 2,317 | $0.00 | $809.43 |
| Retired | 282 | $27,749.27 | $661.37 |
| Disabled | 405 | $27,061.52 | $640.86 |
| Medical Leave | 432 | $27,395.27 | $637.11 |
| Employed | 5,698 | $76,119.61 | $483.67 |

## Analysis Summary

The analysis found that coverage type, vehicle class, sales channel, and employment status were all useful for understanding claim and customer behavior.

Premium coverage and luxury vehicle classes were associated with higher average claim amounts. Agent-based sales had the highest response rate, suggesting it may be a stronger outreach channel in this dataset. Employment status also showed a clear pattern, with unemployed customers having the highest average claim amount and employed customers having the lowest.

The SQL queries also created review-style categories using `CASE WHEN` logic and nested subqueries. This helped identify records that may need closer review based on claim amount or complaints. These outputs are useful because they turn raw insurance records into analysis-ready summaries that could support reporting, customer review, or future predictive modeling.

## Relevance

This project demonstrates how SQL can be used for structured data analysis and reporting. It connects database coursework with practical analytics tasks such as summarizing customer groups, comparing averages, identifying higher-risk segments, and preparing clean outputs for decision-making.

## Dataset Access

The CSV file is not included in this repository because it comes from Kaggle. To reproduce the analysis, download the dataset from Kaggle and place the CSV file in the working directory before running the SQL script.

Dataset: **AutoInsuranceClaims2024**  
Source: Kaggle  
File used: `AutoInsuranceClaims2024.csv`
