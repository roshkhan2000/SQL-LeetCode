/* Write your T-SQL query statement below */
WITH find_first_year AS
(
SELECT
    product_id,
    year,
    MIN(year) OVER(PARTITION BY product_id ORDER BY year) AS first_year,
    quantity,
    price
FROM
    sales
) 

SELECT 
    product_id,
    first_year,
    quantity,
    price
FROM
    find_first_year
WHERE
    year = first_year