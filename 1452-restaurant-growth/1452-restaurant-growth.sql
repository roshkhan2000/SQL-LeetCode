/* Write your T-SQL query statement below */
SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) as average_amount
FROM
    (SELECT
        visited_on, 
        SUM(total_amount) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        AVG(CAST(total_amount AS NUMERIC)) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount,
        SUM(1) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS how_many_days
    FROM
        (SELECT
            visited_on, 
            SUM(amount) AS total_amount
        FROM 
            customer
        GROUP BY
            visited_on) AS summed_amounts) AS days_considered
WHERE
    how_many_days = 7 
ORDER BY
    visited_on ASC