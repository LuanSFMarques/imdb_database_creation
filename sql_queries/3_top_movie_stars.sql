SELECT
    star_name,
    ROUND(AVG(imf.rating), 1) AS star_average_rating
FROM
    stars_dim
LEFT JOIN movies_stars_dim AS msd ON msd.star_id = stars_dim.star_id
LEFT JOIN imdb_movies_fact AS imf ON imf.movie_id = msd.movie_id
WHERE
    star_name IS NOT NULL AND
    imf.rating IS NOT NULL
GROUP BY
    star_name   
ORDER BY
    star_average_rating DESC
LIMIT 10;    