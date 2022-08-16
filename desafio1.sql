DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(3,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE artist(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE user(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(75) NOT NULL,
    age INT NOT NULL,
    signup_date DATE NOT NULL,
    plan_id INT NOT NULL,
		FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
) engine = InnoDB;

CREATE TABLE album(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    release_year INT,
    artist_id INT NOT NULL,
		FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

CREATE TABLE song(
	song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    length INT NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
		FOREIGN KEY (album_id) REFERENCES album (album_id),
        FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

CREATE TABLE onrepeat (
	user_id INT NOT NULL,
    song_id INT NOT NULL,
    played DATETIME,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
		FOREIGN KEY (user_id) REFERENCES user (user_id),
        FOREIGN KEY (song_id) REFERENCES song (song_id)
) ENGINE = InnoDB;

CREATE TABLE following (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
		FOREIGN KEY (user_id) REFERENCES user (user_id),
        FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

INSERT INTO plan (name, price)
VALUES
  ('gratuito', '0.00'),
  ('universitário', '5.99'),
  ('pessoal', '6.99'),
  ('familiar', '7.99');

INSERT INTO artist (name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO user (name, age, signup_date, plan_id)
VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 4),
  ('Martin Fowler', 46, '2017-01-17', 4),
  ('Sandi Metz', 58, '2018-04-29', 4),
  ('Paulo Freire', 19, '2018-02-14', 2),
  ('Bell Hooks', 26, '2018-01-05', 2),
  ('Christopher Alexander', 85, '2019-06-05', 3),
  ('Judith Butler', 45, '2020-05-13', 3),
  ('Jorge Amado', 58, '2017-02-17', 4);
    
INSERT INTO album (artist_id, title, release_year)
VALUES
	( 1, 'Renaissance', 2022),
  ( 2, 'Jazz', 1978),
  ( 2, 'Hot Space', 1982),
  ( 3, 'Falso Brilhante', 1998),
  ( 3, 'Vento de Maio', 2001),
  ( 4, 'QVVJFA?', 2003),
  ( 5, 'Somewhere Far Beyond', 2007),
  ( 6, 'I Put A Spell On You', 2012);
    
INSERT INTO song (album_id, artist_id, title, length)
VALUES
	(1, 1, 'BREAK MY SOUL', 279),
  (1, 1, 'VIRGO’S GROOVE', 369),
  (1, 1, 'ALIEN SUPERSTAR', 116),
  (2, 2, 'Don’t Stop Me Now', 203),
  (3, 2, 'Under Pressure', 152),
  (4, 3, 'Como Nossos Pais', 105),
  (5, 3, 'O Medo de Amar é o Medo de Ser Livre', 207),
  (6, 4, 'Samba em Paris', 267),
  (7, 5, 'The Bard’s Song', 244),
  (8, 6, 'Feeling Good', 100);
    
INSERT INTO onrepeat (user_id, song_id, played)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
    
INSERT INTO following (user_id, artist_id)
VALUES
	(1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
