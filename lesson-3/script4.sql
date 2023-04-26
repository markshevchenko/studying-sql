/* MySQL */

CREATE TABLE Videos
(
	songId INT NOT NULL PRIMARY KEY,
    uri VARCHAR(2048) NOT NULL,
    duration TIME NOT NULL
);

INSERT INTO Videos
(songId, uri, duration)
VALUES
(16, 'https://youtu.be/iD2rhdFRehU', '00:04:51'),
(25, 'https://youtu.be/rjAiojfJMxs', '00:03:12'),
(48, 'https://youtu.be/aJg4OJxp-co', '00:03:02');

SELECT Performers.name, Albums.name, Songs.name, Songs.duration, Videos.duration
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
JOIN Videos ON Songs.songId = Videos.songId;

SELECT Performers.name, Albums.name, Songs.name, Songs.duration, Videos.duration
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
JOIN Videos ON Songs.songId = Videos.songId
WHERE Songs.duration > Videos.duration;

SELECT Performers.name, Albums.name, Songs.name, Songs.duration, Videos.duration
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
LEFT JOIN Videos ON Songs.songId = Videos.songId;

SELECT 1 = 1;
SELECT 1 = NULL;
SELECT NULL = NULL;
SELECT NULL = NULL IS NULL;

SELECT 0 AND 0
UNION ALL
SELECT 0 AND 1
UNION ALL
SELECT 1 AND 1
UNION ALL
SELECT 0 AND NULL
UNION ALL
SELECT 1 AND NULL
UNION ALL
SELECT NULL AND NULL;

SELECT 0 OR 0
UNION ALL
SELECT 0 OR 1
UNION ALL
SELECT 1 OR 1
UNION ALL
SELECT 0 OR NULL
UNION ALL
SELECT 1 OR NULL
UNION ALL
SELECT NULL OR NULL;

SELECT Performers.name, Albums.name, Songs.name,
       COALESCE(Videos.duration, '00:00:00')
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
LEFT JOIN Videos ON Songs.songId = Videos.songId;
