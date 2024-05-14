SELECT * FROM corona.`corona virus`;
use corona;
SHOW TABLES FROM corona;
-- Q1. Write a code to check NULL values
SELECT 
    COUNT(*) AS total_null_values
FROM 
    `corona virus`
WHERE 
    Province IS NULL 
    OR `Country/Region` IS NULL 
    OR Latitude IS NULL 
    OR Longitude IS NULL 
    OR Date IS NULL 
    OR Confirmed IS NULL 
    OR Deaths IS NULL 
    OR Recovered IS NULL;
ALTER TABLE `corona virus`
ADD COLUMN ID INT AUTO_INCREMENT PRIMARY KEY FIRST;
-- Q2. If NULL values are present, update them with zeros for all columns.
UPDATE 
    `corona virus`
SET 
    Province = COALESCE(Province, '0'),
    `Country/Region` = COALESCE(`Country/Region`, '0'),
    Latitude = COALESCE(Latitude, 0),
    Longitude = COALESCE(Longitude, 0),
    Date = COALESCE(Date, '0'),
    Confirmed = COALESCE(Confirmed, 0),
    Deaths = COALESCE(Deaths, 0),
    Recovered = COALESCE(Recovered, 0)
WHERE
    ID > 0;
-- Q3. check total number of rows
SELECT 
    COUNT(*) AS total_rows
FROM 
    `corona virus`;
-- Q4. Check what is start_date and end_date
SELECT 
    MIN(Date) AS start_date,
    MAX(Date) AS end_date
FROM 
    `corona virus`;
    -- Q5. Number of month present in dataset
SELECT 
    COUNT(DISTINCT DATE_FORMAT(Date, '%Y-%m')) AS total_months
FROM 
    `corona virus`;
    -- Q6. Find monthly average for confirmed, deaths, recovered
    SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    `corona virus`
GROUP BY 
    month;
-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
    month,
    (SELECT Confirmed FROM (
        SELECT Confirmed, COUNT(*) AS frequency
        FROM `corona virus`
        WHERE DATE_FORMAT(Date, '%Y-%m') = sub.month
        GROUP BY Confirmed
        ORDER BY frequency DESC
        LIMIT 1
    ) AS confirmed_freq) AS most_frequent_confirmed,
    (SELECT Deaths FROM (
        SELECT Deaths, COUNT(*) AS frequency
        FROM `corona virus`
        WHERE DATE_FORMAT(Date, '%Y-%m') = sub.month
        GROUP BY Deaths
        ORDER BY frequency DESC
        LIMIT 1
    ) AS deaths_freq) AS most_frequent_deaths,
    (SELECT Recovered FROM (
        SELECT Recovered, COUNT(*) AS frequency
        FROM `corona virus`
        WHERE DATE_FORMAT(Date, '%Y-%m') = sub.month
        GROUP BY Recovered
        ORDER BY frequency DESC
        LIMIT 1
    ) AS recovered_freq) AS most_frequent_recovered
FROM (
    SELECT 
        DATE_FORMAT(Date, '%Y-%m') AS month
    FROM 
        `corona virus`
    GROUP BY 
        month
) AS sub;
-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM 
    `corona virus`
GROUP BY 
    year;
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS year,
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM 
    `corona virus`
GROUP BY 
    year;
-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    SUM(Confirmed) AS total_confirmed,
    SUM(Deaths) AS total_deaths,
    SUM(Recovered) AS total_recovered
FROM 
    `corona virus`
GROUP BY 
    month;
-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    COUNT(Confirmed) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS stdev_confirmed_cases
FROM 
    `corona virus`;
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    COUNT(Deaths) AS total_death_cases,
    AVG(Deaths) AS average_death_cases,
    VARIANCE(Deaths) AS variance_death_cases,
    STDDEV(Deaths) AS stdev_death_cases
FROM 
    `corona virus`
GROUP BY 
    month;
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    COUNT(Recovered) AS total_recovered_cases,
    AVG(Recovered) AS average_recovered_cases,
    VARIANCE(Recovered) AS variance_recovered_cases,
    STDDEV(Recovered) AS stdev_recovered_cases
FROM 
    `corona virus`;
-- Q14. Find Country having highest number of the Confirmed case
SELECT 
    `Country/Region`,
    MAX(Confirmed) AS highest_confirmed_cases
FROM 
    `corona virus`
GROUP BY 
    `Country/Region`
ORDER BY 
    highest_confirmed_cases DESC
LIMIT 1;
-- Q15. Find Country having lowest number of the death case
SELECT 
    `Country/Region`,
    MIN(Deaths) AS lowest_death_cases
FROM 
    `corona virus`
GROUP BY 
    `Country/Region`
ORDER BY 
    lowest_death_cases ASC
LIMIT 1;
-- Q16. Find top 5 countries having highest recovered case
SELECT 
    `Country/Region`,
    SUM(Recovered) AS total_recovered_cases
FROM 
    `corona virus`
GROUP BY 
    `Country/Region`
ORDER BY 
    total_recovered_cases DESC
LIMIT 5;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) AS total_columns
FROM 
    `corona virus`;
