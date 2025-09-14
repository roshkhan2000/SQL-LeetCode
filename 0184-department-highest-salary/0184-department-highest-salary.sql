/* Write your T-SQL query statement below */
WITH salaries_ranked AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS salary_department_rank
    FROM
        employee AS e 
    LEFT JOIN
        department AS d
    ON
        e.departmentid = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM
    salaries_ranked
WHERE
    salary_department_rank = 1