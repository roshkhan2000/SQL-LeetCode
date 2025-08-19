/* Write your T-SQL query statement below */
WITH new_columns AS (
    SELECT 
    delivery_id, 
    customer_id, 
    order_date, 
    customer_pref_delivery_date,
    (CASE WHEN order_date = customer_pref_delivery_date THEN 'Immediate' else 'Scheduled' END) AS immediate_or_not,
    CASE WHEN MIN(order_date) OVER(PARTITION BY customer_id) = order_date THEN 'First order' Else 'Not First order' END AS first_order_or_not 
FROM 
    delivery
)
SELECT 
    ROUND(
        (
            (SUM(CAST(CASE WHEN immediate_or_not = 'Immediate' AND first_order_or_not = 'First order' Then 1 ELSE 0 END AS NUMERIC))
            / 
            SUM(CAST(CASE WHEN first_order_or_not = 'First order' Then 1 ELSE 0 END AS NUMERIC)))
            * 
            100
        )
    , 2) AS immediate_percentage
FROM
    new_columns