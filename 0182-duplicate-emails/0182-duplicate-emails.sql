/* Write your T-SQL query statement below */
SELECT 
    email AS Email
FROM
    person
GROUP BY
    email 
HAVING
    count(email) > 1