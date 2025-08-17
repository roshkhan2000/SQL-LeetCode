/* Write your T-SQL query statement below */
SELECT
    p.project_id,
    ROUND(AVG(E.experience_years), 2) AS average_years
FROM
    project p
LEFT JOIN
    employee e
ON
    p.employee_id = e.employee_id
GROUP BY
    p.project_id
ORDER BY
    p.project_id