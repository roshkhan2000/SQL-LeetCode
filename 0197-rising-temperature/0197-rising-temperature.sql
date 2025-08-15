/* Write your T-SQL query statement below */
WITH 
    previous_weather as (
        SELECT 
            id,
            Dateadd(day, 1, recordDate) as recordDate_previous,
            temperature
        FROM 
            weather
)
SELECT 
    w.id as ID
FROM 
    weather w 
JOIN 
    previous_weather pw
ON 
    w.recordDate = pw.recordDate_previous
WHERE 
    w.temperature > pw.temperature