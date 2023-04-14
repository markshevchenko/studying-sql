/* Postgres */

CREATE TABLE AlbumTypes
(
	albumType VARCHAR(20) NOT NULL PRIMARY KEY
);

INSERT INTO AlbumTypes
(albumType)
VALUES
('CD'),
('Single'),
('EP');

CREATE TABLE Albums
(
	albumId INT NOT NULL PRIMARY KEY,
	performerId INT NOT NULL,
	albumType VARCHAR(20) NOT NULL,
	name VARCHAR(80) NOT NULL,
	year INT NOT NULL,
	CONSTRAINT fkPerformer
		FOREIGN KEY (performerId)
		REFERENCES Performers(performerId),
	CONSTRAINT fkAlbumType
		FOREIGN KEY (albumType)
		REFERENCES AlbumTypes(albumType)
);

INSERT INTO Albums
(albumId, performerId, albumType, name, year)
VALUES
(1, 1, 'CD', '+', 2011),
(2, 1, 'CD', '×', 2014),
(3, 1, 'Single', 'The A Team', 2011),
(4, 1, 'Single', 'Drunk', 2012),
(5, 2, 'CD', 'Nothing but Thieves', 2015),
(6, 2, 'Single', 'To Fly You''ve Got to Fall', 2012),
(7, 3, 'EP', 'Black Smoke Rising', 2017),
(8, 3, 'CD', 'Anthem of the Peaceful Army', 2018);

