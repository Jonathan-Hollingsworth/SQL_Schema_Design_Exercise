DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    current_ranking INTEGER UNIQUE NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams(id),
    team2_id INTEGER REFERENCES teams(id),
    referee_id INTEGER REFERENCES referees(id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(id),
    player_id INTEGER REFERENCES players(id)
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);