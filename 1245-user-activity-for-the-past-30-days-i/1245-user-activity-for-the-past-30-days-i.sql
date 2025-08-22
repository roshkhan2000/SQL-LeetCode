/* Write your T-SQL query statement below */
SELECT
    activity_date as day,
    count(DISTINCT user_id) as active_users
FROM
    activity
WHERE
    activity_date BETWEEN DATEADD(day, -29, '2019-07-27') AND '2019-07-27'
GROUP BY
    activity_date
ORDER BY
    activity_date
