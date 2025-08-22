/* Write your T-SQL query statement below */
SELECT
    x,
    y,
    z,
    CASE
        WHEN ABS(x) + ABS(y) > ABS(z) AND ABS(x) + ABS(z) > ABS(y) AND ABS(y) + ABS(z) > ABS(x)
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    triangle