DROP TABLE albums ;
DROP TABLE artists ;


CREATE TABLE artists {
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)

}

CREATE TABLE albums {
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  review INT,

}

CREATE TABLE stocks {
  id SERIAL PRIMARY KEY,
  album_id id REFRENCES albums(id),
  origins VARCHAR(255)
}
