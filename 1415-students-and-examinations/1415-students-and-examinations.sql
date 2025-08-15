/* Write your T-SQL query statement below */
with CTE AS (
    Select
        std.student_id,
        std.student_name,
        sub.subject_name
    FROM 
        students std
    CROSS JOIN
        subjects sub
)
SELECT
    c.student_id,
    c.student_name,
    c.subject_name,
    count(e.subject_name) as attended_exams
FROM 
    CTE c
LEFT JOIN
    examinations e
ON
    e.student_id = c.student_id
    AND
    e.subject_name = c.subject_name
GROUP BY
    c.student_id,
    c.student_name,
    c.subject_name