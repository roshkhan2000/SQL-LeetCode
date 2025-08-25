/* Write your T-SQL query statement below */
DELETE
FROM
    person
WHERE 
    id NOT IN
        (SELECT 
            minid
        FROM
            (SELECT 
                email, 
                MIN(id) AS minid
            FROM 
                person
            GROUP BY 
                email) test)