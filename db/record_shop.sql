DROP TABLE albums ;
DROP TABLE artists ;
-- DROP TABLE genres ;

CREATE TABLE artists {
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
  -- genre id REFRENCES genre(id)
}

CREATE TABLE albums {
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  review INT,

}

CREATE TABLE genre {
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  origins VARCHAR(255)
}
