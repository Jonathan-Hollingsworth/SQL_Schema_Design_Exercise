DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums(id),
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id)
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  producer_id INTEGER REFERENCES producers(id)
);
