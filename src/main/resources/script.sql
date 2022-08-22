INSERT INTO MOVIES (TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)
VALUES('Howard the Duck', 110, 'Sci-Fi', 4.6, 'PG');

INSERT INTO MOVIES (TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)
VALUES('Lavalantula', 83, 'Horror', 4.7, 'TV-14');

INSERT INTO MOVIES (TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)
VALUES('Starship Troopers', 129, 'Sci-Fi', 7.2, 'PG-13');

INSERT INTO movies (title, runtime, genre, imdb_score, rating)
VALUES ('Waltz With Bashir', 90, 'Documentary', 8.0, 'R');

INSERT INTO movies (title, runtime, genre, imdb_score, rating)
VALUES ('Spaceballs', 96, 'Comedy', 7.1, 'PG');

INSERT INTO movies (title, runtime, genre, imdb_score, rating)
VALUES ('Monsters Inc.', 92, 'Animation', 8.1, 'G');

INSERT INTO movies (title, runtime, genre, imdb_score, rating)
VALUES ('Burlesque', 119, 'Drama', 6.4, 'PG-13');

INSERT INTO movies (title, runtime, genre, imdb_score, rating)
VALUES ('Beetlejuice', 92, 'Comedy', 7.5, 'PG');

SELECT * FROM MOVIES
WHERE genre = 'Sci-Fi';

SELECT * FROM MOVIES
WHERE imdb_score >= 6.5;

SELECT * FROM MOVIES
WHERE rating = 'G' OR rating = 'PG' AND runtime < 100;

SELECT * FROM MOVIES
WHERE imdb_score < 7.5 GROUP BY genre, id;

UPDATE movies
SET rating = 'R'
WHERE title = 'Starship Troopers';

SELECT id, rating FROM movies
WHERE genre = 'Horror' OR genre = 'Documentary';

SELECT MIN(imdb_score), MAX(imdb_score), AVG(imdb_score), rating
FROM movies
GROUP BY rating;

SELECT MIN(imdb_score), MAX(imdb_score), AVG(imdb_score), rating
FROM movies
GROUP BY rating
HAVING COUNT(*)>1;

DELETE FROM movies
WHERE rating = 'R';