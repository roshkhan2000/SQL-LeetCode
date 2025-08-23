/* Write your T-SQL query statement below */
WITH category_included AS (
    SELECT
        account_id, 
        income, 
        CASE
            WHEN income > 50000 THEN 'High Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income < 20000 THEN 'Low Salary'
        END AS category
    FROM
        accounts)

SELECT
    ci.category, 
    count(c.account_id) AS accounts_count
FROM
    category_included c
RIGHT JOIN
    (VALUES('Low Salary'), ('Average Salary'), ('High Salary')) AS ci(category)
ON
    c.category = ci.category
GROUP BY
    ci.category
ORDER BY
    accounts_count DESC

