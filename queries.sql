-- Retrieves all songs of an artist.
SELECT artist, song_title
FROM songs_and_artists_view
WHERE artist = 'Dua Lipa'

-- Retrieves songs ordered from most streamed to least.
-- Optionally you can specify if you want to retrieve only the top 10.
SELECT song, GROUP_CONCAT(artist) AS `artist(s)`, streams
FROM songs_and_artists_view
GROUP BY song, streams
ORDER BY streams DESC
-- LIMIT 3;

-- Add a new artist
INSERT INTO `artists` (first_name, last_name, stage_name, birthday)
VALUES ('Armend', 'Bytyci', 'Armend24', '2003-06-24')

-- Add a new song
INSERT INTO `songs` (album_id, title, release_date, streams)
VALUES (1, 'Cool', '2020-03-27', 191691341);

-- Delete an artist
DELETE FROM artists
WHERE stage_name = 'Artist X'; -- can be any condition

-- Work in progress.
