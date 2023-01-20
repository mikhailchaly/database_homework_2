CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS singer (
	singer_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS singer_genre (
	singer_id INTEGER REFERENCES singer(singer_id),
	genre_id INTEGER REFERENCES genre(genre_id),
	CONSTRAINT sg PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	title_album VARCHAR(40) NOT NULL,
	album_release_year DATE NOT NULL	
);

CREATE TABLE IF NOT EXISTS singer_album (
	singer_id INTEGER REFERENCES singer(singer_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT sa PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(40) NOT NULL,
	track_duration INTERVAL NOT NULL	
);

CREATE TABLE IF NOT EXISTS colection (
	colection_id SERIAL PRIMARY KEY,
	colection_name VARCHAR(40) NOT NULL,
	colection_release_year DATE NOT NULL	
);

CREATE TABLE IF NOT EXISTS colection_track_album (
	colection_id INTEGER REFERENCES colection(colection_id),
	track_id INTEGER REFERENCES track(track_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT cta PRIMARY KEY (colection_id, track_id, album_id)
);