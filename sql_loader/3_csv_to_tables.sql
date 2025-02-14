-- Filling the tables with the data in the csv files

COPY imdb_movies_fact
FROM 'D:\Study\Programming\By_type\Data_Analysis\imdb_movies_DA\csv_tables\imdb_movies_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY stars_dim
FROM 'D:\Study\Programming\By_type\Data_Analysis\imdb_movies_DA\csv_tables\star_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY movies_stars_dim
FROM 'D:\Study\Programming\By_type\Data_Analysis\imdb_movies_DA\csv_tables\movie_star_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');




