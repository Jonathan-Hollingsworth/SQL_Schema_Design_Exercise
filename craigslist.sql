DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    pref_regi_id INTEGER REFERENCES regions(id)
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts_categories
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    category_id INTEGER REFERENCES categories(id)
);