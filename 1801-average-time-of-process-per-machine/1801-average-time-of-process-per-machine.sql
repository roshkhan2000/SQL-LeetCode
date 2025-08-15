/* Write your T-SQL query statement below */
WITH
    activity_start AS (
        SELECT
            *
        FROM 
            activity
        WHERE 
            activity_type = 'start'
    )
, 
activity_end AS (
        SELECT
            *
        FROM 
            activity
        WHERE 
            activity_type = 'end'
)
SELECT
    s.machine_id,
    ROUND(ABS(AVG(s.timestamp - e.timestamp)), 3) AS processing_time
FROM
    activity_start s
JOIN
    activity_end e
ON
    s.machine_id = e.machine_id
    AND 
    s.process_id = e.process_id
GROUP BY
    s.machine_id
ORDER BY 
    s.machine_id desc