-- Represent artists on the app
CREATE TABLE `artists` (
    `id`INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(15) NOT NULL,
    `last_name` VARCHAR(15) NOT NULL,
    `stage_name` VARCHAR(35) NOT NULL,
    `birthday` DATE NOT NULL,
    PRIMARY KEY(`id`)
)

-- Represent the albums on the app
CREATE TABLE `albums` (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    number_of_songs INT UNSIGNED NOT NULL,
    release_date DATE NOT NULL,
    PRIMARY KEY(id)
)

-- Represent the musical genres
CREATE TABLE `genres` (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY(id)
)

-- Represent artists who worked on an album (Junction table between `albums` and `artists`)
CREATE TABLE `album_credits` (
    album_id INT UNSIGNED NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(album_id, artist_id),
    FOREIGN KEY(album_id) REFERENCES albums(id),
    FOREIGN KEY(artist_id) REFERENCES artists(id)
)

-- Represent genre/genres on an album (Junction table between `albums` and `genres`)
CREATE TABLE `album_genre` (
    genre_id INT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(album_id, genre_id),
    FOREIGN KEY(genre_id) REFERENCES genres(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
)


-- Represent the songs in the app
CREATE TABLE songs (
    id INT UNSIGNED AUTO_INCREMENT,
    album_id INT UNSIGNED, -- nulls allowed because not every song is part of an album
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
)

-- Represent what artists worked on a song, collaborations (Junction table between `songs` and `artists`)
CREATE TABLE song_credits (
    artist_id INT UNSIGNED NOT NULL,
    song_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(artist_id, song_id),
    FOREIGN KEY(artist_id) REFERENCES artists(id),
    FOREIGN KEY(song_id) REFERENCES songs(id)
)

-- Represent the playlists in the app
CREATE TABLE `playlists` (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY(id)
)

-- Represent the songs that are on a playlist (Junction table between `songs` and `playlists`)
CREATE TABLE `playlist_songs` (
    playlist_id INT UNSIGNED,
    song_id INT UNSIGNED,
    PRIMARY KEY(playlist_id, song_id),
    FOREIGN KEY(playlist_id) REFERENCES playlists(id),
    FOREIGN KEY(song_id) REFERENCES songs(id)
)

-- Indexes may need updating. Check after common queries are written.
CREATE INDEX name_search
ON artists (first_name, last_name, stage_name);

CREATE INDEX album_title_search
ON albums (title)

CREATE INDEX song_title_search
ON songs(title)

CREATE INDEX playlist_name
ON playlists(name)
