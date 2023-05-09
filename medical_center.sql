DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    doctor_id INTEGER REFERENCES doctors(id),
    diagnoses TEXT
);

INSERT INTO doctors (name)
VALUES ('Daniel Hammond'), ('Jane Crawford');

INSERT INTO patients (name)
VALUES ('Bentley Cooper'), ('Issac Bradford');

INSERT INTO visits (patient_id, doctor_id, diagnoses)
VALUES (1, 1, 'IBS'), (2, 1, 'Influenza'), (2, 2, 'CVID')