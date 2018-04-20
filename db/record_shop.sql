DROP TABLE albums ;
DROP TABLE artists ;


CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  about TEXT
);



CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  review VARCHAR(255),
  stock_level VARCHAR(255),
  cost_price INT,
  price INT

);
