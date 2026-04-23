-- 1.1 Find the customers who are subscribed to the 'Kobiye Destek' tariff
-- Here I wanted to see which customers are using this specific tariff.
-- I joined customers and tariffs tables using TARIFF_ID.
-- Then I filtered only the 'Kobiye Destek' tariff.
-- I used JOIN because tariff name is in another table.
SELECT c.CUSTOMER_ID, c.NAME, t.NAME AS TARIFF_NAME
FROM CUSTOMERS c
JOIN TARIFFS t ON c.TARIFF_ID = t.TARIFF_ID
WHERE t.NAME = 'Kobiye Destek';

--------------------------------------------------

-- 1.2 Find the newest customer who subscribed to the 'Kobiye Destek' tariff
-- Here I tried to find the most recent customer for this tariff.
-- I sorted the results by signup date in descending order.
-- Then I selected only the first row.
-- I used ORDER BY to get the newest record first.
SELECT c.NAME, c.SIGNUP_DATE
FROM CUSTOMERS c
JOIN TARIFFS t ON c.TARIFF_ID = t.TARIFF_ID
WHERE t.NAME = 'Kobiye Destek'
ORDER BY c.SIGNUP_DATE DESC
FETCH FIRST 1 ROWS ONLY;

--------------------------------------------------

-- 2.1 Find the distribution of tariffs among the customers
-- In this query, I checked how customers are spread across different tariffs.
-- I used LEFT JOIN to also include tariffs with no customers.
-- Then I grouped the results by tariff name and counted them.
-- I used GROUP BY to count customers for each tariff.
SELECT t.NAME AS TARIFF_NAME, COUNT(c.CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM TARIFFS t
LEFT JOIN CUSTOMERS c ON t.TARIFF_ID = c.TARIFF_ID
GROUP BY t.NAME;

--------------------------------------------------

-- 3.1 Identify the earliest customers to sign up
-- Here I wanted to find the customers who registered first.
-- I used a subquery to get the minimum signup date.
-- Then I selected the customers matching that date.
-- Subquery helps me compare each row with the minimum value.
SELECT *
FROM CUSTOMERS
WHERE SIGNUP_DATE = (
    SELECT MIN(SIGNUP_DATE)
    FROM CUSTOMERS
);

--------------------------------------------------

-- 3.2 Find the distribution of the earliest customers across different cities
-- In this part, I checked where the earliest customers are located.
-- I reused the same minimum signup date logic.
-- Then I grouped the results by city and counted them.
-- I used GROUP BY to see how many customers are in each city.
SELECT CITY, COUNT(CUSTOMER_ID) AS OLDEST_CUSTOMER_COUNT
FROM CUSTOMERS
WHERE SIGNUP_DATE = (
    SELECT MIN(SIGNUP_DATE)
    FROM CUSTOMERS
)
GROUP BY CITY;

--------------------------------------------------

-- 4.1 Identify the customers whose monthly records are missing
-- Here I checked which customers do not have any monthly statistics.
-- I used NOT IN with a subquery.
-- This helps to find missing data.
-- NOT IN lets me exclude customers that already exist in monthly_stats.
SELECT CUSTOMER_ID, NAME
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN (
    SELECT CUSTOMER_ID
    FROM MONTHLY_STATS
);

--------------------------------------------------

-- 4.2 Find the distribution of the missing customers across different cities
-- In this query, I wanted to see missing customers by city.
-- I used the same NOT IN condition again.
-- Then I grouped by city and sorted by count.
-- ORDER BY helps me see which city has more missing records.
SELECT CITY, COUNT(CUSTOMER_ID) AS MISSING_RECORD_COUNT
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN (
    SELECT CUSTOMER_ID
    FROM MONTHLY_STATS
)
GROUP BY CITY
ORDER BY MISSING_RECORD_COUNT DESC;

--------------------------------------------------

-- 5.1 Find the customers who have used at least 75% of their data limit
-- Here I tried to find users who are close to their data limit.
-- I joined usage, customers and tariffs tables.
-- Then I compared usage with the data limit.
-- JOIN is needed to match usage data with tariff limits.
SELECT c.NAME, m.DATA_USAGE, t.DATA_LIMIT
FROM MONTHLY_STATS m
JOIN CUSTOMERS c ON m.CUSTOMER_ID = c.CUSTOMER_ID
JOIN TARIFFS t ON c.TARIFF_ID = t.TARIFF_ID
WHERE t.DATA_LIMIT > 0
AND m.DATA_USAGE >= (t.DATA_LIMIT * 0.75);
--------------------------------------------------

-- 5.2 Find the customers who have completely exhausted all of their package limits
-- In this query, I checked users who used all their limits.
-- I compared usage values with tariff limits.
-- All conditions must be true, so I used AND.
-- Multiple conditions ensure only fully used packages are selected.
SELECT c.NAME, m.DATA_USAGE, m.MINUTE_USAGE, m.SMS_USAGE
FROM MONTHLY_STATS m
JOIN CUSTOMERS c ON m.CUSTOMER_ID = c.CUSTOMER_ID
JOIN TARIFFS t ON c.TARIFF_ID = t.TARIFF_ID
WHERE m.DATA_USAGE >= t.DATA_LIMIT
  AND m.MINUTE_USAGE >= t.MINUTE_LIMIT
  AND m.SMS_USAGE >= t.SMS_LIMIT;

--------------------------------------------------

-- 6.1 Find the customers who have unpaid fees
-- Here I wanted to find customers with unpaid payments.
-- I joined monthly stats and customers.
-- Then I filtered only UNPAID records.
-- WHERE helps me filter only the needed payment status.
SELECT c.CUSTOMER_ID, c.NAME, m.PAYMENT_STATUS
FROM MONTHLY_STATS m
JOIN CUSTOMERS c ON m.CUSTOMER_ID = c.CUSTOMER_ID
WHERE m.PAYMENT_STATUS = 'UNPAID';

--------------------------------------------------

-- 6.2 Find the distribution of all payment statuses across different tariffs
-- In this query, I checked how payment statuses are distributed by tariff.
-- I joined all related tables.
-- Then I grouped by tariff and payment status.
-- GROUP BY allows me to count each status per tariff.
SELECT t.NAME AS TARIFF_NAME,
       m.PAYMENT_STATUS,
       COUNT(c.CUSTOMER_ID) AS STATUS_COUNT
FROM MONTHLY_STATS m
JOIN CUSTOMERS c ON m.CUSTOMER_ID = c.CUSTOMER_ID
JOIN TARIFFS t ON c.TARIFF_ID = t.TARIFF_ID
GROUP BY t.NAME, m.PAYMENT_STATUS
ORDER BY t.NAME, m.PAYMENT_STATUS;