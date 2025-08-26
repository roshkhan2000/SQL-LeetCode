/* Write your T-SQL query statement below */
WITH ranked AS (
    SELECT 
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM (
        SELECT DISTINCT salary
        FROM employee) AS distinct_salaries)
        
SELECT 
    CASE WHEN EXISTS (SELECT 1 FROM ranked WHERE rn = 2)
         THEN (SELECT salary FROM ranked WHERE rn = 2)
         ELSE NULL
    END AS SecondHighestSalary;