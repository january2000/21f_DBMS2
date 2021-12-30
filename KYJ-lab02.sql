#a
#1.
#a.
CREATE DATABASE lab2;
USE lab2;
#b.
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
#c.
ALTER TABLE artist ADD country varchar(50) DEFAULT "U.K." AFTER last_name;
#d.
UPDATE artist SET country="U.S." WHERE first_name IN ("Prince", "Eminem");
UPDATE artist SET country="Ireland" WHERE first_name= "Dolores";
#e.
RENAME TABLE artist to artists;
#f.
SELECT first_name, last_name, genre FROM artists WHERE gender="F" AND birth_date>"1960/01/01";
#g.
SELECT first_name, last_name, net_worth_million FROM artists WHERE net_worth_million>100;
#h.
SELECT first_name, last_name FROM artists WHERE `description` Like '%lead singer%' AND genre = "pop";