WITH top_user_rating AS (
    SELECT TOP 1
        r.user_id,
        u.name AS results,
        COUNT(r.user_id) AS rating_count
    FROM
        movierating r
    LEFT JOIN
        users u
    ON
        u.user_id = r.user_id
    GROUP BY
        r.user_id,
        u.name
    ORDER BY
        COUNT(r.user_id) DESC,
        u.name)

, top_title AS (
    SELECT TOP 1
        m.title AS results,
        AVG(CAST(r.rating AS NUMERIC)) AS rating,
        MONTH(r.created_at) AS month,
        YEAR(r.created_at) AS year
    FROM
        movierating r
    LEFT JOIN
        movies m
    ON 
        m.movie_id = r.movie_id
    WHERE
        MONTH(r.created_at) = '2'
        AND
        YEAR(r.created_at) = '2020'
    GROUP BY
        m.title,
        MONTH(r.created_at),
        YEAR(r.created_at)
    ORDER BY
        AVG(CAST(r.rating AS NUMERIC)) DESC,
        m.title ASC)

SELECT 
    results 
FROM
    top_user_rating

UNION ALL

SELECT 
    results 
FROM 
    top_title