DROP TABLE albums ;
DROP TABLE genres ;
DROP TABLE artists ;


CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  about TEXT,
  image VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  origin VARCHAR(255)
);



CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  review VARCHAR(255),
  stock_level INT,
  cost_price INT,
  price INT,
  genre_id INT REFERENCES genres(id) ON DELETE CASCADE,
  image VARCHAR(255)
);
