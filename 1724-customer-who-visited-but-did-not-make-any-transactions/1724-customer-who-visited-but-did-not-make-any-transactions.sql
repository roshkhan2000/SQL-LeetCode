/* Write your T-SQL query statement below */
SELECT 
    v.customer_id,
    count(v.visit_id) as count_no_trans
FROM 
    visits v
LEFT JOIN 
    transactions t
ON 
    v.visit_id = t.visit_id
WHERE 
    t.transaction_id IS NULL
Group BY 
    v.customer_id
