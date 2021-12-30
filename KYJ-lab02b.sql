CREATE DATABASE lab2;
USE lab2;
CREATE table artist(
artist_id INT UNSIGNED AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
genre VARCHAR(20),
`description` VARCHAR(255),
birth_date DATE,
gender ENUM('M', 'F'),
date_entered timestamp,
net_worth_million FLOAT,
PRIMARY KEY(artist_id)
);
INSERT INTO artist (first_name, last_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Brian', 'May', 'rock', 'Musician and astrophysicist', '1947/07/19', 'M', Now(), 210);
INSERT INTO artist (first_name, last_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('PJ', 'Harvey', 'alternative', 'A very talented artist', '1969/10/09', 'F', Now(), 3.5);

INSERT INTO artist (first_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Prince','pop', 'Singer, songwriter and dancer', '1958/06/07', 'M', Now(), 300);
INSERT INTO artist (first_name, last_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Dolores', 'O\'Riordan', 'alternative', 'Lead singer of the Cranberries', '1971/09/06', 'F', Now(), 25); 
INSERT INTO artist (first_name, last_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('George', 'Michael', 'pop', 'Lead singer of Wham!', '1963/06/25', 'M', Now(), 200);
INSERT INTO artist (first_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Adele', 'pop', 'A very talented artist', '1988/05/05', 'F', Now(), 185);
INSERT INTO artist (first_name, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Eminem', 'hip hop', 'Rapper, songwriter and actor', '1972/10/17', 'M', Now(), 210);
ALTER TABLE artist ADD country varchar(50) DEFAULT "U.K." AFTER last_name;
UPDATE artist SET country="U.S." WHERE first_name IN ("Prince", "Eminem");
UPDATE artist SET country="Ireland" WHERE first_name= "Dolores";
RENAME TABLE artist to artists;

#1. AS, DISTINCT, ORDER BY, SUBQUERY
#a. 
SELECT DISTINCT genre from artists;
#b. 
SELECT first_name, last_name from artists WHERE LOWER(first_name) LIKE "%a%";
#c. 
INSERT INTO artists (first_name, last_name, country, genre, `description`, birth_date, gender, date_entered, net_worth_million)
VALUES('Paul', 'Kim', 'Korea', 'Ballade', 'Korean singer from an audition program', '1988/02/11', 'M', Now(), 29.7);

#d.
SELECT first_name, last_name, country from artists WHERE country LIKE 'U___';
#e. 
SELECT first_name, last_name, country from artists WHERE country NOT LIKE 'U___';
#f.
ALTER TABLE artists ADD alive ENUM('Y', 'N') DEFAULT 'Y' AFTER birth_date;
UPDATE artists SET alive = 'N' WHERE first_name IN ("Prince", "Dolores", "George");
#g.
SELECT CONCAT(first_name, " ", IFNULL(last_name," ")) AS name, YEAR(CURDATE())-YEAR(birth_date) AS age FROM artists WHERE alive = 'Y' ORDER BY age ASC;
#the youngest living artists are Adele and Paul Kim, the oldest living artist is Brian May
#h. 
SELECT CONCAT(first_name, " ", IFNULL(last_name," ")) AS name, net_worth_million FROM artists WHERE alive = 'Y' AND net_worth_million > (SELECT AVG(net_worth_million) from artists) ORDER BY net_worth_million DESC;