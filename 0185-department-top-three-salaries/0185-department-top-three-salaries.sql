/* Write your T-SQL query statement below */
WITH top_salaries AS 
    (SELECT
        d.name AS Department, 
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS salary_dep_rank
    FROM
        employee AS e
    LEFT JOIN
        department AS d
    ON
        e.departmentId = d.id) 

SELECT
    Department,
    Employee,
    Salary
FROM
    top_salaries
WHERE 
    salary_dep_rank <= 3
ORDER BY
    Department,
    Salary DESC 