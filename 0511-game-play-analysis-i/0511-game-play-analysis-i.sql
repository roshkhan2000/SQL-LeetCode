/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT player_id
    , event_date AS first_login
    , ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rn
FROM activity
)
SELECT
    player_id
    , first_login
FROM CTE 
WHERE rn = 1