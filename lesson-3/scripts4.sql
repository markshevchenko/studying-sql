/* MySQL */

CREATE TABLE Videos
(
	songId INT NOT NULL PRIMARY KEY,
    uri VARCHAR(2048) NOT NULL
);

INSERT INTO Videos
(songId, uri)
VALUES
(16, 'https://youtu.be/iD2rhdFRehU'),
(25, 'https://youtu.be/rjAiojfJMxs'),
(48, 'https://youtu.be/aJg4OJxp-co');

SELECT Performers.name, Albums.name, Songs.name, Videos.uri
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
JOIN Videos ON Songs.songId = Videos.songId;

SELECT Performers.name, Albums.name, Songs.name, Videos.uri
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
LEFT JOIN Videos ON Songs.songId = Videos.songId;

SELECT Performers.name, Albums.name, Songs.name, Videos.uri
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
LEFT JOIN Videos ON Songs.songId = Videos.songId
WHERE uri IS NULL OR uri LIKE '%-%';

SELECT Performers.name, Albums.name, Songs.name,
       COALESCE(Videos.uri, 'https://youtu.be/ZcJjMnHoIBI')
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
LEFT JOIN Videos ON Songs.songId = Videos.songId;
