SELECT
    title AS movie_title,
    rating AS movie_rating,
    votes AS movie_votes
FROM 
    imdb_movies_fact AS imf
WHERE
    votes IS NOT NULL
ORDER BY
    votes DESC
LIMIT 10;    