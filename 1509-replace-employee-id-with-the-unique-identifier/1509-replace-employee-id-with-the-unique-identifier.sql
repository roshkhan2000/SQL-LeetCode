/* Write your T-SQL query statement below */
SELECT 
    u.unique_id,
    e.name
FROM employees e 
LEFT JOIN employeeUNI u
on e.id = u.id