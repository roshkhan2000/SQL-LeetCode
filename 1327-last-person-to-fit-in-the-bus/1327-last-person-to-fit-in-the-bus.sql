/*Write your MySQL query statement below*/
WITH running_weight AS(
    SELECT
        turn AS Turn, 
        person_id AS ID,
        person_name AS Name, 
        weight AS Weight, 
        SUM(weight) OVER(ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Total_Weight
    FROM
        queue)

, running_weight2 AS (
    SELECT 
        turn,
        id,
        name AS person_name,
        weight,
        CASE
            WHEN total_weight > 1000 THEN NULL
            ELSE total_weight
        END AS last_person
    FROM
        running_weight)

SELECT
    TOP 1 person_name
FROM
    running_weight2
ORDER BY
    last_person DESC
 