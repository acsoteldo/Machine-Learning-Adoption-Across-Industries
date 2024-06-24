-- Descriptive Analysis
SELECT
    Gender,
    AVG(Yrs_of_ML_Experience) AS avg_ml_experience,
    MIN(Yrs_of_ML_Experience) AS min_ml_experience,
    MAX(Yrs_of_ML_Experience) AS max_ml_experience
FROM
    Tech_trend_CLEANED
GROUP BY
    Gender;

-- Correlation Analysis
SELECT
    CORR(Yrs_of_ML_Experience, Total_Expenditure_on_ML_and_Cloud_Services_Past_5_Years_USD) AS correlation_coef
FROM
    Tech_trend_CLEANED;

-- Feature Importance Analysis: insights into which industries spend the most on ML and cloud services
SELECT
    Industry_of_Current_Employer_or_Contract,
    AVG(Total_Expenditure_on_ML_and_Cloud_Services_Past_5_Years_USD) AS avg_expenditure
FROM
    Tech_trend_CLEANED
GROUP BY
    Industry_of_Current_Employer_or_Contract
ORDER BY
    avg_expenditure DESC;

-- Segmentation Analysis: aiding in understanding compensation trends based on experience levels.
SELECT
    CASE
        WHEN Yrs_of_ML_Experience >= 5 THEN 'Experienced'
        ELSE 'Novice'
    END AS experience_segment,
    AVG(Annual_Compensation_USD) AS avg_compensation
FROM
    Tech_trend_CLEANED
GROUP BY
    experience_segment;

-- Geospatial Analysis
SELECT
    Country_of_Residence,
    COUNT(*) AS num_responses
FROM
    Tech_trend_CLEANED
GROUP BY
    Country_of_Residence
ORDER BY
    num_responses DESC;
