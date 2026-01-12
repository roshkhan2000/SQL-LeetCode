/* Write your T-SQL query statement below */
WITH cte AS ( 
    SELECT 
        o.buyer_id
        , u.join_date
        , COUNT(o.order_id) AS orders_in_2019
    FROM orders AS o
    RIGHT JOIN users AS u ON u.user_id = o.buyer_id
    WHERE YEAR(o.order_date) = '2019'
    GROUP BY 
        o.buyer_id
        , u.join_date
    HAVING COUNT(o.order_id) > 0
) 

, distinct_cte AS (
    SELECT 
        user_id
        , join_date
    FROM users
)

SELECT
    dc.user_id AS buyer_id
    , dc.join_date
    , COALESCE(c.orders_in_2019, 0) AS orders_in_2019
FROM distinct_cte AS dc
LEFT JOIN cte AS c ON dc.user_id = c.buyer_id