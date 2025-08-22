/* Write your T-SQL query statement below */
WITH how_many_stores AS (
    SELECT
        employee_id,
        count(employee_id) AS dept_count
    FROM
        employee
    GROUP BY
        employee_id
    )
SELECT
    e.employee_id, 
    e.department_id
FROM
    employee AS e
LEFT JOIN
    how_many_stores AS h
ON 
    e.employee_id = h.employee_id
WHERE
    CASE WHEN dept_count = 1 THEN 'Y' ELSE primary_flag END = 'Y'