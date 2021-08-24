To create the development and test databases and their respective tables
development database

CREATE DATABASE makersbnb;
CREATE TABLE users(user_id INTEGER PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(80));
CREATE TABLE spaces(space_id serial PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price INTEGER, user_id INTEGER,
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id)
      ON DELETE CASCADE);


test database
CREATE DATABASE makersbnb_test;
CREATE TABLE users(user_id INTEGER PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(80));
CREATE TABLE spaces(space_id serial PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price INTEGER, user_id INTEGER,
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id)
      ON DELETE CASCADE);