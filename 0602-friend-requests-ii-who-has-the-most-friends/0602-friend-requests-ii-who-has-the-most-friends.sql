/* Write your T-SQL query statement below */
SELECT TOP 1
    id,
    COUNT(id) AS num
FROM (
    SELECT
        requester_id AS id
    FROM
        requestaccepted

    UNION ALL

    SELECT
        accepter_id AS id
    FROM
        requestaccepted) AS unioned
GROUP BY
    id
ORDER BY
    COUNT(id) DESC