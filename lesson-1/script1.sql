/* MS SQL */

CREATE TABLE Songs
(
	performer CHAR(40) NOT NULL,
	year INT NOT NULL,
	albumType CHAR(20) NOT NULL,
	album CHAR(40) NOT NULL,
	name CHAR(80) NOT NULL,
	duration TIME NOT NULL
)