/* Write your T-SQL query statement below */
SELECT
    query_name,
    ROUND(AVG(CAST(rating AS DECIMAL) / CAST(position AS DECIMAL)), 2) AS quality, 
    ROUND(
            (
            CAST(SUM(CASE rating WHEN 0 THEN 1 WHEN 1 THEN 1 WHEN 2 THEN 1 ELSE 0 END) AS NUMERIC) 
            / 
            CAST(COUNT(query_name) AS NUMERIC)
            *
            100
            ) 
    , 2) AS poor_query_percentage
FROM
    queries
GROUP BY
    query_name
ORDER BY
    query_name DESC