DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  city_id INTEGER REFERENCES cities(id),
  country_id INTEGER REFERENCES countries(id)
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_id INTEGER REFERENCES locations(id),
  to_id INTEGER REFERENCES locations(id)
);

CREATE TABLE people
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
)

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  owner_id INTEGER REFERENCES people(id)
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights(id)
);