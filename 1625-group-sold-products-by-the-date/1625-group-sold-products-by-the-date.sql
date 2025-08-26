/* Write your T-SQL query statement below*/
SELECT
    sell_date,
    SUM(row_num) AS num_sold,
    STRING_AGG(product, ',') AS products
FROM 
    (SELECT TOP (SELECT COUNT(*) FROM activities)
        sell_date,
        product,
        ROW_NUMBER() OVER(PARTITION BY sell_date, product ORDER BY sell_date) as row_num
    FROM
        activities
    ORDER BY
        sell_date,
        product) AS rowed
WHERE
    row_num =1 
GROUP BY sell_date