/* Write your T-SQL query statement below */
SELECT
    e.employee_id,
    e.name,
    count(m.employee_id) AS reports_count,
    ROUND(AVG(CAST(m.age AS NUMERIC)), 0) AS average_age
FROM
    employees AS e
LEFT JOIN
    employees AS m
ON
    e.employee_id = m.reports_to
GROUP BY
    e.employee_id,
    e.name
HAVING
    count(m.employee_id) >= 1
ORDER BY
    employee_id