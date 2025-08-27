/* Write your T-SQL query statement below */
SELECT
    ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM
    insurance AS i
LEFT JOIN 
    (SELECT
        tiv_2015,
        COUNT(tiv_2015) AS tiv_2015_count
    FROM 
        insurance
    GROUP BY
        tiv_2015) AS t
ON
    t.tiv_2015 = i.tiv_2015
LEFT JOIN 
    (SELECT
        lat,
        lon,
        COUNT(CAST(lat AS VARCHAR) + CAST(lon AS VARCHAR)) AS lat_lon_count
    FROM 
        insurance
    GROUP BY
        lat,
        lon) AS t2
ON
    t2.lat = i.lat
    AND
    t2.lon = i.lon
WHERE
    t.tiv_2015_count > 1
    AND
    t2.lat_lon_count = 1