To create the development and test databases and their respective tables
development database

CREATE DATABASE makersbnb;
CREATE TABLE users(user_id serial PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(80));
CREATE TABLE spaces(id INTEGER PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price INTEGER, user_id SERIAL REFERENCES users(user_id));


test database
CREATE DATABASE makersbnb_test;
CREATE TABLE users(user_id serial PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(80));
CREATE TABLE spaces(id INTEGER PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price INTEGER, user_id SERIAL REFERENCES users(user_id));