/* Write your T-SQL query statement below */
SELECT
    FORMAT(trans_date, 'yyyy-MM') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' then 1 WHEN state = 'declined' THEN 0 END ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' then amount WHEN state = 'declined' THEN 0 END ) AS approved_total_amount
FROM
    transactions
GROUP BY
    FORMAT(trans_date, 'yyyy-MM'),
    country
ORDER BY 
    FORMAT(trans_date, 'yyyy-MM')