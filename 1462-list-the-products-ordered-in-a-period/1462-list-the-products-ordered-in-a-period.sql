/* Write your T-SQL query statement below */
SELECT
    product_name,
    unit
FROM
    (SELECT
        p.product_name,
        FORMAT(o.order_date, 'MM/yyyy') AS order_date,
        SUM(o.unit) AS unit
    FROM
        orders o
    LEFT JOIN
        products p
    ON  
        o.product_id = p.product_id
    GROUP BY
        p.product_name,
        FORMAT(o.order_date, 'MM/yyyy')) AS agg
WHERE 
    order_date = '02/2020'
    AND
    unit >= 100
