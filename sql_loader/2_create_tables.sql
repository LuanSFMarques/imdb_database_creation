-- Creating tables infrastructure

CREATE TABLE public.imdb_movies_fact
(
    movie_id INT PRIMARY KEY,
    title TEXT,
    year TEXT,
    certificate TEXT,
    duration INT,
    genre TEXT,
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

-- Set ownership of the tables to the postgres user
ALTER TABLE public.stars_dim OWNER to postgres;
ALTER TABLE public.imdb_movies_fact OWNER to postgres;
ALTER TABLE public.movies_stars_dim OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_movie_id ON public.movies_stars_dim (movie_id);
CREATE INDEX idx_star_id ON public.movies_stars_dim (star_id);