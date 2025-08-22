/* Write your T-SQL query statement below */
WITH lagging_columns AS (
    SELECT
        id,
        num,
        LAG(num, 1) OVER(ORDER BY id) AS minus1,
        LAG(num, 2) OVER(ORDER BY id) AS minus2
    FROM
        logs)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    lagging_columns
WHERE
    num = minus1 
    AND
    minus1 = minus2
