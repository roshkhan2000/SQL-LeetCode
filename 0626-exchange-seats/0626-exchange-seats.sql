/* Write your T-SQL query statement below */
SELECT
    id, 
    CASE
        WHEN id %2 != 0 AND id = MAX(id) OVER(ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) THEN student
        WHEN id %2 != 0 THEN LEAD(student, 1) OVER(ORDER BY id)
        WHEN id %2 = 0 THEN LAG(student, 1) OVER(ORDER BY id)
    END AS student 
FROM
    seat 