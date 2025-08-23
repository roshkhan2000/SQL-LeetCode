/* Write your T-SQL query statement below */
SELECT
    t.employee_id
FROM
    (SELECT
        e.employee_id,
        e.name,
        e.salary,
        CASE
            WHEN e.manager_id IS NULL THEN 0
            ELSE e.manager_id
        END as manager_id,
        m.name AS manager_name,
        m.manager_id AS managers_manager_id
    FROM
        employees e
    LEFT JOIN 
        employees m
    ON
        m.employee_id = e.manager_id
    WHERE
        e.salary < 30000
        AND
        m.manager_id IS NULL
        AND
        m.name IS NULL
        AND
        e.manager_id != 0) AS t
ORDER BY
        t.employee_id