CREATE TABLE spaces(space_id serial PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price INTEGER, user_id INTEGER,
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id)
      ON DELETE CASCADE);
