# Write your MySQL query statement below
SELECT 
    m.name
FROM 
    employee m
INNER JOIN
    employee e
ON 
    m.id = e.managerId
GROUP BY
    m.id 
HAVING 
    count(m.id) >= 5