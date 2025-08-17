with total_users AS (
    SELECT
        count(DISTINCT user_id) AS total_count
    FROM
        users
)
SELECT
    r.contest_id,
    ROUND((COUNT(DISTINCT CAST(u.user_ID AS DECIMAL)) / MIN(CAST(total_count AS DECIMAL))), 4) * 100 as percentage
FROM
    register r
LEFT JOIN
    users u
ON 
    r.user_id = u.user_id
LEFT JOIN
    total_users tu
ON
    1 = 1
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC,
    contest_id ASC