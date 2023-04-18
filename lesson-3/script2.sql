/* MySQL */

/* All albums, all songs */

SELECT Albums.name, Songs.name
FROM Songs
JOIN AlbumsSongs ON Songs.songId = AlbumsSongs.songId
JOIN Albums ON AlbumsSongs.albumId = Albums.albumId;

/* All songs of performer with `performerId` = 1 */

SELECT Performers.name, Albums.name, Songs.name, duration
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
WHERE Performers.performerId = 1;

/* Total duration of all albums */

SELECT Albums.name, SEC_TO_TIME(SUM(TIME_TO_SEC(duration)))
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
GROUP BY Albums.albumId;

/* All too long albums (the `HAVING` clause) */

SELECT Albums.name, SEC_TO_TIME(SUM(TIME_TO_SEC(duration))) AS totalDuration
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
GROUP BY Albums.albumId
HAVING totalDuration >= '00:45:00';

/* All too long albums of 'Ed Sheeran'
   (have used both `WHERE` and `HAVING` clauses) */

SELECT Performers.name, Albums.name, SEC_TO_TIME(SUM(TIME_TO_SEC(duration))) AS totalDuration
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
WHERE Performers.name = 'Ed Sheeran'
GROUP BY Performers.performerId, Albums.albumId
HAVING totalDuration >= '00:45:00';

/* Count of songs on each album */

SELECT Performers.name, Albums.name, COUNT(Songs.songId)
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
GROUP BY Performers.performerId, Albums.albumId;

/* Shortest song on each album */

SELECT Performers.name, Albums.name, MIN(Songs.duration)
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
GROUP BY Performers.performerId, Albums.albumId;

/* Longest song on each album */

SELECT Performers.name, Albums.name, MAX(Songs.duration)
FROM Performers
JOIN Albums ON Performers.performerId =Albums.performerId
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
GROUP BY Performers.performerId, Albums.albumId;
