/* Write your T-SQL query statement below */
SELECT
   p.product_id,
    ISNULL(
        ROUND(
            CAST(SUM(units * price) AS FLOAT)
            /
            CAST(SUM(units) AS FLOAT)
        , 2)
    , 0) AS average_price
FROM
    unitssold u
RIGHT JOIN 
    prices p
ON
    u.product_id = p.product_id
    AND
    u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id
