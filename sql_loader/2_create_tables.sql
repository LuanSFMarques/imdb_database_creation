-- Creating tables infrastructure

CREATE TABLE public.imdb_movies_fact
(
    movie_id INT PRIMARY KEY,
    title TEXT,
    year TEXT,
    certificate TEXT,
    duration INT,
    rating NUMERIC,
    description TEXT,
    votes NUMERIC
);

CREATE TABLE public.stars_dim
(
    star_id INT PRIMARY KEY,
    star_name TEXT
);

CREATE TABLE public.movies_stars_dim
(
    movie_id INT,
    star_id INT,
    PRIMARY KEY (movie_id, star_id),
    FOREIGN KEY (movie_id) REFERENCES public.imdb_movies_fact ON DELETE CASCADE,
    FOREIGN KEY (star_id) REFERENCES public.stars_dim ON DELETE CASCADE
);

CREATE TABLE genre_dim (
    genre_id INT PRIMARY KEY,
    genre_name TEXT UNIQUE
);

CREATE TABLE movies_genre_dim (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES imdb_movies_fact(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genre_dim(genre_id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.stars_dim OWNER to postgres;
ALTER TABLE public.imdb_movies_fact OWNER to postgres;
ALTER TABLE public.movies_stars_dim OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_movie_id ON public.movies_stars_dim (movie_id);
CREATE INDEX idx_star_id ON public.movies_stars_dim (star_id);