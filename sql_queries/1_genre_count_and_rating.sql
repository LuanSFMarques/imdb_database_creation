SELECT
    genre_name AS movie_genre,
    COUNT(mgd.movie_id) AS number_of_movies,
    ROUND(AVG(imdb.rating), 1) AS genre_average_rating
FROM
    imdb_movies_fact AS imdb
LEFT JOIN movies_genre_dim AS mgd ON mgd.movie_id = imdb.movie_id
LEFT JOIN genre_dim AS gd ON gd.genre_id = mgd.genre_id
WHERE
    genre_name IS NOT NULL
GROUP BY
    genre_name
ORDER BY
    genre_average_rating DESC;