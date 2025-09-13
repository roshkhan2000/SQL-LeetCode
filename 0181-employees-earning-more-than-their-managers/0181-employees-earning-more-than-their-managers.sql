/* Write your T-SQL query statement below */
SELECT
    e1.name AS Employee
FROM
    employee AS e1
LEFT JOIN
    employee as e2
ON
    e1.managerid = e2.id
WHERE
    e1.salary > e2.salary