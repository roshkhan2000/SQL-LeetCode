WITH CTE AS (
    SELECT
        player_id,
        event_date, 
        MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS min_date,
        LAG(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date) AS previous_date,
        CASE
            WHEN 
                DATEADD(day, 1, LAG(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date)) 
                = 
                event_date
            THEN 
                1
            ELSE
                0
            END AS score 
    FROM
        activity
)
SELECT
    ISNULL(
        ROUND(
            CAST(sum(score) AS NUMERIC) 
            /
            (SELECT COUNT(DISTINCT player_id) FROM activity)
        , 2)
    , 0) AS fraction
FROM
    CTE
WHERE
    min_date = previous_date